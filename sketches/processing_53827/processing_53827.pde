
float x,y,z,angle;
float x2,y2,z2,angle2;
float x3,y3,z3,angle3;
int colorValue;

void setup(){
  size(500,500);
  smooth();
  background(0);
  x=0;
  y=0;
  z=0;
  angle=0;
  x2=25;
  y2=25;
  z2=25;
  x3=50;
  y3=50;
  z3=50;
  
  colorValue=0;
}

void mousePressed(){
  background(random(255));
}

void mouseReleased(){
  background(0);
}

void draw(){
  
   x = cos(radians(angle)) * 10 + width/2;
   y = sin(radians(angle)) * 10 + height/2;
   z = tan(radians(angle)) * 10 + height/2;
   
   x2 = cos(radians(angle)) * 500 + width/2;
   y2 = sin(radians(angle)) * 500 + height/2;
   z2 = tan(radians(angle)) * 500 + height/2;
   
   x3 = cos(radians(angle)) * 50 + width/2;
   y3 = sin(radians(angle)) * 50 + height/2;
   z3 = tan(radians(angle)) * 50 + height/2;
   
   colorValue++;
   
   if(colorValue > 250){
     colorValue = 0;
    }
   
  //pink going left to right1 
  stroke(y,colorValue,150,10);
  noFill();
  beginShape();
  vertex(115,z);
  vertex(z,100);
  vertex(250,z);
  endShape();
   
  //pink to blue vertical left to right2
  stroke(y2,colorValue,200,10);
  noFill();
  beginShape();
  vertex(265,y);
  vertex(z,155);
  vertex(265,z2);
  endShape();
   
  //corner shape3
  stroke(125,150,colorValue,10);
  noFill();
  beginShape();
  vertex(345,x);
  vertex(x2,125);
  vertex(500,y2);
  endShape();
   
  //corner shape4
  stroke(x2,colorValue,203,10);
  noFill();
  beginShape();
  vertex(400,y);
  vertex(x,208);
  vertex(550,y);
  endShape();
   
   
  //bottom horizontal yellow right5
  stroke(195,y,colorValue,10);
  noFill();
  beginShape();
  vertex(340,y);
  vertex(x2,425);
  vertex(340,y);
  endShape();
   
  //teal v shape heavy middle6
  stroke(colorValue,y,205,10);
  noFill();
  beginShape();
  vertex(260,z);
  vertex(x,350);
  vertex(395,y);
  endShape();
 
  //green shape vertical fans out left heavy middle7 
  stroke(colorValue,210,245,10);
  noFill();
  beginShape();
  vertex(115,y2);
  vertex(x,345);
  vertex(187,y);
  endShape();
   
  //blue to white horrizontal fans to back8 
  stroke(colorValue,205,50,10);
  noFill();
  beginShape();
  vertex(70,y);
  vertex(x2,215);
  vertex(210,y);
  endShape();
 
  //yellow to white fan heavy middle fanning upwards9
  stroke(x,y,colorValue,5);
  noFill();
  beginShape();
  vertex(x,75);
  vertex(195,y);
  vertex(x2,120);
  endShape();
 
  //red to yellow heavy middle fanning down10
  stroke(215,colorValue,210,5);
  noFill();
  beginShape();
  vertex(x,525);
  vertex(405,y2);
  vertex(z3,475);
  endShape();
   
  //green shape middle top fanning right11
  //stroke(colorValue,y,75,10);
  //noFill();
  //beginShape();
  //vertex(x,80);
  //vertex(450,y2);
  //vertex(x,80);
  //endShape();
   
  //yellow shape fanning up and down middle left12
  stroke(y,50,colorValue,5);
  noFill();
  beginShape();
  vertex(y2,475);
  vertex(185,y);
  vertex(x2,120);
  endShape();
 
angle++;

}

