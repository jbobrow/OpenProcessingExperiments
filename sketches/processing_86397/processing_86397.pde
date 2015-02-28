
//Code built upon object found on processing forum here :http://processing.org/discourse/beta/num_1238874012.html
import processing.video.*; 

  PShape architype;
  PShape architype2;
  float speed_mod, zz, linex1, liney1, linex2, liney2,translatex,translatey;
  Wanderer[] wanderer = new Wanderer[1];
  int speed=20;
  float zopacity=0;



void setup() {
  
  size(1920, 1080);
  

   linex2=0;
  frameRate(60);
  background(0);

  architype = loadShape("arch.svg");
  architype2 = loadShape("arch2.svg");

  for (int i=0; i<wanderer.length; i++)
  {
    wanderer[i] = new Wanderer(0, random(height));

  }

}


void draw() {
 
   noStroke();
    architype.disableStyle();
  

  fill(0, zopacity);

  shape(architype, 0, 0);
    architype2.disableStyle();

    noStroke();

   fill(164,204,234, zopacity);

  shape(architype2, 0, 0);
    
    if (frameCount>180){

      zopacity=10;
    }

  pushMatrix();

  for (int i=0; i<wanderer.length; i++)
  {
      liney1 = map(wanderer[i].getY(), 0, height, 600, 300);

    wanderer[i].stayInsideCanvas();
    wanderer[i].move();
   
   translatex= wanderer[i].getX();
   
   translatey= wanderer[i].getY(); 
   
   
    translate(translatex,translatey);
    
   // println(wanderer[i].getX());
    
    rotate(zz);

    strokeWeight(.75);

    stroke(164,204,234);
    line(linex1, liney1, linex2, -liney1);

    popMatrix();
    
     }
  

    
    zz+=.07;
  saveFrame("output/frames####.png");
  }


class Wanderer
{
  float x;
  float y;
  float wander_theta;
  float wander_radius;

  // bigger = more edgier, hectic
  float max_wander_offset = .3;
  // bigger = faster turns
  float max_wander_radius = 10.5;

  Wanderer(float _x, float _y)
  {
    x = _x;
    y = _y;

    wander_theta = random(TWO_PI);
    wander_radius = random(max_wander_radius);
  }

  void stayInsideCanvas()
  {
    x %= width;
 
    y %= height;
 
  }


  void move()
  {
    float wander_offset = random(-max_wander_offset, max_wander_offset);
    wander_theta += wander_offset;
    

    x += cos(wander_theta) *(speed*1.5);
    if(x<(0-liney1)){
      x= width;
      x += cos(wander_theta) *(speed*1.5);
      
    }

   y += sin(wander_theta) * speed;
   if(y<(0-liney1)){
     y=height;
        y += sin(wander_theta) * speed;

   }

  }

  float getX()
  { 
   
    return x;
    
 
  }

  float getY()
  {
    return y;
  }}



