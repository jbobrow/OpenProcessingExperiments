

  PFont font;
  //String letter ="BOOM";
  
  // buchstaben speicher auf 0 setzen
  int counter = 0; 
  // alle buchstaben in letter
  char letter;

// A simple Particle class
class Particle {
  
  float x;
  float y;
  float xspeed;
  float yspeed;
  float g1 = random (10, 50);
  
  PFont arial; 
  
  Particle() {
    x = mouseX;
    y = mouseY;
    xspeed = random(-3,3);
    yspeed = random(-3,3);
  }
  
  void fallen() {
    x = x + xspeed;
    y = y + yspeed;
  }
  
  void gravity() {
    yspeed += 0.1;
  }
  
  void darstellen() {
        
    letter = char(48+counter);
    stroke(0);
    fill(0,85);
    text(letter,x,y);
     counter++;
     
     //nur erste 26 zeichen benutzen
      if(counter >= 26) {
        counter = 0; 
      }
  }
}


