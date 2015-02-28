
//My attempt is to just really get a grasp of the code.
//Once I do I want to stylize the interactive results.
//At this point I only have a concept in mind and that is Birth.
//RESULTS
//still need more time to understand 
//TITLE
//I gave birth to an eye 
//GLOBAL VAIRABLE
color strokeColor = color(0,10);

//SETUP
void setup(){
size(800, 600);
colorMode (HSB, 360, 100, 100, 100);
noFill();
background(360);
}

//DRAW
void draw(){
if (mousePressed) { 
  pushMatrix();
  translate(width/2, height/2);//center start
  int circleResolution= //store circle variables map
  (int)map(mouseY+20,0, height, 5, 50); //map(value,start1, stop1, start2,stop2);
  int radius = mouseX-width/2; //not larger than canvas
  float angle = TWO_PI/circleResolution;
//style
strokeWeight(2);
stroke(strokeColor);

//polygon
beginShape();
for (int i=0; i <=circleResolution; i++){
float x = 0 + cos(angle * i)*radius;
float y = 0 + sin(angle * i)*radius;
vertex(x,y);
}
endShape();
popMatrix();
}
}

//KEYPRESSED
void keyReleased(){
if (key==BACKSPACE)
background(360);
if (key =='s') saveFrame("screenShot.png");
switch(key){
case '1':
 strokeColor = color(160, 90, 30, 5);
 break;
 case '2':
 strokeColor = color(192, 100, 64, 10);
 break;
 case '3':
 strokeColor = color(52, 100, 71, 20);
 break;
}
}





