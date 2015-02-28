



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
  
  //image(b, 0, 0,300,600);
  

  noFill();
  stroke(255);
  strokeWeight(5);
  
  beginShape();
  curveVertex(140,0);
  curveVertex(140,0);
  curveVertex(150,250);
  curveVertex(120,400);
  curveVertex(170,320);
  curveVertex(240,320);
  curveVertex(300,250);
  curveVertex(300,250);
  endShape();
  
  beginShape();
  curveVertex(300,400);
  curveVertex(300,400);
  curveVertex(180,500);
  curveVertex(150,600);
  curveVertex(150,600);
  endShape();
  
  strokeWeight(2);
  beginShape();
  curveVertex(0,550);
  curveVertex(0,550);
  curveVertex(15,600);
  curveVertex(15,600);
  endShape();
  
  beginShape();
  curveVertex(0,300);
  curveVertex(0,300);
  curveVertex(10,320);
  curveVertex(5,400);
  curveVertex(20,500);
  curveVertex(25,600);
  curveVertex(25,600);
  endShape();
  
  beginShape();
  curveVertex(0,150);
  curveVertex(0,150);
  curveVertex(10,230);
  curveVertex(20,250);
  curveVertex(15,300);
  curveVertex(30,400);
  curveVertex(40,500);
  curveVertex(50,600);
  curveVertex(50,600);
  endShape();
  
  beginShape();
  curveVertex(10,0);
  curveVertex(10,0);
  curveVertex(5,50);
  curveVertex(30,100);
  curveVertex(40,150);
  curveVertex(35,250);
  curveVertex(40,300);
  curveVertex(45,400);
  curveVertex(70,600);
  curveVertex(70,600);
  endShape();
  
  beginShape();
  curveVertex(50,0);
  curveVertex(50,0);
  curveVertex(60,50);
  curveVertex(80,200);
  curveVertex(100,300);
  curveVertex(80,400);
  curveVertex(110,500);
  curveVertex(120,600);
  curveVertex(120,600);
  endShape();
  
  beginShape();
  curveVertex(80,0);
  curveVertex(80,0);
  curveVertex(70,50);
  curveVertex(70,100);
  curveVertex(110,300);
  curveVertex(115,400);
  curveVertex(130,600);
  curveVertex(130,600);
  endShape();
  
  beginShape();
  curveVertex(100,0);
  curveVertex(100,0);
  curveVertex(120,50);
  curveVertex(110,100);
  curveVertex(120,300);
  curveVertex(132,340);
  curveVertex(132,340);
  endShape();
  
  beginShape();
  curveVertex(140,600);
  curveVertex(140,600);
  curveVertex(160,450);
  curveVertex(130,410);
  curveVertex(170,322);
  curveVertex(170,322);
  endShape();
  
  beginShape();
  curveVertex(220,322);
  curveVertex(220,322);
  curveVertex(180,400);
  curveVertex(170,520);
  curveVertex(170,520);
  endShape();
  
  beginShape();
  curveVertex(240,320);
  curveVertex(240,320);
  curveVertex(220,400);
  curveVertex(180,500);
  curveVertex(180,500);
  endShape();
  
  beginShape();
  curveVertex(260,300);
  curveVertex(260,300);
  curveVertex(240,350);
  curveVertex(250,400);
  curveVertex(210,472);
  curveVertex(210,472);
  endShape();
  
  beginShape();
  curveVertex(280,276);
  curveVertex(280,276);
  curveVertex(270,330);
  curveVertex(280,416);
  curveVertex(280,416);
  endShape();
  
      noFill();
strokeWeight(3);
ellipse(0,300,100,130);
ellipse(0,300,90,110);
ellipse(0,300,70,90);
ellipse(0,300,60,70);
ellipse(0,300,50,60);
ellipse(0,300,40,50);
ellipse(0,300,30,40);
  
 

  
  
}

