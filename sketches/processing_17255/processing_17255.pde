
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;
color paw=0;
PImage a,bg;
public float [] points;
void setup(){
  //a= loadImage( "f:\\bfa\\vertical.png");
a=loadImage("vertical.png");
  paw  = a.pixels[a.pixels.length-1];
  //a.resize(a.width,a.height-5);
  points = new float [a.height-2];
  int pick=0;
  for (int x=0;x<points.length;x++){
    points[x]=999;
  }
  int by = 2;
//  size(a.width,a.height,P3D);
size(228,402,P3D);
  for (int y=2;y<a.height;y+=by){
    for (int x=a.width;x>0;x--){
      color c = a.get(x,y);
      if (c==paw){
        set(x,y,color(255,0,0));
        if (brightness(c)>255/2)points[pick]=width-x; 
      }
      //if (c!=paw)x=0; 
    }
    pick++;
  }  
  bg=get();
  cam = new PeasyCam (this,width);

}


void draw(){
  translate(-width/2,-height/2);
  background(bg);
  stroke(1);
  ellipseMode(CENTER);
  noFill();
  int lip=0;
  for (int x=0;x<points.length;x++){
    if (points[x]!=999){
      translate(0,0,-x);
      ellipse(width/2,height/2,points[x],points[x]);
      translate(0,0,x);
      lip++;
    }

  }
  int vick = lip;
  for (int y = lip;y>-1;y--){
    if (points[y]!=999){
      translate(0,0,-vick);
      ellipse(width/2,height/2,points[y],points[y]); 
      translate(0,0,vick);
      vick++;
    }
  }
}


