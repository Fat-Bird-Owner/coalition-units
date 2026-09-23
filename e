const GenerateFilter = Java.type("mindustry.maps.filters.GenerateFilter");
const NoiseFilter = Java.type("mindustry.maps.filters.NoiseFilter");
const OreFilter = Java.type("mindustry.maps.filters.OreFilter");
const ClearFilter = Java.type("mindustry.maps.filters.ClearFilter");
const ScatterFilter = Java.type("mindustry.maps.filters.ScatterFilter");
const BlendFilter = Java.type("mindustry.maps.filters.BlendFilter");
const OreMedianFilter = Java.type("mindustry.maps.filters.OreMedianFilter");
const MedianFilter = Java.type("mindustry.maps.filters.MedianFilter");
const DistortFilter = Java.type("mindustry.maps.filters.DistortFilter");
const LogicFilter = Java.type("mindustry.maps.filters.LogicFilter");
const EnemySpawnFilter = Java.type("mindustry.maps.filters.EnemySpawnFilter");

const Tiles = Java.type("mindustry.world.Tiles");
const Blocks = mindustry.content.Blocks;

function block(id){
    return Vars.content.block(id);
}

function noise(seed, scl, threshold, octaves, falloff, tilt, floor, wall, target){
    let f = new NoiseFilter();

    f.seed = seed;
    f.scl = scl;
    f.threshold = threshold;
    f.octaves = octaves;
    f.falloff = falloff;
    f.tilt = tilt;

    if(floor != null) f.floor = floor;
    if(wall != null) f.block = wall;
    if(target != null) f.target = target;

    return f;
}

function ore(seed, scl, threshold, octaves, falloff, tilt, ore, target){
    let f = new OreFilter();

    f.seed = seed;
    f.scl = scl;
    f.threshold = threshold;
    f.octaves = octaves;
    f.falloff = falloff;
    f.tilt = tilt;
    f.ore = ore;

    if(target != null) f.target = target;

    return f;
}

function clear(seed, target, replace, ignore){
    let f = new ClearFilter();

    f.seed = seed;
    f.target = target;
    f.replace = replace;

    if(ignore != null) f.ignore = ignore;

    return f;
}

function scatter(seed, chance, flooronto, block, floor){
    let f = new ScatterFilter();

    f.seed = seed;
    f.chance = chance;

    if(flooronto != null) f.flooronto = flooronto;
    if(block != null) f.block = block;
    if(floor != null) f.floor = floor;

    return f;
}

function blend(seed, radius, block, floor, ignore){
    let f = new BlendFilter();

    f.seed = seed;
    f.radius = radius;
    f.block = block;
    f.floor = floor;
    f.ignore = ignore;

    return f;
}

function oreMedian(seed, radius, percentile){
    let f = new OreMedianFilter();

    f.seed = seed;
    f.radius = radius;
    f.percentile = percentile;

    return f;
}

function median(seed, radius){
    let f = new MedianFilter();

    f.seed = seed;
    f.radius = radius;

    return f;
}

function distort(seed, scl, mag){
    let f = new DistortFilter();

    f.seed = seed;
    f.scl = scl;
    f.mag = mag;

    return f;
}

function logic(seed, code, loop){
    let f = new LogicFilter();

    f.seed = seed;
    f.code = code;
    f.loop = loop || false;

    return f;
}

function enemySpawn(seed, amount){
    let f = new EnemySpawnFilter();

    f.seed = seed;
    f.amount = amount;

    return f;
}


