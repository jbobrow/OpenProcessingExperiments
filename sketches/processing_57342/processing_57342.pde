
void setup() {
  size(500, 500);
  smooth();
  strokeWeight(2);
  ellipseMode(RADIUS);
}

float x=175; //x-coordinate
float y=160; //y-coordinate
int headHeight= 140; //Head Height
int bodyHeight= 60; //Body Height
float easing= 0.02;

void draw() {
  float targetX = mouseX;
  float targetY = mouseY;
  x += (targetX - x) * easing;
  y += (targetY - y) * easing;
background(18, 153, 155); 

//Head
noStroke();
fill(203, 87, 2);
rect(x, y, headHeight+10, headHeight);
  if(!mousePressed){
triangle(x, y, x+15, y-80, x+70, y); //left ear
fill(253, 144, 110);
triangle(x+10, y, x+20, y-45, x+55, y);
fill(203, 87, 2);
triangle(x+80, y, x+135, y-80, x+150, y); //right ear
fill(253, 144, 110);
triangle(x+95, y, x+130, y-45, x+140, y);
stroke(0);
strokeWeight(1);

  }else{
triangle(x, y, x+15, y-100, x+70, y); //left ear
fill(253, 144, 110);
triangle(x+10, y, x+20, y-55, x+55, y);
fill(203, 87, 2);
triangle(x+80, y, x+135, y-100, x+150, y); //right ear
fill(253, 144, 110);
triangle(x+95, y, x+130, y-55, x+140, y);
stroke(0);
strokeWeight(1);    
  }
 if(!mousePressed){
fill(255);
ellipse(x+45, y+60, 15, 20); //left eye
fill(0);
ellipse(x+45, y+65, 7, 7);
fill(255);
ellipse(x+105, y+60, 15, 20); //right eye
fill(0);
ellipse(x+105, y+65, 7, 7);
noStroke();
fill(0);
ellipse(x+75, y+85, 15, 10); //nose
fill(255);
rect(x+50, y+110, 50, 15); //mouth

  }else{
fill(255);
ellipse(x+45, y+60, 15, 20); //left eye
fill(0);
ellipse(x+45, y+65, 12, 12);
fill(255);
ellipse(x+105, y+60, 15, 20); //right eye
fill(0);
ellipse(x+105, y+65, 12, 12);
noStroke();
fill(178, 10, 30);
ellipse(x+75, y+85, 15, 10); //nose
fill(255);
ellipse(x+75, y+120, 10, 15); //mouth
  }  
//Legs
stroke(0);
strokeWeight(5);
line(x+55, y+160, x+55, y+240);
line(x+95, y+160, x+95, y+240);
noStroke();
fill(119, 157, 73);
ellipse(x+45, y+240, 20, 10);
ellipse(x+105, y+240, 20, 10);

//Body
fill(203, 87, 2);
rect(x+25, y+140, 100, 60);
fill(210, 171, 13);
ellipse(x+55, y+155, 5, 5);
ellipse(x+95, y+155, 5, 5);
fill(119, 157, 73);
if(!mousePressed){
triangle(x+25, y+170, x+125, y+170, x+75, y+200);
//rect(200, 200, 110, 80);
  }
}


