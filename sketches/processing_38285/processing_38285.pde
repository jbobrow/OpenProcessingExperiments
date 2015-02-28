
//import processing.pdf.*;

  PShape b;
  PShape c;
  PShape d;
  float size;
  void setup(){
  smooth();
  size = 500;
  size(1200,1000);//,PDF ,"Wallpaper.pdf");
  background(#C99E5D);
  b = loadShape("Fats.svg");
  c = loadShape("FatsArms.svg");
  d = loadShape("wallpaper.svg");
  }
  void draw(){
  float spacer = 3.1;
  float wallx = 310;
  float wally = 220;
  for(float x=-wallx; x<width+wallx; x=x+wallx){
    for(float y=-wally; y<height+wally; y=y+wally){
      shape(d,x,y-wally/2,500,500);
    }
  }
  for(float x=-wallx; x<width+wallx; x=x+wallx){
    for(float y=-wally; y<height+wally; y=y+wally){
      shape(d,x+wallx/2,y,500,500);
    }
  }
  for(int x=-1*width/4; x<width; x=x+width/4){
    for(float y=-1*height/spacer; y<height; y=y+height/spacer){
      shape(b,x,y,size*.7, size); 
      shape(c,x,y-height/spacer, size*.7, size);
    }
  }
//  exit();
  }
  
    

