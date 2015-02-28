
Bubble[] spheres = new Bubble[30]; //calling amount of bubbles
Fish[] school = new Fish[7];//calling amount of fish
PImage img;


void setup(){
  size(600, 400);
  img = loadImage("SeaBackground.jpg");
   for(int i = 0; i < school.length; i++){
  school[i] = new Fish(); 
  }
 for(int i = 0; i < spheres.length; i++){
  spheres[i] = new Bubble(); 
  }
}

void draw(){

 image(img, 0, 0, 600, 400);

 for(int i = 0; i < spheres.length; i++){
  spheres[i].update();  
  spheres[i].display(); 
 }
 for(int i = 0; i < school.length; i++){
  school[i].update();
  school[i].display(); 
  }
}



class Fish{
float x;
float y;
PImage img;
float speed;
float x1 = x;
float y1 = y;
float angle;
float sizeX;
float sizeY;
float fishDir;
float hitbox;
float dir;
float r;
float g;
float b;

Fish(){
  
  r = random(255);
  g = random(255);
  b = random(255);
  ellipseMode(RADIUS);
  y = random(height); 
  x = random(width);
  angle = 0.0;
  sizeX = random(15,80);
  sizeY = random(15,50);
  speed = random(.5,2);
  fishDir = 1;
  dir = 0;
  hitbox = (sizeX+sizeY)/2;
}
 
 void update(){
    
 if(mousePressed && dist(mouseX,mouseY,x,y)<hitbox){
   x = mouseX;
   y = mouseY;   //when mousepressed, fish follows mouse
   hitbox = 500;  
   
 dir = mouseX-pmouseX;
 
   if(dir < 0){   //changes direction with mouse
   fishDir = -1;
   speed = dir;
 }
 
 if(dir > 0){
   fishDir = 1;
   speed = dir;
 }

 }else{ 
  hitbox = (sizeX+sizeY)/2;
  x += speed;
  if(x >= (width+sizeX)){//sets fish back to left of screen, 
    x = 0;                //changes color of fish, and changes
  y = random(height);  //where fish enters on y-axis
  r = random(255);
  g = random(255);
  b = random(255);
 }
 
 if(x <= (0-sizeX)){//sets fish back to right of screen, 
    x = width+sizeX;   //changes color of fish, and changes
  y = random(height); //where fish enters on y-axis
  r = random(255);
  g = random(255);
  b = random(255); 
 }
 }
 }
 
void display(){
   fish(x, y, sizeX,sizeY,.2,fishDir);
 }
 
  
void fish(float posx, float posy, float rx, float ry, float r, float d){
  
float radx = rx;
float rady = ry;
  
pushMatrix();
  scale(d,1);
  noStroke();
  fill(r, g, b);
  ellipse(posx*d, posy, radx, rady); //body
  fill(0);
  ellipse((posx*d)+(radx/2), posy-(rady/4), radx/10, rady/6);//eye
  fill(b, r, g);
 float x1 = (posx*d)+(sin(angle));
 float y1 = posy+(sin(angle)*rady/5);
 angle += (speed/3);
  arc((posx*d)-(radx+(radx/2.5)), y1, radx/2, (rady-10),4.08, TWO_PI); //tail fin
  arc((posx*d)-((radx+(radx/2.5))), y1, radx/2, (rady-10), 0, 2.2);
//pushMatrix();
//rotate(r);
//popMatrix();
  arc((posx*d), posy+(rady/5), radx/5, rady+(rady/6),.16, PI); //arm fin
popMatrix();
  
}  
}

class Bubble{
  
float posx, posy; 
float radius;  
float Bspeed; //bubble speed
 
 
 Bubble(){
  posx = random(width); 
  posy = random(height); 
  radius = random(3,12); 
  Bspeed = random(1,3);  
 }
 
 
 void update(){

  posy -= Bspeed; //bubbles move up the screen
  
  if(posy <= 0-radius){ //when bubble leaves top of screen
    posy = height + radius;   //starts back at the bottom
    posx = random(width);  //
    Bspeed = random(.5,1.5);
    radius = random(3,15); 
  }
 }
  
  
  void display(){
    
    fill(255, 125);
    noStroke();
    ellipse(posx,posy,radius,radius);
  }  
}




