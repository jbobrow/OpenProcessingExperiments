
PImage img;

void setup()

{
  size(500, 800);
  smooth();
  img=loadImage ("pic.gif");

}


void draw()
{
  noLoop();
  image (img, 0,0,500,800);
  stamp (200,200,400,500,50);
  stamp (300,100,400,500,90);
   stamp (350,80,400,500,80);
 
  stamp (350,530,200,300,50);
 
  stamp (350,750,200,300,10);
   stamp (330,720,200,300,10);
   stamp (270,700,200,300,80);
  

}

void stamp(float x, float y, float wd, float ht, float transp)
{
  for (float i=3; i<random(5,50); i=i+random(1,10)) {
    //arc
  //  stroke(255,transp);
 stroke(random(200,255),70);
    noFill();
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), 0, PI/2);
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), PI/2, PI);
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), PI, TWO_PI-PI/2);
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), TWO_PI-PI/2, TWO_PI);

    //arc
    noStroke();
    fill(random(0,100), random(10, transp));
 //   fill(random(231, 255), random(3, 252), random(100), random(transp));
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), 0, PI/2);
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), PI/2, PI);
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), PI, TWO_PI-PI/2);
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), TWO_PI-PI/2, TWO_PI);
  }
}



