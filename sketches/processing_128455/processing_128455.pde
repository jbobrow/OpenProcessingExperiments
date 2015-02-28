
//Another image filter
//Ale González, 2014

boolean _ = true; PImage i; PGraphics c;
 
void setup()
{
    size(800, 800, JAVA2D);
    i = loadImage("d.jpg");
    c = f_bw(i, #330000, 0x15ddffff, 350, 3, 4);
    background(i);
}
  
void draw() 
{    /*********************/    }

void mouseClicked()
{    background((_=!_)?i:c);    }
   
PGraphics f_bw(PImage I, int BG, int FG, int R, int r, int t)
{
    PGraphics canvas = createGraphics(I.width, I.height, JAVA2D);
    canvas.beginDraw();
    canvas.smooth();
    canvas.background(BG);
    canvas.fill(FG);
    canvas.noStroke();
    
    int cx = I.width/2, cy = I.height/2, val, px, py;
    float f = QUARTER_PI;
    for (int i = 1; i < R; i += r, f = QUARTER_PI/i) 
        for (float j = 0; j < TWO_PI; j += f) 
        {
            px = int(cx + i * cos(j));
            py = int(cy + i * sin(j));
            val = (I.get(px, py)&255)>>t;
            canvas.ellipse(px, py, val, val);
        }  
    canvas.endDraw();
    return canvas;
}

