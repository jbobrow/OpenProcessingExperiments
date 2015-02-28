

float diam = 100;
float x = 300;
float y = 0;
float h = 250;
float w = 250;
float speed = 5;
float gravity = 1.0;
float R = 255;
float G = 255;
float B = 255;
float A = 255;


void setup(){

size(600,600);
smooth();
rectMode(CENTER);
 //backround fill

}


void draw(){

 //backround fill
  background(random(100)); 
  
//red arc
fill(255,0,0);
triangle(0,0,300,600, 350, 600);

//green arc
stroke(0);
fill(22,201,10,200); 
triangle(0,0,350,600,400,600);

//blue arc
fill(35,90,250,175);
triangle(0,0,400,600,450,600);

//yellow arc
fill(249,250,81,150);
triangle(0,0,450,600,460,600);

//ellipse

float circleA = random(255);
fill(R,G,B,circleA);
ellipse(x, y, diam, diam);


  y = y + speed;
  speed = speed + gravity;
  if (y > height) {
    speed = speed * -0.95;
  }
}




