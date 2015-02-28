
//Name: Diana Willits
//Project: Workshop 2
//due Wed, January 16, 2013
//Class: Digital Media 1
//Summary:  Crop and make a mock of Kandinsky's Composition VIII
 
// Clone this sketch for Workshop 2,
// then write your program below...
color random; 
color trianglecolor;
void setup(){ 
size(600, 600);
background(234, 229, 217);
}
 
void draw(){
//triangle

background(234, 229, 217);
if(mouseButton == RIGHT)
{
  fill(trianglecolor);
  //background(randomColor);
  strokeWeight(20);
}

else{
fill(161, 183, 202,155);
}

strokeWeight(2);
triangle(50, 600, 202, 430, 410, 600);

 
//lines
if(mousePressed == true && mouseButton == LEFT){
  line(200, 600, 200, pmouseY);   //main,left straight line
}
else{
  line(200, 600, 200, 100);   //main,left straight line
}

if(mousePressed == true && mouseButton == LEFT){
  line(100, 120, pmouseX, 280);   //top diagonal line
}
else{
    line(100, 120, 450, 280);
}

if(mousePressed == true && mouseButton == LEFT){
  for(int i=0; i<100; i++)
  {
      line(130, 280, 300, 278);   //top of two tiny parallel lines
  }
}
else
{
  line(130, 280, 300, 278);   //top of two tiny parallel lines
}

 
//bottom curve line
noFill();
beginShape();
curveVertex(460,  520);
curveVertex(460,  520);
curveVertex(520,  380);
curveVertex(600,  300);
curveVertex(600,  300);
endShape();
 
//top curve line
noFill();
strokeWeight(4);
beginShape();

if(mousePressed ==true && mouseButton == RIGHT){
  strokeWeight(20);
  curveVertex(pmouseX,  pmouseY);
  curveVertex(pmouseX,  pmouseY);
}
  
else{
  curveVertex(450,  490);
  curveVertex(450,  490);
}

  curveVertex(500,  350);
  curveVertex(600,  180);
  curveVertex(600,  180);
endShape();
 
if(mousePressed == true && mouseButton == LEFT){ 
  line(pmouseX-310, 310, pmouseX-135, 305);   //bottom of two tiny parallel lines
}
else{
    line(145, 310, 320, 305);   //bottom of two tiny parallel lines
}

//bold black figure
fill(0);
beginShape();
curveVertex(180, 620);
curveVertex(180, 620);
curveVertex(290, 520);

if(mousePressed ==true && mouseButton == RIGHT){
  strokeWeight(20);
  curveVertex(pmouseX,  pmouseY);
  curveVertex(pmouseX,  pmouseY);
}

else{  
curveVertex(317, 360);    //top point of curve
}

curveVertex(305, 430);
curveVertex(285, 500);
curveVertex(220, 560);
curveVertex(50, 620);
curveVertex(50, 620);
endShape();

}

void mouseReleased(){
  randomColor = color(random(255),random(255),random(255));
  trianglecolor = color(random(155),random(155),random(155));
}


