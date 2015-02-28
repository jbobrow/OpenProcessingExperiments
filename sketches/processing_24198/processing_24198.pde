
float alienX;
float alienY;

float a = 100;

void setup () {
  
size(400,600);
alienX = width/2;
alienY = height-200;
smooth();
rectMode(CENTER);
noStroke();
}

void draw () {

background(0);
fill(mouseX,0,mouseY);                         //CHANGES COLOUR WITH MOUSE
  ellipse(alienX-40,alienY-30,30,30); //left head knob
  ellipse(alienX,alienY-50,30,30); //centre head knob
  ellipse(alienX+40,alienY-30,30,30); //right head knob
  rect(alienX,alienY+100,10,100); //leg stalk
  ellipse(alienX+30,alienY+160,20,20); //right foot knob
  ellipse(alienX-30,alienY+160,20,20); //left foot knob

if(mouseY < (alienY+50)) {
  stroke(mouseX,0,mouseY);
  strokeWeight(4);
  line(alienX,alienY+60,alienX+30,alienY+40); //right arm UP
  line(alienX,alienY+60,alienX-30,alienY+40); //left arm UP
noStroke();
fill(250,240,105);  
  ellipse(alienX+30,alienY+40,20,20); //right hand UP
  ellipse(alienX-30,alienY+40,20,20); //left hand UP
} else {
stroke(mouseX,0,mouseY);
strokeWeight(4);  
  line(alienX,alienY+60,alienX+30,alienY+80); //right arm DOWN
  line(alienX,alienY+60,alienX-30,alienY+80); //left arm DOWN
noStroke();
fill(250,240,105);  
  ellipse(alienX+30,alienY+80,20,20); //right hand DOWN
  ellipse(alienX-30,alienY+80,20,20); //left hand DOWN
}
  
fill(250,240,105);
  ellipse(alienX,alienY,100,100); //head
  triangle(alienX-30,alienY+160,alienX,alienY+130,alienX+30,alienY+160); //foot

fill(255);
  ellipse(alienX,alienY,60,70); //eye
fill(0);
  ellipse(alienX,alienY+15,20,30); //pupil
                 
fill(150);                                           //UFO FOLLOWS MOUSE
  ellipse(mouseX,mouseY-10,30,30); //ufo cockpit
fill(200);
  ellipse(mouseX,mouseY,50,30); //ufo body
fill(mouseX,0,mouseY);
  ellipse(mouseX,mouseY+10,10,10); // light centre
  ellipse(mouseX-15,mouseY+5,8,8); // light left
  ellipse(mouseX+15,mouseY+5,8,8); // light right
  
if(keyPressed) {
 alienY = alienY-2;
noFill();
stroke(0);
strokeWeight(2);
  ellipse(alienX,alienY+45,10,10); //shocked mouth
noStroke();
fill(100);
  ellipse(alienX,0,600,100); //big ufo
fill(255,a);
  triangle(alienX,-20,alienX-100,alienY-25,alienX+100,alienY-25);
noStroke();
}
else {
 alienY = height-200;
}

}



