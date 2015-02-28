
//Assignment #2
//Name: Jessica Tan
//E-mail: jtan@brynmawr.edu
//Date: 9/16/10

  float x=230;
  float y=180;
  float w=140;
  float h=310;
  float speed= 1;
  
void setup() {
  
  size(600, 500);
  background(237, 216, 170);
  smooth();
  
}

void draw() {
 
  strokeWeight(1);
 //main feathers
 noStroke();
 fill(52, 142, 82, 10);
 beginShape();
 curveVertex(w+160, h+30);
 curveVertex(w+160, h+30);
 curveVertex(w, h-150);
 curveVertex(w+20, h-290);
 curveVertex(w+140, h-210);
 curveVertex(w+160, h+30);
 curveVertex(w+160, h+30);
 endShape(CLOSE);
 
  noStroke();
fill(52, 142, 82, 10);
 beginShape();
 curveVertex(w+140, h+30);
 curveVertex(w+140, h+30);
 curveVertex(w+300, h-150);
 curveVertex(w+280, h-290);
 curveVertex(w+160, h-210);
 curveVertex(w+140, h+30);
 curveVertex(w+140, h+30);
 endShape(CLOSE);
 
 stroke(73, 121, 117);
 fill(52, 142, 82, 10);
 beginShape();
 curveVertex(w+160, h+30);
 curveVertex(w+160, h+30);
 curveVertex(w-60, h-50);
 curveVertex(w-60, h-150);
 curveVertex(w+60, h-150);
 curveVertex(w+160, h+30);
 curveVertex(w+160, h+30);
 endShape(CLOSE);
 
 stroke(73, 121, 117);
 fill(52, 142, 82, 10);
 beginShape();
 curveVertex(w+140, h+30);
 curveVertex(w+140, h+30);
 curveVertex(w+360, h-50);
 curveVertex(w+360, h-150);
 curveVertex(w+240, h-150);
 curveVertex(w+140, h+30);
 curveVertex(w+140, h+30);
 endShape(CLOSE);
 
 noStroke();
 fill(52, 142, 82, 10);
 beginShape();
 curveVertex(w+160, h+30);
 curveVertex(w+160, h+30);
 curveVertex(w-80, h+50);
 curveVertex(w-100, h-10);
 curveVertex(w-20, h-50);
 curveVertex(w+160, h+30);
 curveVertex(w+160, h+30);
 endShape(CLOSE);
 
 fill(52, 142, 82, 10);
 beginShape();
 curveVertex(w+140, h+30);
 curveVertex(w+140, h+30);
 curveVertex(w+380, h+50);
 curveVertex(w+400, h-10);
 curveVertex(w+320, h-50);
 curveVertex(w+140, h+30);
 curveVertex(w+140, h+30);
 endShape(CLOSE);
 
 //feather splotches
 //outer orange
 fill(245, 134, 30, 10);
 ellipse(w+70, h-200, 100, 100);
 ellipse(w+10, h-100, 100, 100);
 ellipse(w-40, h-10, 70, 70);
 ellipse(w+230, h-200, 100, 100);
 ellipse(w+290, h-100, 100, 100);
 ellipse(w+340, h-10, 70, 70);
 //outer light blue
 fill(86,229,209,80);
 ellipse(w+75, h-190, 50, 50);
 ellipse(w+18, h-96, 50, 50);
 ellipse(w-30, h-10, 35, 35);
 ellipse(w+225, h-190, 50, 50);
 ellipse(w+282, h-96, 50, 50);
 ellipse(w+330, h-10, 35, 35);
 //inner dark blue
 fill(18, 23, 203, 80);
 ellipse(w+77, h-185, 35, 35);
 ellipse(w+22, h-94, 35, 35);
 ellipse(w-25, h-10, 22, 22);
 ellipse(w+223, h-185, 35, 35);
 ellipse(w+278, h-94, 35, 35);
 ellipse(w+325, h-10, 22, 22);
 
 //feather skeletons
 stroke(12,34,39);
 noFill();
 curve(w-140, h-310, w+20, h-290, w+160, h+30, w+160, h+30);
 curve(w-140, h-50, w-60, h-150, w+160, h+30, w+160, h+30);
 curve(w-200, h+150, w-100, h-10, w+160, h+30, w+160, h+30);
 
 curve(w+440, h-310, w+280, h-290, w+140, h+30, w+140, h+30);
 curve(w+440, h-50, w+360, h-150, w+140, h+30, w+140, h+30);
 curve(w+500, h+150, w+400, h-10, w+140, h+30, w+140, h+30);

  
 
  
  //headfeathers
  stroke(0);
  strokeWeight(1.5);
  line(w+154, h-116, w+110, h-160);
  line(w+154, h-116, w+90, h-130);
  line(w+154, h-116, w+100, h-145);
  noStroke();
  fill(34, 37, 175);
  ellipse(w+110, h-160, 10, 10);
  ellipse(w+90, h-130, 10, 10);
  ellipse(w+95, h-148, 10, 10);
  
  //peacock body
  noStroke();
  fill(66, 81, 227);
  beginShape();
  curveVertex(w+230, h-80);
  curveVertex(w+230, h-80);
  curveVertex(w+180, h-50);
  curveVertex(w+200, h+30);
  curveVertex(w+220, h+150);
  curveVertex(w+100, h+150);
  curveVertex(w+120, h+30);
  curveVertex(w+140, h-50);
  curveVertex(w+160, h-130);
  curveVertex(w+230, h-80);
  curveVertex(w+230, h-80);
  endShape(CLOSE);
  
   //eye
  fill(0);
  ellipse(w+172, h-100, 15, 15);
  stroke(0);
  strokeWeight(1);
  curve(w+150, h-60, w+157 , h-102, w+187, h-102, w+194, h-60);
  line(w+162, h-106, w+158, h-112);
  line(w+164, h-108, w+163, h-112);
  fill(255);
  ellipse(w+174, h-102, 4, 4);
  
  w=w+speed;
  if ((w>=160) || (w<=140)) {
  speed= speed* -1;
  }
  
}

void mousePressed() {
  stroke(0);
  strokeWeight(6);
  fill(0);

  ellipse(mouseX, mouseY, 15, 15);
  ellipse(mouseX+35, mouseY+4, 15,15);
  line(mouseX+8, mouseY, mouseX+12, mouseY-40);
  line(mouseX+43, mouseY, mouseX+49, mouseY-38);
  line(mouseX+12, mouseY-40, mouseX+49, mouseY-38);
  strokeWeight(3);
  line(mouseX+10, mouseY-30, mouseX+48, mouseY-28);
  
 
  
}

