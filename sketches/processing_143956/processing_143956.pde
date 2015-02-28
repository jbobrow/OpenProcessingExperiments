
//Naomi Rauch
//CS118
//Mid-Term
//March 22, 2014
int counter; //to keep track when animation starts
int time1; //time of event 1
int time2; //time of event 2

float targetposx;//specifying x target coordinate for objects
float targetposy;//specifying y target coordinate for objects
float posx;//starting x coordinate for objects
float posy;//starting y corrdinate for objects

Lanterns[] lights = new Lanterns[20]; //declare array
Lanterns[] lightsa = new Lanterns[10]; //delcare array
Lanterns[] lightsb = new Lanterns [10]; //declar array

PImage img; //variable for image of pagoda

void setup(){
  size(500,500);
  background(0);
  img = loadImage("picture.jpg");
  smooth();
  counter = 0;
  time1 = 0; //time event 1 happens
  time2 = 100; //time event 2 happens
 
  
//filling slots in array lights

  for(int i = 0; i< lights.length; i++){ //make all lanterns float to center
   targetposx = width/2;
   targetposy = height/4;
   posx = random(0,width);
   posy = random(height, height+100);
  lights[i] = new Lanterns(posx, posy, targetposx,targetposy,0.05);
  } 
  
//filling slots in array lightsb
  float easeb = .01;
  posx = targetposx;
  posy = targetposy;
  lightsb[0] = new Lanterns(posx,posy,195,150,easeb);//target x,y to make heart shape
  lightsb[1] = new Lanterns(posx,posy,230,133,easeb);
  lightsb[2] = new Lanterns(posx,posy,270,144,easeb);
  lightsb[3] = new Lanterns(posx,posy,280,191,easeb);
  lightsb[4] = new Lanterns(posx,posy,255,224,easeb);
  lightsb[5] = new Lanterns(posx,posy,213,265,easeb);
  lightsb[6] = new Lanterns(posx,posy,167,228,easeb);
  lightsb[7] = new Lanterns(posx,posy,125,203,easeb);
  lightsb[8] = new Lanterns(posx,posy,129,154,easeb);
  lightsb[9] = new Lanterns(posx,posy,160,139,easeb);
 
 for(int i = 0; i< lightsa.length; i++){ //make all lanterns float off screen
   targetposx = random(0,width);
   targetposy = -100;
   posx = random(200,width);
   posy = random(height, height+200);
  lightsa[i] = new Lanterns(posx, posy, targetposx,targetposy,0.03);
  }
  
}


void draw(){
//add movement 
println(counter);
background(0);
image(img,0,0,width,height);

//call array objects using for loops

if (counter > time2){
    counter = counter + 1;
  for(int i = 0; i < lightsb.length; i++) {
    lightsb[i].update();
    lightsb[i].display();
   
  } 
    
}else if (counter >= time1){
  counter = counter + 1;
  for(int i = 0; i < lights.length; i++){
    lights[i].update();
    lights[i].display();  
}
  for(int i = 0; i < lightsa.length; i++){
    lightsa[i].update();
    lightsa[i].display();
  }
}

if(counter > 250){
  setup();
}

}

  
  
  



void funct(float x, float y, float lantw, float s){
  //drawing lantern
  //x and y variables are coordinates of center
  //lantw is width of lantern; height a factor of width by 1.618
  //s is for scale
  //light source of lantern at center of lantern
   
  
  
  pushMatrix();
  translate(x,y);
  for(float i = lantw; i >= 1; i -= 3){
   
  
   
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
float targetx; //center of object in sky
float targety; //center of object in sky


//class constructor (like setup function)
  Lanterns(float tempx, float tempy, float temptargetx, float temptargety, float tempease){
  
  x = tempx;//current x coordinate
  y = tempy;//current y coordinate
  lantw = random(50,75); //random starting widths of lanterns
  easing = tempease;//easing as specified when calling object
  speedx = random(2,5);//wind speed
  targetx = temptargetx; //specified target x position when calling lantern object
  targety = temptargety; // specified target y position when calling lantern object
  
}
//method for the "math" behind the object motion
 void update(){

 if(x > targetx){ //moving lanterns toward target x
     x += (targetx - x)*easing;
    }else if(x < targetx){
     x += (targetx - x)*easing;
 } 
 
 if(y > targety){//moving lantern toward target y
     y += (targety - y)*easing;
    }else if(y < targety){
     y += (targety - y)*easing;

 }
 
 if (keyPressed && (key == CODED)) { //wind blowing lantern
    if (keyCode == RIGHT) { //wind blowing to right
      x = x + speedx;
    }else if (keyPressed && (key == CODED)){ //wind blowing to left
     if (keyCode == LEFT) {
     x = x - speedx;
    }
    }
    
 
   }
  if ((dist(mouseX, mouseY,x,y)< 100)){//movment of lanterns with respect to mouse position
       x += ((x + (random(-500,500))-x))*easing;
       y += ((y + (random(-500,500))- y))*easing;
 }
 }
 
//method for drawing the object to the screen
void display(){

   s = map(y,0,height,.1,.5);//makes scale of lantern change in the y direction
 
   funct(x,y,lantw,s);//calls function on function tab
 }
}

  





  
 





