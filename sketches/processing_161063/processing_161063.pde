
/*
Description: I used Picaso as my inspiring artist. 
I tried to imitate his work by including many straight lines, curves and sharp edged shapes in my photo. 
I felt that using mono tone colors that Picaso used for the shapes wasn't necessary for my design. 
*/

void setup(){
  size(500, 500);
  background(0, 0, 0);
  noLoop();
 String  a = "This was made to test the print and string functions. If you're reading this then it worked. Would you kindly buy me Destiny?";
  println(a);
  
}

void draw(){
//this is a red rectangle
  fill(245, 48, 17);
  noStroke();
  rect(0, 40, 40, 460);
//this is a green rectangle
  fill(0, 255, 9);
  noStroke();
  rect(0, 0, 460, 40);
//this is a yellow rectangle
  fill(235, 255, 0);
  noStroke();
  rect(460, 0, 40, 460);
//this is a blue rectangle
  fill(13, 22, 250);
  noStroke();
  rect(40, 460, 460, 40);
//this is the black circle in the top middle
  fill(0, 0, 0);
  strokeWeight(3);
  noStroke();
  ellipse(250, 20, 10, 10);
//This is a black circle
  noFill();
  strokeWeight(5);
  stroke(0, 0, 0);
  ellipse(250, 250, 595, 595);
//this is the clear white circle
  noFill();
  strokeWeight(3);
  stroke(255, 255, 255);
  ellipse(250, 250, 418, 418);
//this is a pink triangle
  fill(255, 5, 99);
  tint(255, 127);
  noStroke();
  triangle(250, 41, 81, 374, 418, 374);
//this is a bezier
  fill(190, 49, 219);
  noStroke();
  bezier(255, 50, 350, 40, 500, 300, 415, 365);
//this is a bezier
  fill(190, 49, 219);
  noStroke();
  bezier(245, 50, 150, 40, -10, 290, 85, 364);
//this is a line
  strokeWeight(5);
  stroke(0, 0, 0);
  line(290, 0, 40, 500);
//this is a line
  strokeWeight(5);
  stroke(0, 0, 0);
  line(0, 354, 500, 354);
//this is a line
  strokeWeight(5);
  stroke(0, 0, 0);
  line(210, 0, 460, 500);
//this is a quad 
  fill(0, 0, 0);
  strokeWeight(3);
  stroke(0, 0, 0);
  quad(200, 355, 200, 185, 300, 352, 300, 185);
//this is a grey triangle
  noStroke();
  fill(121, 119, 119);
  triangle(210, 348, 290, 348, 250, 290);
//this is a grey triangle
  noStroke();
  fill(121, 119, 119);
  triangle(128, 348, 195, 348, 195, 205);
//this is a grey triangle
  noStroke();
  fill(121, 119, 119);
  triangle(375, 348, 305, 348, 305, 205);
//this is a line
  strokeWeight(5);
  stroke(0, 0, 0);
  line(0, 40, 500, 40);
//this is a line
  strokeWeight(5);
  stroke(0, 0, 0);
  line(0, 460, 500, 460);
// this is a line
  strokeWeight(5);
  stroke(0, 0, 0);
  line(40, 0, 40, 500);
// this is a line
  strokeWeight(5);
  stroke(0, 0, 0);
  line(460, 0, 460, 500);
// this is a line
  strokeWeight(5);
  stroke(0, 0, 0);
  line(0, 0, 500, 500);
// this is a line
  strokeWeight(5);
  stroke(0, 0, 0);
  line(500, 0, 0, 500);
//this is the description string
  String b = "Description: I used Picaso as my inspiring artist. I tried to imitate his work by including many straight lines, curves and sharp edged shapes in my photo. I felt that using mono tone colors that Picaso used for the shapes wasn't necessary for my design.";
  println(b);
  String c = "I tried working with the transparency coding but couldn't figure out how to work with all of the components";
  println(c);
  
}

/* I tried working with the transparency and float coding but 
couldn't figure out how to work with all of the components.
  
// THIS IS A TEST

PImage img;
float offset = 0;
float easing = 0.05;

void setup() {
  size(500, 500);
  img = loadImage("imgres.jpg");

image(img, 0, 0);
  float dx = (mouseX-img.width/2) - offset;
  offset += dx * easing; 
  tint(255, 127);
  image(img, offset, 0);
  
  */


