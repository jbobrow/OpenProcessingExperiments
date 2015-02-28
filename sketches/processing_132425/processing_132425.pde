
/*@pjs font="chineserocks.ttf";*/
PImage nightVale ;
PImage stars ;
PFont chifont;
int y = 0; // declaring and intitailizing a variable


void setup() {
  size(700,600);
  nightVale= loadImage("CecilandCarlos.png");
  stars= loadImage("stars2.png");
  chifont= createFont("chineserocks.ttf", 128 );
}

void draw() {
  image(stars, 0, y);
  image(nightVale, 0, 140);
  textFont(chifont, 30);
  fill (255, 70);
  text("But here, Carlos and I sat on the", 10, 50);
  text("trunk of that car — his car — looking together", 10, 80);
  text("at the lights up in the sky above the Arby’s...", 10, 110);
  text("they were beautiful in the hushed twilight...", 10, 140);
  text("shimmering in a night sky already", 10, 170);
  text("coming alive with bits", 10, 200);
  text("of the universe.", 10, 230);

  y = y - 1;

  if (y < -650) {
  y = height;
  }
  
}


