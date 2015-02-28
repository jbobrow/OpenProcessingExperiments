
float number = 1;

float[] fibs= new float [1];
 
float px,py,r,degree;
float[] xpos = new float[0];
float[] ypos = new float[0];
 
float spacing = 20;

float weight;

float guldenSnede = ((sqrt(5) - 1 ) / 2);
 
float lastX, lastY;
float treex1, treey1;
float treex2, treey2;
float treex3, treey3;
float treex4, treey4;
float treex5, treey5;
float treex6, treey6;
float treex7, treey7;

void setup()
{
  size(1280, 1280);
  background(66,89,167);
  smooth();
  stroke(50);
  frameRate(10);
  px = width/2;
  py = height/2;
}
 
void draw(){
    lastX = px;
    lastY = py;
    degree = (frameCount * guldenSnede) * 360;
    r = sqrt(frameCount)*70;
    calculatePoint(width/2, height/2, r, (degree % 360));
    fill (random(500), random(1000), random(100), random (500));


    rect (px,py+20,25,25);// house
     fill (random(0,255), random(0,255), random(0,255));
    triangle (px+12.5,py+3,px-6,py+20,px+32,py+20);// roof
    rect (px+2,py+25,9,9); //window
    rect (px+14,py+27,9,18);//doors
    point(px,py);
    //line(lastX, lastY, px,py);
    weight += 0.01;

    
    treex1 = random(-20,5);
    treex2 = random(-5,10);
    treex3 = random(-30,20);
    treex4 = random(-30,30);
    treex5 = random(-20,40);
    treex6 = random(-5,5);
    treex6 = random(-10,10);

    treey1 = random(-10,25);
    treey2 = random (-10,25);
    treey3 = random (-10,30);
    treey4 = random (-10,30);
    treey5 = random (-10,20);
   treey6 = random (-10,20);
   treey7 = random (-10,20);
   fill (72,60,28);
    rect(px+treex1-1, py-treey1+2 , 2, 8);
    rect(px+treex2-1, py-treey2+2, 2, 8);
    rect(px+treex3-1, py-treey3+2, 2, 8);
    rect(px+treex4-1, py-treey4+2, 2, 8) ;
    rect(px+treex5-1, py-treey5+2, 2, 8);
    rect(px+treex6-1, py-treey6+2, 2, 8);
    rect(px+treex7-1, py-treey7+2, 2, 8);
    fill (116,245,62);
    ellipse(px+treex1, py-treey1 , 10, 10);
    ellipse(px+treex2, py-treey2, 10, 10);
    ellipse(px+treex3, py-treey3, 10, 10);
    ellipse(px+treex4, py-treey4, 10, 10) ;
    ellipse(px+treex5, py-treey5, 10, 10);
    ellipse(px+treex6, py-treey6, 10, 10);
    ellipse(px+treex7, py-treey7, 10, 10);


    if (px>= width){
      exit();
    }
    if (py>= height){
      exit();
    }
}



void calculatePoint(float x, float y, float r, float graden){
  px = x + cos(radians(graden))*(r/2);
  py = y + sin(radians(graden))*(r/2);
} 
 

