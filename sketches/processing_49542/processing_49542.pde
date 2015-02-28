
float x = 5;
float scalar = 0.1;
float angle = 15;
int r = 80;
int g = 0;
int b = 0;
int bg = 0;

void setup() {
  size(1280, 700); 
  smooth();
  background(bg);
}

void draw() {
        if (mousePressed) {
           if (mouseButton == LEFT) {   
            translate(mouseX, mouseY);
            fill(r, g, b, 50);
            scalar =random(-10, 10);
            rotate(scalar);
            quad(mouseY, mouseX, 70, 80, 80, 20, 70, 50);
            strokeWeight(0.3);
            
                    if (bg == 255) {                  // WHITE CENTER
                        fill(255, 255, 255);
                        ellipse(0, 0, 160, 160);
                        fill(r, g, b, 150);
                        ellipse(0, 0, 100, 100);
                        ellipse(0, 0, 60, 60);
                    }
                    
                    else {                            // BLACK CENTER
                        fill(0, 0, 0);
                        ellipse(0, 0, 160, 160);
                        fill(r, g, b, 150);
                        ellipse(0, 0, 100, 100);
                        ellipse(0, 0, 60, 60);
                    }
            
                if (scalar < 800) {
                  scalar++;
                }
//                else 
            
                  if (mousePressed) {
                    scalar = 0;
                  }
                  
                      if (r < 205) {        // ROTER FARBVERLAUF
                      r++;
                      }
                      else {
                        r = 80;
                      }
                                     
                      if (g < 180) {        // GRüNER FARBVERLAUF
                        g++;
                      }
                      else {
                        g = 15;
                      }
           }
           
           if (mouseButton == RIGHT) {   
            translate(mouseX, mouseY);
            fill(r, g, b, 50);
            scalar =random(-10, 10);
            rotate(scalar);
            quad(mouseY, mouseX, 300, 90, 15, 30, 300, 300);
            fill(240, 240, 240, 180);
            strokeWeight(0.3);
            
                    if (bg == 255) {                  // WHITE CENTER
                        fill(255, 255, 255);
                        ellipse(0, 0, 160, 160);
                        fill(r, g, b, 150);
                        ellipse(0, 0, 100, 100);
                        ellipse(0, 0, 60, 60);
                    }
                    
                    else {                            // BLACK CENTER
                        fill(0, 0, 0);
                        ellipse(0, 0, 160, 160);
                        fill(r, g, b, 150);
                        ellipse(0, 0, 100, 100);
                        ellipse(0, 0, 60, 60);
                    }
            
                if (scalar < 800) {
                  scalar++;
                }
                else 
            
                  if (mousePressed) {
                    scalar = 0;
                  }
                  
                      if (b < 90) {        // ROTER FARBVERLAUF
                      b++;
                      }
                      else {
                        b = 30;
                      }
                                     
                      if (g < 50) {        // GRüNER FARBVERLAUF
                        g++;
                      }
                      else {
                        g = 0;
                      }
           }
           if (mouseButton == CENTER) {
             bg = 255;
             background(bg);
           }
        }
        
        if (keyPressed) {
          bg = 0;
          background(bg);
        }


}

