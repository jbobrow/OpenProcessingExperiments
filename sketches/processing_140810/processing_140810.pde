
void setup(){
size(600, 600);
}
void draw() {


smooth();

strokeWeight(2);

background(127 , 255 , 212);

ellipseMode(RADIUS);

// Neck



// Antennae

//line(276, 145, 216, 112); // Small
//ellipse(276, 145, 10, 10);

//line(276, 155, 306, 56); // Tall

//line(276, 155, 342, 170); // Medium

// Body

noStroke(); // Disable stroke

fill(102); // Set fill to gray

ellipse(264, 377, 33, 33); 
ellipse(159, 377, 33, 33); 
fill(200);
ellipse(159, 377, 25, 25); 
ellipse(264, 377, 25, 25);
stroke(102);
line(0,409,600,409);
fill(100); 

ellipse(219, 257, 95, 95);//body

fill(102); 



// Head

fill(102); // Set fill to black

rect(266, 145, 90, 45); // Head



   
  float x = mouseX;
  float y = mouseY;

fill(255);
  stroke(80);
  strokeWeight(3);
  ellipse(266,145,30,30);
  float pupilxone = map(mouseX,0,width,266,280);
  float pupilyax = map(mouseY,0,height,150,170);
  noStroke();
  fill(0);
  ellipse(pupilxone,pupilyax,10,10);

fill(255,51,51);
beginShape();
vertex(266, 190);
vertex(85, 20);
vertex(85, 75);
vertex(30, 75);
endShape();


if (mousePressed) {

 stroke(125);

 } else {

 stroke(127 , 255 , 212); 

 }

 line( 100, 257,2, 257);
  line( 100, 267,2, 267);
  line( 100, 277,2, 277);

}






