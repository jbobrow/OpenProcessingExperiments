
PImage img;

void setup(){
  background(229, 232, 110);
size (600, 600);
 // noLoop();
smooth();
colorMode (RGB, 600);
 img = loadImage ("wassily_kandinsky.jpg"); // put the image in the same folder as the processing file
 }

void draw(){
  println(mouseX + " : " + mouseY);
  point(500,0);
  noStroke();
  fill(mouseX,mouseY,428);
  ellipse(170,200,200,200);
  fill(mouseX,mouseY,0);
  ellipse(400,400,300,300);
  fill(mouseY,mouseX,255);
  triangle(400,0,300,250,470,300);
  stroke(0);
  strokeWeight (5); 
  line(100,0,300,600);
  strokeWeight (2); 
  line(0,200,400,200);
  strokeWeight (2);
  line(415,0,600,400);
  strokeWeight (8);
  line(200,0,410,380);
  strokeWeight (2);
  line(100,420,420,420);
  fill(mouseX,mouseY,350);
  rect(480,500,50,50);
  strokeWeight (3);
  line(510,510,540,510);
  strokeWeight (8);
  line(510,520,540,520);
  noFill();
  strokeWeight(2);
  bezier(0,400,50,370,80,500,80,580);
  quad(550,0,530,90,526,180,580,170); 
 
  
  
  

}
  




