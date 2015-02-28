
color c1 = color(255,0,150);
color c2 = color(190,0,115);
color c3 = color(110,250,210);
float x = 180;
float y = 175;
float z = 180;
float v = 130;
float speed = 5;

void setup() {
size(300, 400);
}

void draw() {
  background(c3);
  move();
  smooth();
  noStroke();
  
    
//Ohren
fill(c1);
ellipse(231, 180, 40, 70);
ellipse(68, 180, 40, 70);
//OhrenInnen
fill(c2);
ellipse(231, 180, 20, 50);
ellipse(68, 180, 20, 50);

//Haare
fill(c1);
ellipse(130,80,10,100);
ellipse(150,60,10,100);
ellipse(170,80,10,100);

//Gesicht
fill(c1);
ellipse(150,230,150,300);


//Mund
fill(c3);
ellipse(149,295,80,70);
//rect(110,300,80,50);

//Zähne
fill(c2);
//oben
rect(116,270,7,20);
rect(126,270,7,20);
rect(136,270,7,20);
rect(146,270,7,20);
rect(156,270,7,20);
rect(166,270,7,20);
rect(176,270,7,20);
//unten
rect(116,300,7,20);
rect(126,300,7,20);
rect(136,300,7,20);
rect(146,300,7,20);
rect(156,300,7,20);
rect(166,300,7,20);
rect(176,300,7,20);

//MundMaske
fill(c1);
ellipse(149,320,90,25);
ellipse(149,270,90,25);

//Augen
fill(c3);
ellipse(175, 180, 30, 30);
ellipse(130, 180, 30, 30);
//Pupillen
fill(c1);
ellipse(y, x, 12, 12);
ellipse(v, z, 12, 12);


  
}


void move(){
  x = x + speed;
  if (x>200) {
    x=100;
  }
  
    z = z + speed;
  if (z>200) {
    z=100;
  }
}
