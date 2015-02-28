
/* @pjs font="BigelowRules-Regular.otf"; */
int x =0;
int y = 0;
int z = 0;
PFont biglow; 
PImage domo ;

void setup() {
  size(800, 500);
  
  biglow = createFont("BigelowRules-Regular.otf", 60);
  textFont(biglow);
  textAlign(CENTER, CENTER);
  
  domo = loadImage("domo.jpg");
 
}

void draw() { 

  image(domo, 0, 0, width, height);
  
  fill(#464E52);
rect(0, 330, 800, 50, 3, 6, 12, 18);

 fill(0);
text("Chimon uses Laserbeams!!", z, 350); 


scale(0.5, 0.45) ;
fill(204);
triangle(45, 108, 3, 168, 30, 168);

pushMatrix();
fill(204);
rotate(radians(0));
triangle(70, 128, 20, 155, 30, 168);
popMatrix();

pushMatrix();
fill(204);
rotate(radians(0));
triangle(50, 200, 30, 140, 30, 168);
popMatrix();

pushMatrix();
fill(204);
rotate(radians(0));
triangle(60, 180, 30, 140, 30, 168);
popMatrix();

fill(#335F51);
pushMatrix();
rotate(radians(-10));
quad(-27, 165, 0, 170, 18, 330, -18, 360);
popMatrix();

fill(#335F51);
quad(48, 380, 38, 320, 300, 340, 300, 400);

fill(#4D4D4D);
triangle(52, 377, 75, 323, 65, 360);

/*leg*/fill(#1F3E3E);
ellipse(340, 480, 40, 150);

/*leg*/fill(#1F3E3E);
ellipse(260, 480, 40, 150);

/*feet*/fill(#81A049);
ellipse(260, 550, 40, 25);

/*feet*/fill(#81A049);
ellipse(341, 550, 40, 25);

fill(#729D86);
ellipse(300, 317, 145, 250);

/*arm*/fill(#1F3E3E);
ellipse(215, 330, 40, 150);

/*arm*/fill(#1F3E3E);
ellipse(385, 330, 40, 150);

fill(#729D86);
arc(300, 280, 200, 180, PI , TWO_PI);

//eyes
fill(random(87), random(55), random(155), random(30,150));
quad(x, y, x, 330, x, 330, 285, 300);

fill(random(255), random(105), random(25), random(200,150));
quad(x, y, x, 330, x, 330, 310, 300);
//end of eyes

fill(#000000);
arc(300, 400, 100, 140, PI , TWO_PI);

fill(#ED60B2);
arc(300, 360, 78, 60, PI , TWO_PI);

pushMatrix();
fill(#CBE5A9);
rotate(radians(0));
triangle(259, 357, 278, 357, 270, 385);
popMatrix();

pushMatrix();
fill(#CBE5A9);
rotate(radians(0));
triangle(289, 357, 308, 357, 300, 385);
popMatrix();

pushMatrix();
fill(#CBE5A9);
rotate(radians(0));
triangle(319, 357, 338, 357, 330, 385);
popMatrix();

fill(#E3DF77);
ellipse(252, 160, 72, 72);

fill(000);
ellipse(235, 155, 18, 18);

fill(#434645);
ellipse(260, 145, 10, 10);

fill(#434645);
ellipse(255, 180, 25, 15);

z=z+2;
x+=2;
y+=1;
 
  if (x >=1500) {
    x= 200 ;
  }
  if (y >=400) {
  y = 100;
}
  if (z > width/2) {
    z=width/2 ;
  
  }
}





