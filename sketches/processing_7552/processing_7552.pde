
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;
public boolean flip= true;
public int showpic = 2;
PImage b;
public float maxheight = 60;
public float nowheight = 30; 
public color n;
PGraphics a;
public int w,wr,h,hr;
  public color c;
  import processing.opengl.*;

void setup(){

if (showpic==2)b = loadImage("up.png");
if (showpic==1)b = loadImage("hse.png");
  wr = int(b.width/4);
  hr= int(b.height/4);
// b.resize(wr,hr);
 w = 600;
  h= 300;
//w= b.width;
//h= b.height;
  size(600,300,P3D); //OPENGL does not have the shearing that occurs with P3D
// smooth();
 //hint(ENABLE_OPENGL_4X_SMOOTH);
  loadPixels();
  lights();
  a = createGraphics(w,h,P3D);
  cam = new PeasyCam (this,width);

  a.loadPixels();
  a.beginDraw();
  c = b.pixels[0];
  for (int x=0;x<b.pixels.length;x++){
  if (!flip){
    if (b.pixels[x]==c ){
    a.pixels[x]=b.pixels[x];
   } 
  }
  
  if (flip){
     if (b.pixels[x]!=c){
    a.pixels[x]=b.pixels[x];
   }
    
  }
    
  }
  
  a.updatePixels();
  a.endDraw();
  
  
}


void keyPressed(){
  if(key=='1'){
 showpic = 1;
   setup();
    
  }
  
   if (key=='2'){
  showpic = 2;
   setup();
    
  }
  
 if (key=='f')
 {flip = !flip;
setup();
 }
 
 if (key=='v'){
  //arraycopy(b.pixels,pixels); 
  //updatePixels();
  image(b,0,0); // more stable
 }
 
 if (!online){
  if ( key =='s'){
    save("transit.png");
  }
   
 }
  
}







void draw(){
 
  translate(-width/3-150,-height/2+25,300);
  background(-1);
for (float z=0;z<nowheight;z+=0.1){
 translate(0,0,0.1);
  image(a,0,0);
}

}

