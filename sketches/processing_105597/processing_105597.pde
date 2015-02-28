
//Lathem Wojno
//Creatures
//8/5/2013

float x;
float y;
float easing = 0.05;
float diameter = 12;

void setup() {
  size(1000,1000);
  smooth();
}

//Draw Creatures
void draw() {
  if (mousePressed) {
 myMadCreature();
  } else {
 myScaredCreature();
  }
}

 void myMadCreature(){
   
  float targetX = mouseX;
  x += (targetX - x) * easing;
  float targetY = mouseY;
  y += (targetY - y) * easing;
  
  //Draw Mad Creature
     background(0);
     
  //body
  rect(x,y,100,200);
  fill(225,6,6);
  
  //eyes
  ellipse(x+30,y+50,30,50);
  ellipse(x+70,y+50,30,50);
  
  //mouth
  rect(x+15,y+150,70,30);
  
  //eyebrows
  line(x+35,y+15,x+45,y+25);
  line(x+65,y+15,x+55,y+25);
 }
 
 void myScaredCreature(){
      
  float targetX = mouseX;
  x += (targetX - x) * easing;
   float targetY = mouseY;
  y += (targetY - y) * easing;
  
  //DrawScaredCreature
   background(225);
   
  //body
  rect(x,y,100,200);
  fill(6,6,225);
  
  //eyes
  ellipse(x+30,y+50,30,50);
  ellipse(x+70,y+50,30,50);
  
  //mouth
  rect(x+15,y+100,70,80);
  
  //eyebrows
  line(x+30,y+15,x+15,y+25);
  line(x+70,y+15,x+85,y+25);
 }

