
  /*****************************************
 * Assignment #1
 * Name:         Amanda Guadalupe
 * E-mail:       aguadalupe@brynmawr.edu
 * Course:       CS 110 - Section #2
 * Submitted:    1/25/2012
 * 
 *My sketch is of a cat with a top hat and a cane,
 in the the theater, and he is very excited to be performing
(hense the flashing eyes). He has a very fancy collar in the 
shape of a bow tie using the beginShape/endShape, and his is a bit fat.
I wanted to make him blink by pressing 'w'
but I had trouble with the code. For now he is very happy and
maybe has a slight stage fright!
 ***********************************************/ 




PImage img;

void setup() {
  size(500,500);
  img = loadImage("2615193708_63eaf76051.jpg", "jpg");
  frameRate(20);
}

  
  

void draw(){
  image(img,0,0);
  
  
  //body
   fill(0);
   noStroke();
   ellipse(250,500,600,500);
  
  //head
  noStroke();
  fill(0);
  ellipse(250,250,400,300);
  
   //ears
   noStroke();
   arc(110, 180, 70, 300, -PI, 0);
   arc(385, 180, 70, 300, -PI, 0);
  
  
  //outer eyes
  fill(255,255,255);
  noStroke();
  ellipse(150,200,100,50);
  ellipse(350,200,100,50); //right eye
  
  //pupils
  fill(random(255),random(255),random(255));
  noStroke();
  ellipse(350,200,20,50);
  ellipse(150,200,20,50);
  
  //hat
  fill(0);
  rect(200,10,100,100);
  stroke(255,255,255);
  strokeWeight(8);
  line(150,110,350,110);  
  fill(255,255,255);
  quad(200,80,300,80,200,100,300,100);
  
  //smile
  noStroke();
  fill(255,0,255);
  bezier(200,250,200,200,300,200,300,250);
  
  //bowtie
  fill(255,255,255);
  beginShape(TRIANGLES);
  vertex(250,300);
  vertex(40,200);
  vertex(60,300);
   vertex(250,300);
  vertex(455,200);
  vertex(440,300);
  endShape();
  
  //cane
  strokeWeight(9);
  stroke(255,255,255);
  line(250,475,485,250);
  
  //paws
  noFill();
  strokeWeight(3);
  stroke(255,255,255);
  line(70,360,83,360);
  line(70,330,83,330);
  line(415,360,430,360);
  line(415,330,430,330);
  curve(11,402,77,375,75,307,9,302);
  curve(578,388,430,382,433,298,569,322);

 
}


