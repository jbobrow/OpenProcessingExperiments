
// Variables
 
int circleOpac = 255;

int redValue = 255;
int greenValue = 255;
int blueValue = 255;
 
int redValue2 = 65;
int greenValue2 = 120;
int blueValue2 = 220;
 
int redValue3 = 255;
int greenValue3 = 195;
int blueValue3 = 0;


int borderAlpha = 0;



 
void setup() {
 
size(480, 360);
background(255,255,255,255);

}
  
void draw() {
  
// All code below is background information for the yellow and blue vertical rectangles. The mapping code determines the fading in and out of the blue and yellow vertical rectangles based on the X-Location of the users mouse.
 
 
 stroke(255);
 strokeWeight(3);


circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue2, greenValue2, blueValue2, circleOpac);
rect(0,0,40,360);
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue3, greenValue3, blueValue3, circleOpac);
rect(0,0,40,360);
 
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue3, greenValue3, blueValue3, circleOpac);
rect(40,0,40,360);
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue2, greenValue2, blueValue2, circleOpac);
rect(40,0,40,360);
 
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue2, greenValue2, blueValue2, circleOpac);
rect(80,0,40,360);
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue3, greenValue3, blueValue3, circleOpac);
rect(80,0,40,360);
 
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue3, greenValue3, blueValue3, circleOpac);
rect(120,0,40,360);
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue2, greenValue2, blueValue2, circleOpac);
rect(120,0,40,360);
 
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue2, greenValue2, blueValue2, circleOpac);
rect(160,0,40,360);
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue3, greenValue3, blueValue3, circleOpac);
rect(160,0,40,360);
 
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue3, greenValue3, blueValue3, circleOpac);
rect(200,0,40,360);
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue2, greenValue2, blueValue2, circleOpac);
rect(200,0,40,360);
 
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue2, greenValue2, blueValue2, circleOpac);
rect(240,0,40,360);
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue3, greenValue3, blueValue3, circleOpac);
rect(240,0,40,360);
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue3, greenValue3, blueValue3, circleOpac);
rect(280,0,40,360);
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue2, greenValue2, blueValue2, circleOpac);
rect(280,0,40,360);
 
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue2, greenValue2, blueValue2, circleOpac);
rect(320,0,40,360);
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue3, greenValue3, blueValue3, circleOpac);
rect(320,0,40,360);
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue3, greenValue3, blueValue3, circleOpac);
rect(360,0,40,360);
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue2, greenValue2, blueValue2, circleOpac);
rect(360,0,40,360);
 
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue2, greenValue2, blueValue2, circleOpac);
rect(400,0,40,360);
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue3, greenValue3, blueValue3, circleOpac);
rect(400,0,40,360);
 
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue3, greenValue3, blueValue3, circleOpac);
rect(440,0,40,360);
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue2, greenValue2, blueValue2, circleOpac);
rect(440,0,40,360);
 
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue2, greenValue2, blueValue2, circleOpac);
rect(480,0,40,360);
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue3, greenValue3, blueValue3, circleOpac);
rect(480,0,40,360);
  
  
  
  
// All code below is background information for the horizontal transparent rectangles.
  
stroke(255,255,255,255);
fill(255,255,255,50);
rect(0,0,480,40);
fill(255,255,255,75);
rect(0,40,480,40);
fill(255,255,255,90);
rect(0,80,480,40);
fill(255,255,255,120);
rect(0,120,480,40);
fill(255,255,255,150);
rect(0,160,480,40);
fill(255,255,255,150);
rect(0,200,480,40);
fill(255,255,255,120);
rect(0,240,480,40);
fill(255,255,255,90);
rect(0,280,480,40);
fill(255,255,255,75);
rect(0,320,480,40);
fill(255,255,255,50);
rect(0,360,480,40);
  
  
  
// All code below is information for the shapes in the border of the piece.

noStroke();

