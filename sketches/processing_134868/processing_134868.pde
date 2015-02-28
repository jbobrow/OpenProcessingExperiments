
//this is a algorithim for a more organic movement using easing 
int value = 0;
float x;
float y;
float px;
float py;
float easing = .1; //easing is term reffering to delayed movement 

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  smooth();
}

void draw() {  //draw function loops 
 float targetX = mouseX;
  float targetY= mouseY;
  x +=(targetX-x) * easing;
  y +=(targetY-y) * easing; 
  

 
keyReleased();
}
void keyReleased() {

 //if the key("1") for drawing in cyan is pressed create a cyan quare in the bottom corner
if (key == 'q' || key == 'Q'){
  rect(0,0,10,10);
  fill(49,166,242,50);
  if(mousePressed == true) { //add some interaction
    noStroke();
    fill(49,166,242,50);
    ellipse(x, y, random(25,50), random(25,30));

}
}
//draw the color magenta
if (key == 'w' || key == 'W'){
  rect(0,0,10,10);
  fill(242,49,130,50);
  if(mousePressed == true) { //add some interaction
    noStroke();
    fill(242,49,130,50);
    ellipse(x, y, 20, 20);
    

}
}//draw the color yellow
if (key == 'e' || key == 'E'){
  rect(0,0,10,10);
 fill(251,255,70,50);
  if(mousePressed == true) { //add some interaction
    noStroke();
    fill(251,255,70,50);
    ellipse(x, y, 20, 20);
    

}
}//draw the color black
if (key == 'r' || key == 'R'){
  rect(0,0,10,10);
  fill(0,0,0,50);
  if(mousePressed == true) { //add some interaction
    noStroke();
    fill(0,0,0,50);
    ellipse(x, y, 20, 20);
    

}
}
if (key == 't' || key == 'T'){
  rect(0,0,10,10);
  stroke();
  fill(255,255,255);
  if(mousePressed == true) { //add some interaction
    noStroke();
    fill(255,255,255);
    ellipse(x, y, 20, 20);
    

}
}
}
