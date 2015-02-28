
/*

 Liz Rutledge
 August 3, 2011
 Geometry!
 
 
 */


int numFish = 5;
String typeOfFish = "clown";

boolean isOrange = false;
float kitten = 5.0;
float dog = 5.9;
String yay = "yay!!!!!!"; 
float rectangleWidth = 30;
float circleX = 20;
  
  

void setup() {
  size(600, 400);
  background(80);
  frameRate(30); 
  smooth();
}

void draw() {
  
  background(80);
  
  // square colors 
  fill(#41935c);
  stroke(0);
  strokeWeight(2);

  //rect (draw a square!)
  rectMode(CENTER);
  rect(width/2, height/2, 100, 100);

  //quad(x1, y1, x2, y2, x2, y3, x4, y4)
  noFill();
  quad(10, 10, 10 + rectangleWidth, 10, 10 +rectangleWidth, 10 +rectangleWidth, 10, 10 +rectangleWidth);


  //change colors!
  fill(100, 0, 200);
  stroke(70, 0, 160);
  strokeWeight(5);

  //draw a circle!
  noStroke();
  ellipseMode(CENTER);
  ellipse(circleX, height/2, 30 , 30);


  //restore colors
  fill(120, 0, 230);
  stroke(0);
  strokeWeight(2);


  //draw a line!
  line(0, 0, width, height);

  //draw a triangle!
  strokeWeight(2);
  stroke(0);
  triangle(400, 200, 420, 200, 410, 220);

  point(width/2, height/2);

  colorMode(RGB);
  fill(200, 255, 255);
  rect(500, 100, 50, 50);


  colorMode(HSB);
  fill(200, 255, 255);
  rect(500, 300, 50, 50);
  colorMode(RGB);
  
  //draw a crazy shape!!!
  beginShape();
  vertex(100, 20);
  vertex(300,25);
  vertex(20*8, (432-60)/2);
  vertex(173, 233/2);
  vertex(10,100);
  vertex(100, 20);
  endShape();

  ellipseMode(CORNER);
  ellipse(width/2 -350, height-200, 700,700);
  
/*  
  println(5);
  println(5+8);
  println(5.0/8.0);
  print("this should be 3: ");
  println(8%5);
*/

  
 
 //can you please add 5 to kitten;
 kitten = (kitten+3.0)/2;
 
 
 
 println(kitten);
 
 
 rectangleWidth = rectangleWidth + 1;
 circleX = circleX +1;
}


