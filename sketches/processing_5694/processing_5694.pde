
// Variabelen
int x = 0;
int speed = 1;

void setup () {
  size (500,500);
  smooth ();
  noStroke ();
}

void draw () {
 background (255);

 // Achtergrondkleur & Zon / Maan
  if(mouseY < 250) 
  { background (#FAFAFA);
    fill (#FAC903);
    ellipse (x,100,32,32);
  }
  else 
  { background (#24231D);
    fill (175);
    ellipse (x,100,32,32);
  }

    // Flitslichtjes
    fill (#FFFEFC);
    ellipse (random(width),random(height),4,4);

 // Bal
 // Snelheden
 x = x + speed;
 
 // Bounce
 if ((x > width) || (x < 0)) {
  speed = speed * -1; 
 }
 
 // Poppetje
 fill (#7A7DDB);
 rectMode (CENTER);
 // Lichaam
 rect (mouseX,mouseY,30,80);
 // Hoofd
 ellipse (mouseX,mouseY-40,30,30);
 // Ogen
 fill (255);
 ellipse (mouseX-5,mouseY-20,3,3);
 ellipse (mouseX+5,mouseY-20,3,3);
}

