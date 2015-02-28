

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
ellipseMode(CENTER);


}


void draw(){
  
  float circleA = random(255);

 //backround fill
  background(random(100));
  
//red arc
fill(255,0,0);
arc(pmouseX, pmouseY+50, mouseX, mouseY, PI/1500, PI);

//green arc
fill(22,201,10,200); 
arc(pmouseX, pmouseY, mouseX, mouseY, PI/1500, PI);

//blue arc
fill(35,90,250,175);
arc(pmouseX, pmouseY-50, mouseX, mouseY, PI/1500, PI);

//yellow arc
fill(249,250,81,150);
arc(pmouseX,pmouseY-100, mouseX, mouseY, PI/1500, PI);

//ellipse



fill(R,G,B,circleA);
ellipse(x, y, diam, diam);


  y = y + speed;
  speed = speed + gravity;
  if (y > height) {
    speed = speed * -0.95;
  }
}




