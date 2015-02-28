
// head
PImage b;


void setup (){
  size (640,480);
  smooth();
  frameRate(30);
}

// body
void draw (){
  background (255);
  strokeWeight(4);
// affe
// K Ö R P E R 

// Beine
fill (115,165,230);
ellipse (285, 340, 20, 60);
ellipse (355, 340, 20, 60);

// Körper
fill (115,165,230);
ellipse (320, 250, 120, 200);
fill (0);
ellipse (320, 300, 5, 7);

// Füße
fill (255,181,84);
ellipse (270, 360, 50, 30);
ellipse (370, 360, 50, 30);

// Arme
fill (115,165,230);
ellipse (260, 240, 30, 90);
ellipse (380, 240, 30, 90);

// hände
// Füße
fill (255,181,84);
ellipse (260, 290, 30, 25);
ellipse (380, 290, 30, 25);


// K O P F
// ohr
fill (255,181,84);
ellipse (240, 100, 30, 18);
ellipse (400, 100, 30, 18);

// kopf
fill (115,165,230);
ellipse (320, 130, 155, 200);

// augen background
fill (255,181,84);
ellipse (320, 100, 120, 80);

// augen links
fill (250);
ellipse (290, 100, 30, 18);
// augen rechts
ellipse (350, 100, 30, 18);  
  
// mund background
fill (255,181,84);
ellipse (320, 180, 90, 110);

// mund 
line (275,180,365,180);

// nase links
fill (0);
ellipse (305, 145, 7, 7);
// nase rechts
fill (0);
ellipse (335, 145, 7, 7); 


cursor(); //macht den Auszeiger in Form eines Pfeils sichtbar
fill (0);
  switch (mouseX/230) {
    case 0:
    ellipse (282, 100, 13, 13);
    ellipse (342, 100, 13, 13);
    break;
    case 1:
    ellipse (290, 100, 13, 13);
    ellipse (350, 100, 13, 13);
    break;
    case 2:
    ellipse (298, 100, 13, 13);
    ellipse (358, 100, 13, 13);
    break;
     }  
     b = loadImage("banana.png");
      image(b, mouseX-35, mouseY-50);
}