// The else/if code below will change the transparencies of the shapes in the border based on a 10 second cycle where they will fade out completely and then fade back into to 100% visibility.


  if(borderAlpha < 15){
    fill(255, 255, 255, 255);
     }
  else if(borderAlpha < 30) {
    fill(255, 255, 255, 229.5);
     }
  else if(borderAlpha < 45) {
    fill(255, 255, 255, 204);
     }
  else if(borderAlpha < 60) {
    fill(255, 255, 255, 178.5);
     }
  else if(borderAlpha < 75) {
    fill(255, 255, 255, 153);
     }
  else if(borderAlpha < 90) {
    fill(255, 255, 255, 127);
     }
  else if(borderAlpha < 105) {
    fill(255, 255, 255, 102);
     }
  else if(borderAlpha < 120) {
    fill(255, 255, 255, 76.5);
     }
  else if(borderAlpha < 135) {
    fill(255, 255, 255, 51);
     }
  else if(borderAlpha < 150) {
    fill(255, 255, 255, 25.5);
     }
  else if(borderAlpha < 165) {
    fill(255, 255, 255, 0);
     }
  else if(borderAlpha < 180) {
    fill(255, 255, 255, 25.5);
     }
  else if(borderAlpha < 195) {
    fill(255, 255, 255, 51);
     }
  else if(borderAlpha < 210) {
    fill(255, 255, 255, 76.5);
     }
  else if(borderAlpha < 225) {
    fill(255, 255, 255, 102);
     }
  else if(borderAlpha < 240) {
    fill(255, 255, 255, 127);
     }
  else if(borderAlpha < 255) {
    fill(255, 255, 255, 153);
     }
  else if(borderAlpha < 270) {
    fill(255, 255, 255, 178.5);
     }
  else if(borderAlpha < 285) {
    fill(255, 255, 255, 204);
     }
  else {
    fill(255, 255, 255, 255);
     }
   
  borderAlpha++;
  if(borderAlpha > 300) {
    borderAlpha = 0;
  }
   


// Top Row
 
rect(10,10,20,20);
triangle(50,30,60,10,70,30);
triangle(90,10,100,30,110,10);
rect(130,10,20,20);
triangle(170,30,180,10,190,30);
rect(210,10,60,20);
triangle(290,30,300,10,310,30);
rect(330,10,20,20);
triangle(370,30,380,10,390,30);
triangle(410,10,420,30,430,10);
rect(450,10,20,20);
  
  // Bottom Row
  
rect(10,330,20,20);
triangle(50,330,60,350,70,330);
triangle(90,350,100,330,110,350);
rect(130,330,20,20);
triangle(170,330,180,350,190,330);
rect(210,330,60,20);
triangle(290,330,300,350,310,330);
rect(330,330,20,20);
triangle(370,330,380,350,390,330);
triangle(410,350,420,330,430,350);
rect(450,330,20,20);
   
 // Left Column
  
triangle(10,60,30,50,30,70);
triangle(10,90,30,100,10,110);
triangle(10,140,30,130,30,150);
rect(10,170,20,20);
triangle(10,220,30,210,30,230);
triangle(10,250,30,260,10,270);
triangle(10,300,30,290,30,310);
  
  // Right Column
  
triangle(450,50,470,60,450,70);
triangle(450,100,470,90,470,110);
triangle(450,130,470,140,450,150);
rect(450,170,20,20);
triangle(450,210,470,220,450,230);
triangle(450,260,470,250,470,270);
triangle(450,290,470,300,450,310);
  
  // Filler Shapes written from left to right. These fade in a similar fashion to those above but with opposite timing.

if(borderAlpha < 15){
    fill(255, 255, 255, 0);
     }
  else if(borderAlpha < 30) {
    fill(255, 255, 255, 25.5);
     }
  else if(borderAlpha < 45) {
    fill(255, 255, 255, 51);
     }
  else if(borderAlpha < 60) {
    fill(255, 255, 255, 76.5);
     }
  else if(borderAlpha < 75) {
    fill(255, 255, 255, 102);
     }
  else if(borderAlpha < 90) {
    fill(255, 255, 255, 127.5);
     }
  else if(borderAlpha < 105) {
    fill(255, 255, 255, 153);
     }
  else if(borderAlpha < 120) {
    fill(255, 255, 255, 178.5);
     }
  else if(borderAlpha < 135) {
    fill(255, 255, 255, 204);
     }
  else if(borderAlpha < 150) {
    fill(255, 255, 255, 229.5);
     }
  else if(borderAlpha < 165) {
    fill(255, 255, 255, 255);
     }
  else if(borderAlpha < 180) {
    fill(255, 255, 255, 229.5);
     }
  else if(borderAlpha < 195) {
    fill(255, 255, 255, 204);
     }
  else if(borderAlpha < 210) {
    fill(255, 255, 255, 178.5);
     }
  else if(borderAlpha < 225) {
    fill(255, 255, 255, 153);
     }
  else if(borderAlpha < 240) {
    fill(255, 255, 255, 127.5);
     }
  else if(borderAlpha < 255) {
    fill(255, 255, 255, 102);
     }
  else if(borderAlpha < 270) {
    fill(255, 255, 255, 76.5);
     }
  else if(borderAlpha < 285) {
    fill(255, 255, 255, 51);
     }
  else {
    fill(255, 255, 255, 25.5);
     }
   
  borderAlpha++;
  if(borderAlpha > 300) {
    borderAlpha = 0;
  }
