
// Constants you can play with
int lwidth=1; // line width in px
int radius=15; // spray radius
float factor=0.8; // line density factor
int colcounter=0; // starting bg colour mode - 0=random; switches between 3 modes - random, black, white


class rgbClass {
  // structure that stores rgb colour;
  // structure initialisation produces random colour
  int R=int(random(255)), G=int(random(255)), B=int(random(255));
}

color rcolor() { // function that returns random colour, using type 'color'
  return color(random(255), random(255), random(255));
}

void draw_textnbg() {
  rgbClass bgcolor=new rgbClass(); // first the colour is random
  if (colcounter == 0) // random
  {
    colcounter=1;
    // we don't change the colour since it's already random
  }
  else if (colcounter == 1) // black 
  {
    bgcolor.R=bgcolor.G=bgcolor.B=0;
    colcounter=2;
  } else if (colcounter == 2) // white
  {
    bgcolor.R=bgcolor.G=bgcolor.B=255;
    colcounter=0;
  }
  // actual rendering
  background(bgcolor.R, bgcolor.G, bgcolor.B);
  // sets text colour into colour visible on any background colour
  fill((bgcolor.R+127) % 255, (bgcolor.G+127) % 255, (bgcolor.B+127) % 255);
  textSize(17);
  text("Drag mouse with any button pressed to draw.", 12, 21);
  text("   Press any key to refresh.      By AlexJ.", 12, 42); 
}

int rpMouseX(){return int(pmouseX - (radius) + random(2*radius));}
  
int rpMouseY(){return int(pmouseY - (radius) + random(2*radius));}
  
int rMouseX(){return int(mouseX - (radius) + random(2*radius));}
  
int rMouseY(){return int(mouseY - (radius) + random(2*radius));}

void setup () {
  size(400, 400);
  draw_textnbg();
}

void draw(){
    if(mousePressed == true){
      for(int i=0; i<(factor*radius); i++){
        stroke(rcolor());
        line(rpMouseX(), rpMouseY(), rMouseX(), rMouseY());
      }
    }
}

void keyPressed() {
    draw_textnbg();
}



