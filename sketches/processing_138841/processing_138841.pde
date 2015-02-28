
/*

Theme of work: TURNING POINT
By Bassey Ndon
This is a sketch showing how our experiences and issues of life keep moving until it is interrupted. 

I created this with the thought  of interacting with the work as it relates to life.

The viewer interacts with the work by moving the mouse.

Move Mouse to get  a better result
Drag mouse around to reveal background
press key "b" to hear sound


*/
//add audio
//import minim library files
import ddf.minim.*;

///declare declare global variables
// declare audio

Minim minim;
AudioSample ringout;
//

//insert bolean
final boolean CHECKER = true;

//declare image colour
 PImage tex;
int CW=80, CH=50;
color clut[][] = new color[CH][CW];
////////
 color strokeColor = color (360,20);
 //////////
float theta=0.f;
 
 
 // create set up
void setup()
{
  size(800,600);
  generate_clut();
  
  // working with text
  PFont georgio = loadFont ("georgio.vlw");
  String hw ="Tower of Babel by Bassey Ndon";
  textFont(georgio);
  fill(#7C8618);
  textSize(15);
  textAlign (RIGHT, TOP);
  text ("hw",width/2,height/2);
  ///////sound file called upon
  minim = new Minim(this);
  ringout = minim.loadSample("ringout.wav");
  
  /////
}
 
// Computes a simple checker pattern
void generate_clut()
{
  
  if(!CHECKER)
  {
    tex = loadImage("bip.jpg");
    clut = new color[CH=tex.height*2][CW=tex.width];
  }
   
  for(int h=0; h<CH; h++) for(int w=0; w<CW; w++)
  {
    if(CHECKER)
    {
      if((w < CW/2 && h < CH/2) || (h <= CH/2 && w <= CW/2))
        clut[h][w] = #0A2D71;
      else
        clut[h][w] = #CB7E2F;
        
             }
     
    else  clut[h][w] = tex.get(w,h); // Same as texture
  }
}
 // draw
void draw()
{
  background(#2753C9);
   ////////////////////////
   if (mousePressed){
  pushMatrix();
  translate(width/2,height/2);
  int circleResolution = (int)map(mouseY+200, 0, height,2,10);
  int radius = mouseX-width/3;
  float angle = TWO_PI/circleResolution;
 
  //style
 strokeWeight(3);
 stroke(random(strokeColor));
 // make shape
 beginShape();
   for (int i=0; i<=circleResolution; i++){
     float x=0+sin(angle*i*PI)*radius;
     float y=0+cos(angle*i*PI)*radius;
     vertex(x,y);
   }
 endShape();
 popMatrix();
}  
   
   
   /////////////////////
  final float vamp = float(mouseY-height/2) / (float)height*9;
  final float roto = (float)mouseX / (float)width*4;
   ////////////
  if (mousePressed) {
  pushMatrix ();
 translate (width/2,height/2);
 
 //map(value, start1, stop1,start2,stop2);
 
 int circleResolution = (int) map(mouseY+100,0,height,2,10);
 int radius = mouseX-width/2;
 float angle= TWO_PI/circleResolution;

//style 2
strokeWeight(3);


beginShape();
for (int i=0; i<=circleResolution; i++) { 
  float x =0 + cos(angle*i) * radius;
  float y= 0 + sin(angle*i) * radius;
  vertex(x,y);
}
endShape();
popMatrix();
}



   
   ////////////Spin and move
   
  loadPixels();
  for(int v=0;v<height;v++)
  {
    float fv = (float)v/(float)height;
    float x[] = new float[4];
    for(int i=0; i<4; i++)
      x[i] = sin(vamp * fv + roto + theta + radians(120)*i);
       
    rasterScan(v, x);
  }
  updatePixels();
   
  theta += 0.035f;
}
 // place Rastercan
void rasterScan(int v, float x[])
{
  // Map x[i] to the range 0...1
  for(int i=0; i<4; i++)
    x[i] = x[i]/2.f+.5f;
   
  // Line colours
  int lum[] = new color[4];
  for(int i=0; i<4; i++)
  {
    float len = 0.25+abs( x[i] - x[(i+1)%4] );
    lum[i] = 255 - int( len * 255.f );
  }
   
  // Transform x[i] to clip coordinates
  for(int i=0; i<4; i++)
    x[i] = x[i] * width;
   
  // Draw
  for(int i=0; i<4; i++)
  {
    if(x[i] >= x[(i+1)%4])  continue;
    texLine(int(x[i]), int(x[(i+1)%4]), v, lum[i]);
  }
}
 
void texLine (int x1, int x2, int v, int l)
{
  // Linearly interpolate across x1...x2
  for(int x=x1; x<x2; x++)
  {
    int dx = abs(x2 - x1);
    color clt = clut[v%CH][int( float(x-x1) / (float)dx * CW*(4+((CW+1)%4)) ) % CW];
    pixels[x+v*width] =
      color(red(clt)-l, green(clt)-l, blue(clt)-l);
  }
}
//////////////
//create a key trigger
void keyPressed () { 
  if (key == 'b') ringout.trigger();
  if (key == 'b')  println ("sample triggered");
}


////////////

