
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

void draw(){
  
   x = cos(radians(angle)) * 10 + width/2;
   y = sin(radians(angle)) * 10 + height/2;
   z = tan(radians(angle)) * 10 + height/2;
   
   x2 = cos(radians(angle)) * 500 + width/2;
   y2 = sin(radians(angle)) * 500 + height/2;
   z2 = tan(radians(angle)) * 500 + height/2;
   
   x3 = cos(radians(angle)) * 500 + width/2;
   y3 = sin(radians(angle)) * 500 + height/2;
   z3 = tan(radians(angle)) * 500 + height/2;
   
   colorValue++;
   
   if(colorValue > 250){
     colorValue = 0;
    }
   
  //pink going left to right1 
  stroke(y,colorValue,167,10);
  noFill();
  beginShape();
  vertex(115,z);
  vertex(z,106);
  vertex(271,z);
  endShape();
   
   
  //pink to blue vertical left to right2
  stroke(y2,colorValue,203,10);
  noFill();
  beginShape();
  vertex(262,y);
  vertex(z,153);
  vertex(265,z2);
  endShape();
   
  //corner shape3
  stroke(48,154,191,20);
  noFill();
  beginShape();
  vertex(345,x);
  vertex(x2,147);
  vertex(419,y2);
  endShape();
   
  //corner shape4
  stroke(x2,colorValue,203,20);
  noFill();
  beginShape();
  vertex(413,y);
  vertex(x,208);
  vertex(547,y);
  endShape();
   
   
  //bottom horizontal yellow right5
  stroke(192,y,colorValue,10);
  noFill();
  beginShape();
  vertex(338,y);
  vertex(x2,429);
  vertex(338,y);
  endShape();
   
  //teal v shape heavy middle6
  stroke(124,y,203,10);
  noFill();
  beginShape();
  vertex(260,z);
  vertex(x,346);
  vertex(393,y);
  endShape();
 
  //green shape vertical fans out left heavy middle7 
  stroke(colorValue,x,167,10);
  noFill();
  beginShape();
  vertex(113,y2);
  vertex(x,345);
  vertex(187,y);
  endShape();
   
  //blue to white horrizontal fans to back8 
  stroke(colorValue,205,203,10);
  noFill();
  beginShape();
  vertex(71,y);
  vertex(x2,214);
  vertex(207,y);
  endShape();
 
  //yellow to white fan heavy middle fanning upwards9
  stroke(205,y,colorValue,10);
  noFill();
  beginShape();
  vertex(x,74);
  vertex(193,y);
  vertex(x2,121);
  endShape();
 
  //red to yellow heavy middle fanning down10
  stroke(y,colorValue,57,10);
  noFill();
  beginShape();
  vertex(x,524);
  vertex(405,y);
  vertex(z2,477);
  endShape();
   
  //green shape middle top fanning right11
  //stroke(colorValue,y,57,10);
  //noFill();
  //beginShape();
  //vertex(x,80);
  //vertex(412,y2);
  //vertex(x,80);
  //endShape();
   
   
  //yellow shape fanning up and down middle left12
  stroke(x,216,57,10);
  noFill();
  beginShape();
  vertex(x2,475);
  vertex(186,y);
  vertex(x2,118);
  endShape();
 
angle++;

}

