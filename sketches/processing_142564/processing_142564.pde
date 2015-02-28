
class MidpointDisplacementMapGenerator 
{
    
    int size;
    float d;
    float map[][];
    
    public MidpointDisplacementMapGenerator(int setSize, float displacement)
    {
        size = setSize;
        map = new float[size][size];
        // the value the displacement changes with each recursion
        // each recursion cuts the width in half, so a sensible value
        // may be 2. a value of 1. makes it very noisy, 
        // but all values > 0 are possible
        d = displacement;
    }
    
    // set the center point and the top, left, right and lower point 
    // and recurse over the 4 new squares
    void divide (x1, y1, x2, y2, dh) 
    {
        var dx = x2-x1,
            dy = y2-y1,
            cx = x1+dx/2,
            cy = y1+dy/2,
            d2 = dh/2;
        
        if (dx > 1) 
        {
            // generate center pt
            map[cy][cx] = (map[y1][x1] + map[y2][x2] + map[y1][x2] + map[y2][x1])/4 + Math.random() * dh - d2;
        

        
            // generate top, bottom, left and right pts
            if (map[y1][cx] === undefined) map[y1][cx] = (map[y1][x1] + map[y1][x2])/2 + Math.random() * dh - d2;
            if (map[y2][cx] === undefined) map[y2][cx] = (map[y2][x1] + map[y2][x2])/2 + Math.random() * dh - d2;
            if (map[cy][x1] === undefined) map[cy][x1] = (map[y1][x1] + map[y2][x1])/2 + Math.random() * dh - d2;
            if (map[cy][x2] === undefined) map[cy][x2] = (map[y1][x2] + map[y2][x2])/2 + Math.random() * dh - d2;
            
            var nh = dh/d;

            // recurse!
            divide(x1, y1, cx, cy, nh);
            divide(cx, y1, x2, cy, nh);
            divide(x1, cy, cx, y2, nh);
            divide(cx, cy, x2, y2, nh);
        }
    }

    // adjusts values to between 0 and mdiff (e.g. 0 and 255 for drawing)
    float[][] adjust(float[][] map, float mdiff) 
    {
        float s = null;
        float b = null;
        float d = null;
        
        for (int y=0; y < map.length; y++)
        {
            for (int x=0; x < map[y].length; x++) 
            {
                if (map[y][x] < s || s == null)
                {
                    s = map[y][x];
                }

                if (map[y][x] > b || b == null)
                {
                    b = map[y][x];
                }
            }
        }
        
        d = b-s;
        
        for (int y=0; y < map.length; y++)
        {
            for (int x=0; x<map[y].length; x++) 
            {
                map[y][x] = (map[y][x]-s) / d * mdiff;
            }
        }
        
        return map;
    }
    
    // prepare
    float[][] generate (ceil) 
    {
        for (var i=0; i<size; i++)
            map[i] = [];
        
        // preset the corner values
        map[0][0] = Math.random();
        map[0][size-1] = Math.random();
        map[size-1][0] = Math.random();
        map[size-1][size-1] = Math.random();
        
        // start

        divide(0, 0, size-1, size-1, 1);

        return adjust(map, ceil);
    }        
    
    
    // prepare
    float[][] generateIsland (int ceil, int isHeight) 
    {
        //initialize!
        for (var i=0; i<size; i++)
        {
            map[i] = [];
        }
        
        // preset the corner values
        map[0][0] = Math.random();
        map[0][size-1] = Math.random();
        map[(size-1)/4][(size-1)/4] = isHeight;
        map[size-1][0] = Math.random();
        map[size-1][size-1] = Math.random();
        
        // start

        divide(0, 0, size-1, size-1, 1);

        return adjust(map, ceil);
    }
    
}
// Pressing Control-R will render this sketch.


MidpointDisplacementMapGenerator depthgen;
MidpointDisplacementMapGenerator humigen;
MidpointDisplacementMapGenerator tempgen;

int waterlevel = 128;
int worldSize = 513;

int worldHeightVariance = 220;
int worldhumidityVariance = 255;
int worldTemperatureVariance = 188;


void setup() 
{  
    size(worldSize , worldSize ); 

    strokeWeight(1);

    //TGR : ONLY WORKS WITH POW2 + 1 (ie) 9, 17, 33, 65, 129,  257, 513, etc
    depthgen = new MidpointDisplacementMapGenerator(worldSize , 1.7); //second paramater is feature density
    humigen = new MidpointDisplacementMapGenerator(worldSize , 2.1); //humidity fields are big and roundy
    tempgen = new MidpointDisplacementMapGenerator(worldSize , 1.5); //temperature fields are pretty sharp
    
    var depthmap = depthgen.generate(worldHeightVariance);
    var hummap = humigen.generate(worldhumidityVariance );
    var tempmap = tempgen.generate(worldTemperatureVariance); //there is a somewhat moderate temperature gradient on habitable planets
    background(0);

    for(int x = 0; x < 513; x++)
    {
        for(int y = 0; y < 513; y++)
        {
            int height = Math.ceil(depthmap[x][y]);
            
            //temperature is low high up
            int temperature = Math.max(0, tempmap[x][y] - height);

            //humidity is lower on high altitude because the temperature and the air pressure are possibly higher there.            
            //chosen to take an offset for humidty (180-height rather than 255 - height)
            int humidity = Math.max((180-height) - (Math.ceil(hummap[x][y])-Math.ceil(temperature /3)));

            stroke(height/4,height/2,height/8);
            point(x, y);    
            
            if(height < waterlevel)
            {
                float depth = waterlevel - height;
                stroke(0,0,255, depth*2);
                point(x,y);
            }
            
            stroke(255, 0, 0, temperature);
            point(x, y);
        }
    }

    
      
    // smooth edges
    smooth();
    
    // limit the number of frames per second
    frameRate(30);

} 

void draw() {  // this is run repeatedly.  

}