triangle(50,210,70,220,50,230);
triangle(50,260,70,250,70,270);
rect(50,290,20,20);
triangle(90,220,110,210,110,230);
rect(90,250,20,20);
triangle(90,290,110,290,100,310);
rect(130,290,20,20);
triangle(170,310,180,290,190,310);
rect(210,290,20,20);
rect(250,290,20,20);
triangle(290,310,300,290,310,310);
triangle(290,250,310,250,300,270);
triangle(290,230,300,210,310,230);
rect(330,210,20,20);
triangle(370,210,390,220,370,230);
triangle(410,220,430,210,430,230);
rect(410,170,20,20);
triangle(410,140,430,130,430,150);
triangle(410,90,410,110,430,100);
rect(410,50,20,20);
triangle(370,70,380,50,390,70);
triangle(290,50,300,70,310,50);
rect(250,50,20,20);
rect(210,50,20,20);
rect(210,90,20,20);
  
  
  
// Code below is for the  smaller blue and yellow squares located within the white squares of the border.
  
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue3, greenValue3, blueValue3, circleOpac);
 
rect(15,15,10,10);
 
rect(15,335,10,10);
 
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue2, greenValue2, blueValue2, circleOpac);
 
rect(15,15,10,10);
 
rect(15,335,10,10);
 
  
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue2, greenValue2, blueValue2, circleOpac);
 
rect(455,15,10,10);
 
rect(455,335,10,10);
  
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue3, greenValue3, blueValue3, circleOpac);
 
rect(455,15,10,10);
 
rect(455,335,10,10);
  
  

  
  
// Code below is for the groups of ellipses in the interior of the piece.
  
// Top left group of ellipses.

stroke(255);
strokeWeight(3); 

circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue2, greenValue2, blueValue2, circleOpac);


 
ellipse(60,60,20,20);
ellipse(60,100,20,20);
ellipse(60,140,20,20);
ellipse(60,180,10,10);
 
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue3, greenValue3, blueValue3, circleOpac);
 
ellipse(60,60,20,20);
ellipse(60,100,20,20);
ellipse(60,140,20,20);
ellipse(60,180,20,20);
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue3, greenValue3, blueValue3, circleOpac);
 
ellipse(100,60,20,20);
ellipse(100,100,20,20);
ellipse(100,140,20,20);
ellipse(100,180,20,20);
 
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue2, greenValue2, blueValue2, circleOpac);
 
ellipse(100,60,20,20);
ellipse(100,100,35,35);
ellipse(100,140,20,20);
ellipse(100,180,10,10);
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue2, greenValue2, blueValue2, circleOpac);
 
ellipse(140,60,20,20);
ellipse(140,100,35,35);
ellipse(140,140,20,20);
ellipse(140,180,20,20);
 
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue3, greenValue3, blueValue3, circleOpac);
 
ellipse(140,60,20,20);
ellipse(140,100,20,20);
ellipse(140,140,20,20);
ellipse(140,180,20,20);
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue3, greenValue3, blueValue3, circleOpac);
 
ellipse(180,60,20,20);
ellipse(180,100,20,20);
ellipse(180,140,20,20);
ellipse(180,180,20,20);
  
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue2, greenValue2, blueValue2, circleOpac);
 
ellipse(180,60,20,20);
ellipse(180,100,20,20);
ellipse(180,140,20,20);
ellipse(180,180,20,20);
  
// Center left group of ellipses.
  
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue2, greenValue2, blueValue2, circleOpac);
  
ellipse(140,220,10,10);
ellipse(140,260,10,10);
 
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue3, greenValue3, blueValue3, circleOpac);
 
