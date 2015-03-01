
// Ex06_04

color[] rainbow   = {#FFFFCD, #CC5C54, #F69162, #85A562, #7AB5DB};
color[] chemistry = {#0C2550, #A3D0C1, #FDF6DD, #FEE406, #F4651C};
color[] kitties   = {#302F2F, #74AD92, #F07F47, #FFAA42, #FFE224};
color[] beach     = {#D9C6B0, #314650, #2D4761, #45718C, #B6E1F2};
color[] cottage   = {#C3CCC8, #442412, #475D1C, #859356, #B9961C};
color[] minard    = {#666666, #607F9C, #E9CCAE, #FFFFF3, #D01312};
color[] nature    = {#9326FF, #2D42E8, #3EC7FF, #2DE8AB, #32FF38};
color[] pastel    = {#E8B5FF, #B3AFE8, #CEE8FF, #AFE8E0, #C1FFCF};
color[] palette   = pastel;

int choice;
int p1 = 1;
int p2 = 2;

float x;
float y;
float d = 100;
float b = 10;

void setup(){
  size(600, 200);
  smooth();
  x = width/2;
  y = height/2;
}

void draw(){
  background(palette[int(random(1,5))]);
  fill(palette[int(random(1,5))]);
  stroke(palette[int(random(1,5))]);
  strokeWeight(b);
  frameRate(5);
  ellipse(x, y, d, d);
  ellipseMode(CENTER);
  
  if(mouseX > width/2){
    d += .5;
  } else {
    d -= .5;
  }
  
  b = (mouseY > (height/2)) ? b + .1 : b - .1;
  b = constrain(b, 0, 50);
}

void keyPressed(){
  p1 = int(random(1, 5));
  p2 = int(random(1, 5));
  
  int choice = key;
  switch(choice){
    case 49:
      palette = rainbow;
      break;
    case 50:
      palette = chemistry;
      break;
    case 51:
      palette = kitties;
      break;
    case 52:
      palette = beach;
      break;
    case 53:
      palette = cottage;
      break;
    case 54:
      palette = minard;
      break;
  }
}


