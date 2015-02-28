
int state = 0;


void setup() {
  size(1000,1000);
  frameRate(40);
  background(0);

}

void draw() {
//starting poing  
if (state == 0) {
  stroke(255);
  fill(frameCount/2,mouseX,250,30);
  rectMode (CENTER);
  rect (width/2, height/2, mouseX+10, mouseY+10);
//from state 0 to 2  
if (mousePressed) {
 state=2;
}
//from state 0 to 1
if(mouseX>width-50) {
  background(0);
  stroke(255);
  fill(0);
  rect (width/2, height/2,100,100);
  state = 1;
}   
 }
//from state 1 to 2 
if (state == 1 && mouseX>width-30) {
  state = 2;
}
//state 2
if (state == 2) {
  stroke(0);
  fill(255);
 ellipse(width/2, height/2, mouseX+40, mouseY+40);
}
//from state 2 to 3
if (state == 2 && mouseY<20) {
  background (0);
  state = 3;
}    

//state 3
if (state == 3) {
   stroke(0);
  fill(mouseX,mouseY,200,70);
 ellipse(width/2, height/2, mouseX+40, mouseY+40);
}
//state 3 to 4
if (state == 3 && mouseX>width-20) {
 background (0);
 state = 4;
}

//state 3 to 2
if (state == 3 && mousePressed) {
 state = 2; 
}

//state 4
if (state == 4) {
 stroke(0);
 fill(frameCount/2,mouseX,250,30);
 ellipse(width/2, height/2, mouseX, mouseY);
 stroke(255);
 fill(mouseX,mouseY,0,10);
 rect(width/2,height/2,mouseX, mouseY);
 stroke(0);
 fill(mouseX,mouseY,30,10);
 rect(width/2,height/2,mouseX-40, mouseY-40);
  fill(mouseX,mouseY,200,10);
 rect(width/2,height/2,mouseX-70, mouseY-70);
}
//state 4 to 5
if (state == 4 && mouseY<30) {
 background (0);
 state = 5;
}
//state 5
if (state == 5) {
 stroke(0);
 fill(255);
 ellipse(width/4, height/4, mouseX-15, mouseY-15);
  stroke(0);
 fill(225);
 ellipse(width/4, 750, mouseX-15, mouseY-15);
   stroke(0);
 fill(225);
 ellipse(750, height/4, mouseX-15, mouseY-15);
    stroke(0);
 fill(255);
 ellipse(750, 750, mouseX-15, mouseY-15);
  stroke(0);
 fill(mouseY,mouseX,170,30);
 ellipse(width/2, height/2, mouseX+10, mouseY+10);
}
if (state == 5 && mouseX> width-30) {
   state = 0;
}
if (state == 5 && mousePressed) {
  background (0);
  state = 6;
}
//state 6
if (state == 6) {
 stroke(0);
 fill(mouseY,mouseX,170,30);
rect(width/4, height/4, mouseX-15, mouseY-15);
  stroke(0);
 fill(mouseY,mouseX,170,30);
 rect(width/4, 750, mouseX-15, mouseY-15);
   stroke(0);
 fill(mouseY,mouseX,170,30);
 rect(750, height/4, mouseX-15, mouseY-15);
    stroke(0);
 fill(mouseY,mouseX,170,30);
 rect(750, 750, mouseX-15, mouseY-15);
  stroke(0);
 fill(mouseY,mouseX,170,30);
 rect(width/2, height/2, mouseX+10, mouseY+10);
}
//state 4 to 5
if (state == 6 && mouseY<30) {
 background (0);
 state = 0;
}
}


