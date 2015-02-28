
void setup(){
  size(640,600);
}

void draw(){
 background(100,100,12);
 
  
  stroke(0);
  fill(100,100,100);
  ellipse(349, 320, 300, 300);
  
  stroke(0);
  fill(100,10,10);
  ellipse(350, 480, 185, 105);
  
  stroke(250);
  fill(250,250,250); 
  ellipse(250, 306, 100, 100);
  ellipse(450, 306, 100, 100);
  
  fill(0,0,0); 
  ellipse(250, 306, 55, 55);
  ellipse(450, 306, 55, 55);
  
  stroke(0);
  triangle(320, 405, 348, 350, 376, 405);
  
  
  line(300, 480, 400, 480);
  ellipse(350, 480, 55, 20);
  
  

  
  


  

arc(50, 55, 50, 50, 0, PI/2);
noFill();
arc(50, 55, 60, 60, PI/2, PI);
arc(50, 55, 70, 70, PI, TWO_PI-PI/2);
arc(50, 55, 80, 80, TWO_PI-PI/2, TWO_PI);

quad(457, 30, 505, 19, 488, 52, 449, 65);
fill(100,0,0);

rect(115, 20, 55, 55);
fill(0,100,0);

triangle(200, 75, 228, 20, 256, 75);

fill(0,0,100);
ellipse(310, 46, 55, 55);

line(370, 20, 425, 20);
stroke(126);
line(425, 20, 425, 75);
stroke(255);
line(425, 75, 370, 75);





  println("x: " + mouseX + "y: " + mouseY);
}

