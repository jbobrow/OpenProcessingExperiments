
import processing.pdf.*;

void setup(){
  size(500,1000);
  beginRecord(PDF, "cross_hatch_code.pdf");
  smooth();
  strokeWeight(10);
  background(29,16,64);
}

void draw(){
  stroke(24, 10, 240);
  line(0, 0, 250, 250);
  line(0, 50, 200, 250);
  line(0, 100, 150, 250);
  line(0, 150, 100, 250);
  line(0, 200, 50, 250);
  line(50, 0, 250, 200);
  line(100, 0, 250, 150);
  line(150, 0, 250, 100);
  line(200, 0, 250, 50);
  
  noFill();
  fill(67, 189, 222);
  noStroke();  
  ellipse(360, 120, 100, 100); 
    
  noStroke();
  fill(96, 47, 234);
  ellipse(120, 375, 200, 200);
  
  
  noStroke();
  stroke(161, 210, 242);
  line(450,250,500,300);
  line(400,250,500,350);
  line(350,250,500,400);
  line(300,250,500,450);
  line(250,250,500,500);
  line(250,300,450,500);
  line(250,350,400,500);
  line(250,400,350,500);
  line(250,450,300,500);
  
  noStroke();
  stroke(54, 93, 242);
  line(200,500,250,550);
  line(150,500,250,600);
  line(100,500,250,650);
  line(50,500,250,700);
  line(0,500,250,750);
  line(0,550,200,750);
  line(0,600,150,750);
  line(0,650,100,750);
  line(0,700,50,750);
  
  noStroke();
  noFill();
  fill(124, 79, 252); 
  ellipse(380, 620, 190, 190);
  
  noStroke();
  noFill();
  fill(35, 17, 247);
  ellipse(120, 880, 100, 100);
    
  noStroke();
  stroke(30, 200, 250);
  strokeWeight(10);
  line(250, 750, 500, 1000);
  line(300, 750, 500, 950);
  line(350, 750, 500, 900);
  line(400, 750, 500, 850);
  line(450, 750, 500, 800);
  line(250, 800, 450, 1000);
  line(250, 850, 400, 1000);
  line(250, 900, 350, 1000);
  line(250, 950, 300, 1000);
  
 noStroke();
 strokeWeight(5);
 stroke(29,16,64); 
 line(250, 0, 250, 1000);
 line(0, 250, 500, 250);
 line(0, 500, 500, 500);
 line(0, 750, 500, 750);

 endRecord();
}

