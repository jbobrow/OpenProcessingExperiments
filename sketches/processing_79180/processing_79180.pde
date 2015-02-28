
// Rebecca Low
// Ben Norskov - Creative Computing - Fall 2012 - Section A
// MIDTERM


void setup() {
  size(470,350);  
  smooth();
  frameRate(15);
}

void draw() {
  background(255);  
  
  ellipseMode(CENTER+10);
  rectMode(CENTER+10); 
  
  // OLD BODY
//  stroke(0);
//  fill(mouseX,80,mouseY);
//  ellipse(mouseX-20,mouseY-10, 100, 100);

  //Hind Right Leg
  line(mouseX-10,mouseY+55,pmouseX-15,pmouseY+65);
  line(mouseX-20,mouseY+55,pmouseX-15,pmouseY+65);
  
  
  // HEAD/BODY
  stroke(0);
  fill(250,101,101);
  ellipse(mouseX-45,mouseY-10,70,70);
  
   // NOSE
  stroke(0);
  fill(250,71,71);
  ellipse(mouseX,mouseY+20,20,20); 

  // EYES
  fill(0); 
  ellipse(mouseX-5,mouseY+5,3,6); 
  ellipse(mouseX+5,mouseY+5,3,6); 

  // LIL LEGS
  stroke(0);
  fill(mouseX, mouseY,0);
  
  // frontleft leg
  line(mouseX-12,mouseY+50,pmouseX-10,pmouseY+60);
  line(mouseX-5,mouseY+50,pmouseX-10,pmouseY+60);
   //front right leg
  line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+60);
  line(mouseX+5,mouseY+50,pmouseX+10,pmouseY+60);
 
    // left hind leg
  line(mouseX-32,mouseY+46,pmouseX-30,pmouseY+56);
  line(mouseX-25,mouseY+46,pmouseX-30,pmouseY+56);
 
  // right ear
  line(mouseX+10,mouseY+5,pmouseX+10,pmouseY-5); //right ear /
  line(mouseX+10,mouseY+5,pmouseX+5,pmouseY-5); //right ear \
   
   //left ear
  line(mouseX-7,mouseY+5,pmouseX-7,pmouseY-5); //left ear /
  line(mouseX-7,mouseY+5,pmouseX-12,pmouseY-5); //left ear \
  
}

void mousePressed() {
  println("Oink!"); 
}

