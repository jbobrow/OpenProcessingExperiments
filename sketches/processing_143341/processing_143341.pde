
school fish1;
school fish2;
bubble[] spheres = new bubble[70];
PImage img;
float yy;
float speed = .8;


 
void setup(){
  size(800, 500);
  ellipseMode(RADIUS);
  img = loadImage("SeaBackground.jpg");
  fish1 = new school(0, random(height));
  fish2 = new school(0, random(height));
  
    for(int i = 0; i < spheres.length; i++){
  spheres[i] = new bubble(); 
  }
}
 
void draw(){
 image(img, 0, 0, 800, 500);
 smooth();

 for(int i = 0; i < spheres.length; i++){
  spheres[i].update();  
  spheres[i].display(); 

 }


fish1.move(); 
fish1.display(2);//calling size of fish here
fish2.move();
fish2.display(1);
}

class bubble{
  
float posx, posy; 
float radius;  
float Bspeed; 
 
 
 bubble(){
  posx = random(width); 
  posy = random(height); 
  radius = random(3,15); 
  Bspeed = random(1,5);  
 }
 
 
 void update(){

  posy -= Bspeed; 
  
  if(posy <= 0-radius){ 
    posy = height + radius;     
    posx = random(width);
    Bspeed = random(1,5);
    radius = random(3,15); 
  }
 }
  
  
  void display(){
    
    fill(255, 125);
    noStroke();
    ellipse(posx,posy,radius,radius);
  }  
}
 
class school {
  
float x;
float y;
//float radx;
//float rady;
float d = 1;
float speedf = 5;
float angle = 0.0;
float x1 = x;
float y1 = y;
float scalar = 10;

float r;
float g;
float b;
 
school(float tx, float ty){ //changing size
  x = tx;
  y = ty;
  r = random(255);
  g = random(255);
  b = random(255);
}

 void move(){ //fish moves across the screen
 x += speedf;
  if(x >= (width * scalar)+150){
    x = 0;
  r = random(255);
  g = random(255);
  b = random(255);    
 }

 }
void display(float s){//using scale function to manage size of fishes
  pushMatrix();
  scale(1/s);
 scalar = s;
//  translate(d*x, y);
  noStroke();
  fill(r, g, b);
  ellipse(x, y, 100, 60);//body
  fill(0);
 ellipse(x+50, y-15, 10, 10);//eye
fill(b, r, g);
//float x1 = sin(angle); 
float y1 = sin(angle)*scalar;//moves tailfin up and down
angle += speed;
arc(x-145, y1+y, 50, 50,4.08, TWO_PI);//tailfin
arc(x-145, y1+y, 50, 50, 0, 2.2);
arc(x, y+12, 20, 70,.16, PI); //fin
popMatrix();
}
}





