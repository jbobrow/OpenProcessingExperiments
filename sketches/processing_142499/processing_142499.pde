
float fx = 0;
float fy = 0;
int count;

int resolution = 24;
 
void setup() { 
    colorMode(HSB, 100);
    background(0,100,0);
    size(800, 800);


    
     
     
    loadPixels();
    color c;
    for (int i = 0; i < pixels.length; i++)
    {
        float startcx = 3.0 * (float(i % width) / width) - 2; //This provides a virtual x window from -2 to 1.
        float startcy = 3.0 * (float(floor(float(i)/width))/height) - 1.5; //This provides a virtual x window of -2 to 2.
        float mandelvalue = mandel(startcx,startcy);
        //println("cx ",startcx," cy ",startcy," count ",count," mandel ",mandelvalue);
        if  (mandelvalue < 2)
        {
            c = color(0,100,0);
        }
        else
        {
            c = color(10+2*count,100,count*8);
            
            //println(mandelvalue," ",10*log(mandelvalue));
        }
        
     
        pixels[i] = c;
    }
    updatePixels();
}
 
void draw() 
{
}
 
float mandel(float startcx, float startcy)
{
    float xm = 0;
    float ym = 0;
    count = 0;
    fx = 0;
    fy = 0;
    while ( (count < resolution) && (fx*fx+fy*fy < 4))
    {
        func(xm,ym,startcx,startcy);
        xm = fx;
        ym = fy;
        //print("count ",count," fx^2+fy^2 ",fx*fx+fy*fy);
        count++;
    }
    //println();
    
    return sqrt(fx*fx + fy*fy);
}
 
void func(float x, float y, float startcx, float startcy)
{
    // this squares the complex number x+yi, and then adds the constant
    fx = x*x - y*y + startcx;
    fy = 2*x*y + startcy;
}

