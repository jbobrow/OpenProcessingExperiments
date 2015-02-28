


void setup()

{
  size(700, 700);
  smooth();

}


void draw()
{
  if (mousePressed==true) {
    stamp (mouseX, mouseY,200,200,80);
  }
}

void stamp(float x, float y, float wd, float ht, float transp)
{
  for (float i=3; i<random(5,50); i=i+random(1,10)) {
    //arc
    stroke(255, transp);
    //stroke(random(200,255),70);
    noFill();
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), 0, PI/2);
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), PI/2, PI);
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), PI, TWO_PI-PI/2);
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), TWO_PI-PI/2, TWO_PI);

    //arc
    noStroke();
    //    fill(random(0,100), random(10, transp));
    fill(random(231, 255), random(3, 252), random(100), random(transp));
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), 0, PI/2);
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), PI/2, PI);
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), PI, TWO_PI-PI/2);
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), TWO_PI-PI/2, TWO_PI);
  }
}
  
                
