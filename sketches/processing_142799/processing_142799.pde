
//Naomi Rauch
//CS118
//Mid-Term
//March 22, 2014

Lanterns[] lights = new Lanterns[20]; //declare array
//sets number of slots as variable lights

//PImage img; //variable for image of pagoda


void setup(){
  size(500,500);
  background(0);
  //img = loadImage("picture.jpg");
  smooth();
  
  
  //initializing array using for loop(length=number of slots)
  
  for(int i = 0; i< lights.length; i++){
  lights[i] = new Lanterns();
}
}

void draw(){
//add movement from random starting point
background(0);
//image(img,0,0,width,height);
//animate array using a for loop

for(int i = 0; i < lights.length; i++){
  lights[i].update();
  lights[i].display();

}
}


  
  
  
  
  



void funct(float x, float y, float lantw, float s){
  //drawing lantern
  //x and y variables are coordinates of center
  //lantw is width of lantern; height a factor or with by 1.618
  //s is for scale
  //light source of lantern at center of lantern
   
  
  
  pushMatrix();
  translate(x,y);
  for(float i = lantw; i >= 1; i -= 1){
   
  
   
    fill(255,255,144,5);
    noStroke();
    ellipse(0, 0, s*i, s*(i*1.618));
    fill(255,255,0,255);
    ellipse(0, 0, s*(i/6), s*((i*1.618)/6));
}
 popMatrix();
}
//begin class block
class Lanterns { //name of class
  
float x; //x coordinate
float speedx; //speed in x direction
float y; //y coordinate
float lantw; //lantern W; height a factor of width by 1.618
float s; //scale
float easing;//in y direction

//class constructor (like setup function)
  Lanterns(){
  
  x = random(width);
  y = height;
  lantw = random(50,75);
  easing = 0.005;
  speedx = random(2,5);
  
}
//method for the "math" behind the object motion
 void update(){
 //movement in x direction 
 if (keyPressed && (key == CODED)) {
    if (keyCode == RIGHT) { //wind blowing to right
      x = x + speedx;
    }else if (keyPressed && (key == CODED)){ //wind blowing to left
     if (keyCode == LEFT) {
     x = x - speedx;
    } 
   }
  
 }

 if (y>20) {
   
  s = map(y,-20,height,.1,.5);//makes scale of lantern change
  y += (0 - y)*easing; //movement in y direction
  

  
}else{
   lantw = 0;
 }
 }

//method for drawing the object to the screen
void display(){

 funct(x,y,lantw,s);
 
  
}
}
  

  





