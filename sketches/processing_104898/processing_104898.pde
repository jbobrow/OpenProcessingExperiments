
void setup(){
size(400,400);
 

}

int boxcolor = 0; 
int boxcolor2 = 0;
int pointleft = 0;
int pointright = 0;
int linevertical1=0;
int linevertical2=0;

void draw () {
background(224,226,215);
  
boxcolor = boxcolor + mouseX;
  if (boxcolor > 255) {
    boxcolor = 0;}
    
    boxcolor2 = boxcolor2 + mouseY;
  if (boxcolor2 > 255) {
    boxcolor2 = 0;}
    
    pointleft = 100 + mouseX;
  if (pointleft > 400) {
    pointleft = 0;}
  
   pointright = 100 + mouseY;
  if (pointright > 400) {
    pointright = 0;}
    
    linevertical1 ++;
    if (linevertical1 > 400){
      linevertical1=0;}
      
      linevertical2 =linevertical2 - 1;
    if (linevertical2 < 0){
      linevertical2= 400;}
      
  
fill(boxcolor, boxcolor2, boxcolor); //yellow box top  248,209,104
noStroke();
beginShape();
vertex(250,pointleft-50);
vertex(pointright+200,0);
vertex(375,pointleft+75);
vertex(pointright-10,150);
endShape(CLOSE);

 
fill(boxcolor2, boxcolor2, boxcolor); //yellow box bottom  248,209,104
noStroke();
beginShape();
vertex(pointright+100,pointright+50);
vertex(pointleft+75,pointleft-300);
vertex(pointright-200,pointright+250);
vertex(pointleft-20,pointleft-50);
endShape(CLOSE);
 
fill(boxcolor2, boxcolor, boxcolor2); //red box bottom  250,0,0
noStroke();
beginShape();
vertex(pointleft+175,pointleft+200);
vertex(pointleft+250,pointleft+200);
vertex(pointright+150,pointright+350);
vertex(pointright+175,pointright+190);
endShape(CLOSE);
 
 
 
fill(0); //black box left
strokeWeight(7);
beginShape();
vertex(pointleft-50,pointleft-20);
vertex(pointright-10,pointright-50);
vertex(pointright-150,pointright-35);
vertex(pointleft-50,pointleft-35);
endShape(CLOSE);
 
fill(0); //black box right
strokeWeight(7);
beginShape();
vertex(pointright+150,pointleft+350);
vertex(pointleft+250,pointright+35);
vertex(pointright+25,pointleft+200);
vertex(pointleft+150,pointright+40);
endShape(CLOSE);
 
stroke(0);
strokeWeight(7);
line(linevertical1+10,50,linevertical1+375,50);
line(375,linevertical2+10,375,linevertical2+385);
line(50,linevertical1+50,50,linevertical1+375);
line(100,linevertical2+10,100,linevertical2+350);
line(250,linevertical1+2,250,linevertical1+375);
line(linevertical2+10,150,linevertical2+375,150);
line(310,linevertical2+150,310,linevertical2+250);
line(linevertical1+50,250,linevertical1+375,250);
line(linevertical2+10,300,linevertical2+400,300);
line(linevertical1+150,350,linevertical1+375,350);
line(150,linevertical1+350,150,linevertical1+385);
 
 
fill(250,0,0); //red box top
beginShape();
vertex(pointleft,50);
vertex(250,pointleft);
vertex(pointright,250);
vertex(50,pointright);
endShape(CLOSE);
 
fill(19,30,156); //blue box bottom
beginShape();
vertex(pointleft+250,pointleft+300);
vertex(pointright-30,pointright-30);
vertex(pointleft+50,pointleft+375);
vertex(pointright-25,pointright-37);
endShape(CLOSE);
}





