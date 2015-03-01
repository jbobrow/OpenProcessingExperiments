
//Jessica Peters
//Storm
//For this sketch, I created a storm cloud moving across the night sky as it flashes in response to bolts of lightning.

float xA = 275;
float yA = 70;
boolean clouds = true;
float xB = 0;
float yB = 70;
int speedxB = 1;
boolean lightningBolt = true;
float xV= 65;
float yV = 120;
int speedxV = 1;

void setup() {
size(500,500);
background(0,127,230);
}

void draw() {
background(0, 127, 230);

fill(0, 0, random(0, 100));
rect(0,0, width, height);
noStroke();
fill(0,100,0);
ellipse(260, 500, 490, 370);

fill(0,127,0);
ellipse(125, 500, 400, 280);

fill(0,150,0);
ellipse(400, 500, 350, 200);

fill(230, 255, 230);
ellipse(xA,yA, 100, 100);

  fill(#554C4C);
  ellipse(xB, yB, 110, 90);
  ellipse(xB + 40, yB - 30, 100, 90);
  ellipse(xB + 100, yB - 15, 100, 90);
  ellipse(xB + 40, yB + 30, 100, 90);
  ellipse(xB + 110, yB + 32, 100, 90);
  
  fill(#434040); 
  ellipse(xB+20, yB, 120, 90);
  ellipse(xB + 40, yB - 20, 110, 100);
  ellipse(xB + 100, yB, 110, 90);
  ellipse(xB + 40, yB + 20, 110, 100);
  ellipse(xB + 110, yB + 32, 90, 80);
  
 beginShape();
 fill(255,255, 51);
 noStroke();
 vertex(xV, yV);
 vertex(xV + 30, yV + 90);
 vertex(xV - 10, yV + 50);
 vertex(xV +20, yV + 150);
 endShape(CLOSE);
  
  if (clouds) {
    xB = xB + speedxB;
    if (xB <= 0); {
      clouds = true;
    }
  }
  
   xB = xB + speedxB/2;
   if(xB > 250) {
     xB = 250;
  }
   if (lightningBolt) {
   xV = xV + speedxB;
   if (xV <= 315); {
     lightningBolt = true;
   }
  }
   xV = xV + speedxB/2;
   if(xV > 315) {
     xV = 315;
   }

fill(50,100);
rect(0,0,width,height);
}




  

  





