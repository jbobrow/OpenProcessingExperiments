
int max_iter = 100,lastX = 0,lastY = 0;
double zoom = 150, zoom_incr = 1000, zx, zy, cX, cY, tmp, posX = 0,posY = 0;
float bg = 0.5;
boolean doZoom = false;

void setup()
{
    size(500, 500);
    colorMode(HSB,1);
    background(bg);
    generate();
    textSize(20);
    fill(0,0,1);
}

void generate()
{    
    loadPixels();
    int x,y;
    for (int i=0; i<pixels.length; i++)
    {
        x = i % width;
        y = floor(i / width);
        zx = zy = 0;
        cX = (x - width/2) / zoom  - posX;
        cY = (y - height/2) / zoom  - posY;
        int iter = max_iter;
        while (zx * zx + zy * zy < 4 && iter > 0)
        {
            tmp = zx * zx - zy * zy + cX;
            zy = 2 * zx * zy + cY;
            zx = tmp;
            iter--;
        }
        float h = (float)iter/max_iter+bg;
        pixels[i] = color((h > 1) ? h-1 : h,1,(float)iter/max_iter);
    }
    updatePixels();
}
 
void onKey()
{
    if (key == ' ') doZoom = true;
}

void mousePressed()
{
    posX += (width/2 - mouseX) / zoom;
    posY += (height/2 - mouseY) / zoom;
}

void draw()
{
    if (keyPressed) onKey();
    background(bg,1,1);
    generate();
    text("Zoom: " + zoom, 10, 22);
    text("Pos: (" + nf((float)posX, 0, 5) + "," + nf((float)posY, 0, 5) + ")", 10, 44);
    if (doZoom) zoom += zoom_incr;
    else {
        text("Pick a location with the mouse and", 10, 66);
        text("hit space to start zooming!", 10, 88);
    }
}