function generateMap(seed){

    let tiles = Vars.world.tiles;

    let coreZone = Blocks.coreZone;
    let empty = Blocks.air;
    let stone = Blocks.stone;
    let metalFloor = Blocks.metalFloor;
    let metalTiles1 = Blocks.metalTiles1;
    let metalTiles4 = Blocks.metalTiles4;
    let stoneWall = Blocks.stoneWall;
    let crystalFloor = block("crystal-floor");

    let filters = [

        noise(
            208753111 + seed,
            77.345,
            0.59999996,
            3.0149999,
            0.5,
            -2.72,
            Blocks.empty,
            Blocks.air,
            coreZone
        ),

        ore(
            23028692 + seed,
            42.414997,
            0.79999995,
            1.9799999,
            0.29999998,
            0.04,
            block("gr-gier-copper-ore"),
            coreZone
        ),

        ore(
            477795425 + seed,
            39.92,
            0.79999995,
            1.9799999,
            0.29999998,
            0.04,
            block("gr-gier-lead-ore"),
            coreZone
        ),

        ore(
            785080907 + seed,
            27.445,
            0.79999995,
            1.9799999,
            0.29999998,
            0.04,
            block("gr-gier-graphite-ore"),
            coreZone
        ),

        clear(
            621696596 + seed,
            coreZone,
            stone
        ),

        noise(
            678268190 + seed,
            134.73,
            0.61,
            2.07,
            0.5,
            -0.08,
            Blocks.stone,
            Blocks.stoneWall,
            Blocks.air
        ),

        noise(
            194741983 + seed,
            74.85,
            0.575,
            3.0149999,
            0.5,
            -0.12,
            metalTiles1,
            Blocks.stoneWall,
            stone
        ),

        clear(
            18666302 + seed,
            metalFloor,
            stone
        ),

        clear(
            78225031 + seed,
            metalTiles1,
            stoneWall
        ),

        clear(
            305679418 + seed,
            metalTiles1,
            stone
        ),

        noise(
            133757446 + seed,
            57.385,
            0.74,
            3.0149999,
            0.5,
            0,
            block("carbon-stone"),
            block("carbon-wall"),
            stone
        ),

        noise(
            422066026 + seed,
            57.385,
            0.59499997,
            3.0149999,
            0.5,
            -0.04,
            block("beryllic-stone"),
            block("beryllic-stone-wall"),
            stone
        ),

        noise(
            450427676 + seed,
            57.385,
            0.58,
            3.0149999,
            0.5,
            -0.04,
            Blocks.basalt,
            block("gr-char-wall"),
            stone
        ),

        ore(
            319715582 + seed,
            32.434998,
            0.83,
            1.9799999,
            0.29999998,
            -0.04,
            block("gr-gier-copper-ore"),
            Blocks.air
        ),

        ore(
            468483861 + seed,
            34.93,
            0.83,
            1.9799999,
            0.29999998,
            -0.08,
            block("gr-gier-lead-ore"),
            Blocks.air
        ),

        ore(
            132014688 + seed,
            27.445,
            0.82,
            1.9799999,
            0.29999998,
            -0.08,
            block("gr-gier-graphite-ore"),
            Blocks.air
        ),

        ore(
            320427063 + seed,
            29.939999,
            0.85499996,
            1.9799999,
            0.29999998,
            -0.04,
            Blocks.oreTitanium,
            Blocks.air
        ),

        ore(
            701037059 + seed,
            42.414997,
            0.84999996,
            1.9799999,
            0.29999998,
            0.59999996,
            Blocks.oreBeryllium,
            Blocks.air
        ),

        ore(
            764377626 + seed,
            42.414997,
            0.875,
            1.9799999,
            0.29999998,
            0.59999996,
            block("gr-depleted-thorium-ore"),
            Blocks.air
        ),

        scatter(
            919964088 + seed,
            0.044999998,
            stone,
            Blocks.boulder
        ),

        logic(
            74937831 + seed,
            "setblock ore @air 0 0 @derelict 0\n",
            false
        ),

        clear(
            976638273 + seed,
            block("gr-depleted-thorium-ore"),
            crystalFloor,
            Blocks.air
        ),

        blend(
            217225082 + seed,
            2.07,
            Blocks.oreBeryllium,
            block("beryllic-stone"),
            Blocks.air
        ),

        blend(
            823221315 + seed,
            1.7099999,
            crystalFloor,
            block("crystalline-stone"),
            Blocks.air
        ),

        clear(
            81918528 + seed,
            metalTiles4,
            metalFloor
        ),

        oreMedian(
            673565435 + seed,
            4.18,
            0.255
        ),

        distort(
            912370982 + seed,
            3.9799998,
            10.945
        ),

        median(
            808426564 + seed,
            2.97
        ),

        logic(
            880022518 + seed,
            "op rand count 0 b\n" +
            "op rand x @mapw b\n" +
            "op rand y @maph b\n" +
            "set midx 427\n" +
            "set midy 427\n" +
            "op sub opx midx x\n" +
            "op sub opy midy y\n" +
            "op len len opx opy\n" +
            "jump 1 lessThanEq len 375\n" +
            "getblock block sb x y\n" +
            "getblock floor s x y\n" +
            "jump 13 notEqual sb @air\n" +
            "jump 14 notEqual s @empty\n" +
            "jump 1 always s @empty\n" +
            "getblock block s x y\n" +
            "jump 18 notEqual s null\n" +
            "end\n" +
            "jump 21 lessThanEq count 3\n" +
            "setblock ore @spawn x y @derelict 0\n" +
            "jump 21 always count 0\n" +
            "setblock block @gr-vail x y 5 0\n" +
            "op add count count 1\n" +
            "jump 1 lessThanEq count 13\n" +
            "stop\n" +
            "jump 23 always count 0\n",
            true
        ),

        enemySpawn(
            312936107 + seed,
            3
        ),

        scatter(
            99333562 + seed,
            0.24,
            metalFloor,
            Blocks.air,
            block("metal-floor-damaged")
        ),

        noise(
            496961975 + seed,
            54.89,
            0.76,
            2.61,
            0.385,
            -0.04,
            block("gr-oil-tile"),
            Blocks.air,
            stone
        ),

        noise(
            973529654 + seed,
            44.91,
            0.825,
            3.24,
            0.385,
            -0.04,
            Blocks.hotrock,
            Blocks.air,
            Blocks.basalt
        ),

        scatter(
            786270609 + seed,
            0.015,
            stone,
            Blocks.boulder
        ),

        scatter(
            441094266 + seed,
            0.01,
            block("carbon-stone"),
            block("carbon-boulder")
        ),

        scatter(
            324551360 + seed,
            0.015,
            block("beryllic-stone"),
            block("beryllic-boulder")
        ),

        scatter(
            84105684 + seed,
            0.015,
            Blocks.basalt,
            block("ferric-boulder")
        ),

        scatter(
            898834306 + seed,
            0.015,
            block("beryllic-stone"),
            block("crystal-orbs")
        ),

        blend(
            904467482 + seed,
            1.485,
            block("magmarock"),
            Blocks.basalt,
            Blocks.space
        )
    ];

    let input = new GenerateFilter.GenerateInput();

    input.begin(
        tiles.width,
        tiles.height,
        function(x, y){
            return tiles.getn(x, y);
        }
    );

    for(let i = 0; i < filters.length; i++){
        filters[i].apply(tiles, input);
    }
}
