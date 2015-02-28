


void setup()
{
  int[ ] coords = {
    40,40,80,60,100,100,60,120,50,150
  };
  
  size(300, 600);

  
  background(0);
  //PImage b;
// Images must be in the "data" directory to load correctly
//b = loadImage("background2.jpg");

  smooth();
  
 // image(b, 0, 0,300,600);
  

  noFill();
  stroke(255);
  strokeWeight(5);
  
  beginShape();
  curveVertex(5,0);
  curveVertex(5,0);
  curveVertex(80,250);
  curveVertex(70,400);
  curveVertex(200,600);
  curveVertex(200,600);
  endShape();
  
  beginShape();
  curveVertex(110,0);
  curveVertex(110,0);
  curveVertex(130,100);
  curveVertex(180,180);
  curveVertex(200,350);
  curveVertex(200,350);
  endShape();
  
  line(160,0,160,142);
  
  strokeWeight(2); 
  beginShape();
  curveVertex(40,0);
  curveVertex(40,0);
  curveVertex(45,100);
  curveVertex(90,200);
  curveVertex(80,300);
  curveVertex(100,400);
  curveVertex(110,450);
  curveVertex(200,600);
  curveVertex(200,600);
  endShape();
  
  beginShape();
  curveVertex(60,0);
  curveVertex(60,0);
  curveVertex(70,30);
  curveVertex(60,100);
  curveVertex(90,180);
  curveVertex(115,250);
  curveVertex(90,300);
  curveVertex(130,400);
  curveVertex(170,500);
  curveVertex(210,600);
  curveVertex(210,600);
  endShape();
  
  beginShape();
  curveVertex(90,0);
  curveVertex(90,0);
  curveVertex(100,50);
  curveVertex(80,150);
  curveVertex(150,220);
  curveVertex(150,300);
  curveVertex(210,400);
  curveVertex(220,500);
  curveVertex(230,600);
  curveVertex(230,600);
  endShape();
  
  beginShape();
  curveVertex(115,40);
  curveVertex(115,40);
  curveVertex(90,100);
  curveVertex(115,150);
  curveVertex(160,200);
  curveVertex(195,280);
  curveVertex(195,280);
  endShape();
  
  line(220,600,150,300);
  
  beginShape();
  curveVertex(170,0);
  curveVertex(170,0);
  curveVertex(180,50);
  curveVertex(180,120);
  curveVertex(220,350);
  curveVertex(240,400);
  curveVertex(270,600);
  curveVertex(270,600);
  endShape();
  
  beginShape();
  curveVertex(180,0);
  curveVertex(180,0);
  curveVertex(190,90);
  curveVertex(200,120);
  curveVertex(230,230);
  curveVertex(230,300);
  curveVertex(270,400);
  curveVertex(270,500);
  curveVertex(300,550);
  curveVertex(300,550);
  endShape();
  
  beginShape();
  curveVertex(220,0);
  curveVertex(220,0);
  curveVertex(210,100);
  curveVertex(260,150);
  curveVertex(250,200);
  curveVertex(300,300);
  curveVertex(300,300);
  endShape();
  
  beginShape();
  curveVertex(270,0);
  curveVertex(270,0);
  curveVertex(290,70);
  curveVertex(300,150);
  curveVertex(300,150);
  endShape();
  
    noFill();
strokeWeight(3);
ellipse(300,300,100,130);
ellipse(300,300,90,110);
ellipse(300,300,70,90);
ellipse(300,300,60,70);
ellipse(300,300,50,60);
ellipse(300,300,40,50);
ellipse(300,300,30,40);



}