ellipse(140,220,10,10);
ellipse(140,260,10,10);
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue3, greenValue3, blueValue3, circleOpac);
 
ellipse(180,220,25,25);
ellipse(180,260,10,10);
 
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue2, greenValue2, blueValue2, circleOpac);
 
ellipse(180,220,10,10);
ellipse(180,260,10,10);
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue2, greenValue2, blueValue2, circleOpac);
 
ellipse(220,140,10,10);
ellipse(220,180,10,10);
ellipse(220,220,10,10);
ellipse(220,260,10,10);
 
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue3, greenValue3, blueValue3, circleOpac);
 
ellipse(220,140,10,10);
ellipse(220,180,10,10);
ellipse(220,220,25,25);
ellipse(220,260,10,10);
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue3, greenValue3, blueValue3, circleOpac);
 
ellipse(260,220,10,10);
ellipse(260,260,10,10);
  
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue2, greenValue2, blueValue2, circleOpac);
 
ellipse(260,220,10,10);
ellipse(260,260,10,10);
 
 
 
 
// Center right group of ellipses.
  
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue3, greenValue3, blueValue3, circleOpac);
 
ellipse(260,100,15,15);
ellipse(260,140,15,15);
ellipse(260,180,15,15);
 
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue2, greenValue2, blueValue2, circleOpac);
 
ellipse(260,100,15,15);
ellipse(260,140,15,15);
ellipse(260,180,15,15);
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue2, greenValue2, blueValue2, circleOpac);
 
ellipse(300,100,15,15);
ellipse(300,140,15,15);
ellipse(300,180,15,15);
 
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue3, greenValue3, blueValue3, circleOpac);
 
ellipse(300,100,15,15);
ellipse(300,140,15,15);
ellipse(300,180,15,15);
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue3, greenValue3, blueValue3, circleOpac);
 
ellipse(340,180,15,15);
 
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue2, greenValue2, blueValue2, circleOpac);
 
ellipse(340,180,15,15);
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue2, greenValue2, blueValue2, circleOpac);
 
ellipse(380,100,15,15);
ellipse(380,140,15,15);
ellipse(380,180,15,15);
  
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue3, greenValue3, blueValue3, circleOpac);
 
ellipse(380,100,15,15);
ellipse(380,140,15,15);
ellipse(380,180,15,15);
  
  
  
  
// Top right group of ellipses.
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue3, greenValue3, blueValue3, circleOpac);
 
ellipse(340,60,25,25);
ellipse(340,100,25,25);
ellipse(340,140,25,25);
 
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue2, greenValue2, blueValue2, circleOpac);
 
ellipse(340,60,25,25);
ellipse(340,100,25,25);
ellipse(340,140,25,25);
 
// Bottom right group of ellipses.
  
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue3, greenValue3, blueValue3, circleOpac);
 
ellipse(340,260,25,25);
ellipse(340,300,25,25);
 
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue2, greenValue2, blueValue2, circleOpac);
 
ellipse(340,260,15,15);
ellipse(340,300,15,15);
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue2, greenValue2, blueValue2, circleOpac);
 
ellipse(380,260,15,15);
ellipse(380,300,15,15);
 
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue3, greenValue3, blueValue3, circleOpac);
 
ellipse(380,260,25,25);
ellipse(380,300,25,25);
 
circleOpac = map(mouseX, 0, width/2, 255, 0);
fill(redValue3, greenValue3, blueValue3, circleOpac);
 
ellipse(420,260,15,15);
ellipse(420,300,15,15);
 
circleOpac = map(mouseX, 240, 480, 0, 255);
fill(redValue2, greenValue2, blueValue2, circleOpac);
 
ellipse(420,260,15,15);
ellipse(420,300,15,15);
 
}
  

  
// The abstract artist I chose for inspiration is Victor Vasarely. He is  known as the father of optical abstract art and is very famous for his work in the second half of the 20th century. Much of his work is based around repetition of simple geometric shapes, optical illusions, interesting color combinations and symmetry. I felt Vasarely was a good choice for this first exercise because the style of his work falls in line with the exercise requirements and would be a good way for me to practice the code. I designed a symmetrical grid that uses repetitive shapes within a complimentary color scheme. I added on top of this grid groups of asymmetrical ellipses that pop from the background and act as points of interest. This project was a good learning experience and I feel that my understanding  of code and the X and Y grid has definitely improved from it.



