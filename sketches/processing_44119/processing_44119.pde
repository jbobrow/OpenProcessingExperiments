
/*This is the modified version of Drag N Drop by Yam. Instead of an ellipse I used
text for the bouncing object. I cannot wrap my head around the gravity equation
so i didn't do any modifications around it. Whenever I do it does something crazy
and the words would fly off.*/

float x;
float y;
float b;
//int dragX, dragY; // I don't know what this code is for for but it does not affect anything
float radius = 50.0;
float velocity =5.0;
float friction =.98;
float acceleration = .98;
PFont lithos;
 
void setup(){
  size(400,400);
  smooth();
  noStroke();
  lithos = loadFont("Lithos-Bold-48.vlw");
  textFont(lithos);
}
 
 
 
void draw(){
  fill(0,88);
  rect(0,0,400,400);
  
  fill(255);
  text("lithos", x,y);
  text("bounce me", 0,b);
  
  if(mousePressed == true){
    x=mouseX;
    y=mouseY;
  }else {//this part here where it gets confusing
velocity*=friction; 
velocity+=acceleration;
   
y+=velocity;//this part says to bounce back up whenever it hits the floor
    if(y>height){
    y=height;
    velocity=-velocity;
  }   
}


/*I added this code and wierd stuff happens, the "lithos" would slowly go down and the "bounce me"
would slowly go up*/

b+=velocity;
  if(b>height){
    b=height;
    velocity=-velocity;
  }
  
}


