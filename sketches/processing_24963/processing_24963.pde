


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
  
  //image(b, 0, 0,300,600);

  noFill();
  stroke(255);
  strokeWeight(5);
  
  beginShape();
  curveVertex(150, 600); // the first control point
  curveVertex(150, 600); // is also the start point of curve
  curveVertex(170,400);
  curveVertex(146,300);
  curveVertex(94,200);
  curveVertex(0,180);
  curveVertex(0,110);
  curveVertex(86,120);
  curveVertex(0,66);
  curveVertex(0,0);
  curveVertex(40,0); 
  curveVertex(70,50);
  curveVertex(80,46);
  curveVertex(140,100);
  curveVertex(180,150);
  curveVertex(194,175);// the last point of curve
  curveVertex(194, 175); // is also the last control point
  endShape();
  
  beginShape();
  curveVertex(200,193);
  curveVertex(200,193);
  curveVertex(170,100);
  curveVertex(150,0);
  curveVertex(150,0);
  endShape();
  
  strokeWeight(2);
  beginShape();
  curveVertex(10,0);
  curveVertex(10,0);
  curveVertex(30,30);
  curveVertex(50,40);
  curveVertex(100,90);
  curveVertex(150,120);
  curveVertex(170,170);
  curveVertex(270,400);
  curveVertex(280,600);
  curveVertex(280,600);
  endShape();
  
  beginShape();
  curveVertex(0,30);
  curveVertex(0,30);
  curveVertex(30,50);
  curveVertex(70,80);
  curveVertex(130,120);
  curveVertex(150,160);
  curveVertex(170,200);
  curveVertex(240,400);
  curveVertex(270,600);
  curveVertex(270,600);
  endShape();
  
  beginShape();
  curveVertex(0,50);
  curveVertex(0,50);
  curveVertex(80,100);
  curveVertex(100,140);
  curveVertex(120,150);
  curveVertex(160,190);
  curveVertex(170,250); 
  curveVertex(180,350); 
  curveVertex(200,410);  
  curveVertex(220,450);  
  curveVertex(257,500);  
  curveVertex(257,500);  
  endShape();  
  
  beginShape();
  curveVertex(0,130);
  curveVertex(0,130);
  curveVertex(40,120);
  curveVertex(100,165);
  curveVertex(140,180);
  curveVertex(160,250);
  curveVertex(180,500);  
  curveVertex(160,600);
  curveVertex(160,600);
  endShape(); 
 
 beginShape();
 curveVertex(0,170);
 curveVertex(0,170);
 curveVertex(40,160);
 curveVertex(120,200);
 curveVertex(154,260);
 curveVertex(154,260);
 endShape();
  
  beginShape();
  curveVertex(0,150);
  curveVertex(0,150);
  curveVertex(30,140);
  curveVertex(70,170);
  curveVertex(140,190);
  curveVertex(160,330);
  curveVertex(160,330);
  endShape();
  
  beginShape();
  curveVertex(170,0);
  curveVertex(170,0);
  curveVertex(190,50);
  curveVertex(180,120);
  curveVertex(200,150);
  curveVertex(220,245);
  curveVertex(220,245);
  endShape();
  
  beginShape();
  curveVertex(200,0);
  curveVertex(200,0);
  curveVertex(200,100);
  curveVertex(220,150);
  curveVertex(270,350);
  curveVertex(290,500);
  curveVertex(290,600);
  curveVertex(290,600);
  endShape();
  
  beginShape();
  curveVertex(175,410);
  curveVertex(175,410);
  curveVertex(210,500);
  curveVertex(263,550);
  curveVertex(263,550);
  endShape();
  
  beginShape();
  curveVertex(180,510);
  curveVertex(180,510);
  curveVertex(210,560);
  curveVertex(267,590);
  curveVertex(267,590);
  endShape();
  
  beginShape();
  curveVertex(250,0);
  curveVertex(250,0);
  curveVertex(260,50);
  curveVertex(240,100);
  curveVertex(270,200);
  curveVertex(300,350);
  curveVertex(300,350);
  endShape();
  
  beginShape();
  curveVertex(280,0);
  curveVertex(280,0);
  curveVertex(280,50);
  curveVertex(285,180);
  curveVertex(300,290);
  curveVertex(300,290);
  endShape();

  
}




