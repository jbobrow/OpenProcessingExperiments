
/*
Konkuk University
SOS iDesign

Name: Your Name <<------ Write your full name here!
ID: Your ID <<--------- Write your ID here!

*/

PImage img;

int value = 0;

void setup(){
size (600, 600);
// noLoop();
smooth();
colorMode (RGB);
background(255,255,255);
 // put the image in the same folder as the processing file
}

void draw(){
println(mouseX + " : " + mouseY);

// here you add your code with all shapes and colors. 


strokeWeight(5);
//face


//head

fill(255,255,255);
ellipse(293,273,475,475);

//left arm
line(222,504,189,562);
line(189,562,213,576);
line(235,517,211,600);

//right arm
line(383,495,423,562);
line(423,562,394,575);
line(375,515,400,600);



 if(mousePressed){

 float a=random(255); 
 float b=random(255); 
 float c=random(100); 

fill(247,140,231);

//face
ellipse(294,294,358,358);

//hand
fill(value);
ellipse(197,585,36,36);
ellipse(414,583,36,36);

fill(constrain(mouseX,mouseY,a),b,c); 
strokeWeight(5); 
ellipse(pmouseX,pmouseY,100,100); 



}
}

void keyPressed(){ 


setup(); 


 


} 
 void mouseDragged() {
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  println(e);
}

void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}
