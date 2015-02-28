
//Naomi Rauch
//CS118
//Mid-Term
//March 22, 2014

Lanterns[] lights = new Lanterns[20]; //declare array
//sets number of slots as variable lights

PImage img; //variable for image of pagoda
//float smx;//starting x
//float smy;//starting y
//float easing; //smoothing floating latern in y direction

void setup(){
  size(400,400);
  img = loadImage("picture.jpg");
  smooth();
  //smx = random(0,width); //random starting point in x direction

  //smy = height; //start lanterns at bottom of screen
  //easing = 0.01; //smooths lantern
  
  //initializing array using for loop(length=number of slots)
  for(int i = 0; i< lights.length; i++){
  lights[i] = new Lanterns();
}
}

void draw(){
//add movement from random starting point

image(img,0,0,width,height);
//animate array using a for loop

for(int i = 0; i < lights.length; i++){
  lights[i].update();
  lights[i].display();

}
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
  x = random(20, width);
  y = height;
  lantw = random(50,75);
  easing = 0.01;
  speedx = random(10,20);
  
}
//method for the "math" behind the object motion
 void update(){
 //movement in x direction 
 if (keyPressed && (key == CODED)) {
    if (keyCode == RIGHT) { //wind blowing to right
      x = x + speedx;
    }
 }
 if (keyPressed && (key == CODED)) {//wind blowing to left
     if (keyCode == LEFT) {
     x = x - speedx;
    }
 }
    //speedx = 0;
   

 if (y>20) {
   
  s = map(y,-20,height,.1,.5);//makes scale of lantern change
  
  y += (0 - y)*easing; //movement in y direction
  
  //x = x + 5.5; //movement in x direction
  
}else{
   lantw = 0;
 }
 }

//method for drawing the object to the screen
void display(){
  
  
  
  scale(s);
  
  for(float i = lantw; i >= 1; i -= 1){
   
    fill(255,255,144,5);
    noStroke();
    ellipse(x, y, i, i*1.618);
    fill(255,255,0,255);
    ellipse(x, y, i/6, (i*1.618)/6);
 
 
  }
}
}
  

  





