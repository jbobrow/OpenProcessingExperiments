
PGraphics buf;
 
void setup()
{
    size(500,500);
    background(255);
    smooth();
    noStroke();
   
    PImage  img;
    img = loadImage("cat.png");
    buf = createGraphics(width, height, P2D);
    buf.beginDraw();
    buf.background(255);
    buf.image(img, 0, 0,width,height);
    buf.loadPixels();  
    
 
}
int fn = 0;
 
void draw()
{
  float secs = millis()*.001;

  blend(0,0,width,height,-1,-1,width+1,height+1,BLEND); 
  for (int n = 0; n < 800; ++n) {

    int x = (int) random(0,width-2);
    int y = (int) random(0,height-2);
 
    int clr = buf.pixels[y*width+x];
    int rr = (clr >> 16) & 0xff;
    int gg = (clr >> 8) & 0xff;
    int bb = (clr >> 0) & 0xff;
 
    
    float rn = noise(x*.0025+secs,y*.01+secs*.5);

 

    float cVar = rn*200-100;
    rr = (int) constrain( rr+cVar, 0, 255);
    gg = (int) constrain( gg+cVar, 0, 255);
    bb = (int) constrain( bb+cVar, 0, 255);
 
  
    clr = 0xff000000 | (rr << 16) | (gg << 8) | (bb);
    fill(clr);
 
   
    pushMatrix();
    translate(x,y);
 
    ellipse(0, 0, 2,3);
   
    popMatrix();
  }
}
 



