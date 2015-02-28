
//Carla Campos-Rodriguez
//February24,2013
//Bouncing Objects

int circleX=300;
int circleY=200;
int circle=3;//speed
void setup() {
  background(255);
  size(400, 400);
  frameRate(100);
  smooth();
  noStroke();
  
}
//yellow circles on white
void draw() {
  background(255);
 //background(208,240,235);
  smooth();
  noStroke();
  fill(138,245,230);//teal
  rect(0,0,20,400);
  fill(138,245,230,120);//tealtransparancy
rect(0,0,40,400);
rect(0,0,60,400);
rect(0,0,80,400);
fill(138,245,230,110);
rect(0,0,100,400);
rect(0,0,120,400);
rect(0,0,140,400);
rect(0,0,160,400);
rect(0,0,180,400);
rect(0,0,200,400);

noStroke();
  if ((mouseY<200)&&(mouseX<300)&&(mouseX<400)) { //flashing cursor
    fill(0, random(255), random(255), 50);
    ellipse(mouseX, mouseY, 10, 10);
    ellipse(mouseX+40, mouseY, 10, 10);
      ellipse(mouseX+60, mouseY, 10, 10);
      ellipse(mouseX+80, mouseY, 10, 10);
  }

ellipse(mouseX,mouseY,50,50);
noStroke();
fill(255,173,136); //coral
ellipse(circleY+80,circleX,60,60); // small circle 2
ellipse(circleX+180,circleY,60,60); // small circle 2
  
  ellipse(circleY,circleX,40,40);//small circle
//rect(10,190,390,390);


  ellipse(circleY,circleX,40,40);//small circle
   fill(255,234,71,120); //yellow


ellipse(circleX,circleY,200,200); //yellow circle
ellipse(400,0,200,200); //yellow circle right
if (dist(circleX, circleY, mouseX, mouseY) > 100) {
 if (mousePressed==true) {
   fill(138,245,230);
          
    } else {
       fill(209,255,208); //mint
        }
  } else {
    //if the mouse is outside the circle
   fill(189,162,240); //yellow
  }
        //fill(209,255,208);
ellipse(400,0,200,200); //yellow circle right
ellipse(circleY,circleX,40,40);
circleX=circleX+circle;
  if(circleX>width) {
    circle = -2;
  }
  if(circleX < 0){
    circle = 2;
 }

  {


 }
}
