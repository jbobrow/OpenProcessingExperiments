


void setup()
{
  
  
  int[ ] coords = {
    40,40,80,60,100,100,60,120,50,150
  };
   
  size(300, 600);

  
  background(0);PImage b;
// Images must be in the "data" directory to load correctly
//b = loadImage("background2.jpg");
 
  smooth();
   
 // image(b, 0, 0,300,600);
 
 
  noFill();
  stroke(255);
  strokeWeight(5);
 
  beginShape();
  curveVertex(120,0);
  curveVertex(120,0);
  curveVertex(80,150);
  curveVertex(95,225);
  curveVertex(110,350);
  curveVertex(110,350);
  endShape();
   
  beginShape();
  curveVertex(96,230);
  curveVertex(96,230);
  curveVertex(180,180);
  curveVertex(210,100);
  curveVertex(220,0);
  curveVertex(220,0);
  endShape();
   
  beginShape();
  curveVertex(300,0);
  curveVertex(300,0);
  curveVertex(250,200);
  curveVertex(240,270);
  curveVertex(180,400);
  curveVertex(170,500);
  curveVertex(210,600);
  curveVertex(210,600);
  endShape();
   
 strokeWeight(2);
  beginShape();
  curveVertex(0,0);
  curveVertex(0,0);
  curveVertex(20,50);
  curveVertex(5,90);
  curveVertex(70,220);
  curveVertex(90,350);
  curveVertex(60,490);
  curveVertex(90,600);
  curveVertex(90,600);
  endShape();
   
beginShape();
curveVertex(0,350);
curveVertex(0,350);
curveVertex(20,400);
curveVertex(10,500);
curveVertex(5,600);
curveVertex(5,600);
endShape();
 
beginShape();
curveVertex(0,289);
curveVertex(0,289);
curveVertex(60,380);
curveVertex(50,490);
curveVertex(60,600);
curveVertex(60,600);
endShape();
 
beginShape();
curveVertex(90,0);
curveVertex(90,0);
curveVertex(50,60);
curveVertex(80,180);
curveVertex(80,180);
endShape();
 
beginShape();
curveVertex(250,0);
curveVertex(250,0);
curveVertex(240,70);
curveVertex(220,120);
curveVertex(200,200);
curveVertex(100,250);
curveVertex(100,250);
endShape();
 
beginShape();
curveVertex(280,0);
curveVertex(280,0);
curveVertex(255,60);
curveVertex(270,100);
curveVertex(220,200);
curveVertex(180,230);
curveVertex(160,250);
curveVertex(105,300);
curveVertex(105,300);
endShape();
 
beginShape();
curveVertex(250,200);
curveVertex(250,200);
curveVertex(150,300);
curveVertex(140,450);
curveVertex(120,600);
curveVertex(120,600);
endShape();
 
beginShape();
curveVertex(248,220);
curveVertex(248,220);
curveVertex(170,300);
curveVertex(150,450);
curveVertex(160,600);
curveVertex(160,600);
endShape();
 
beginShape();
curveVertex(245,260);
curveVertex(245,260);
curveVertex(180,300);
curveVertex(185,379);
curveVertex(185,379);
endShape();
 
noFill();
strokeWeight(3);
ellipse(80,450,90,120);
ellipse(80,450,80,100);
ellipse(80,450,60,80);
ellipse(80,450,50,60);
ellipse(80,450,40,50);
ellipse(80,450,30,40);
ellipse(80,450,20,30);
 
 

}

