
float r = 0;
float g = 0;
float b = 0;
float a = 0;
float x = 0;
float y = 0;
              
void setup() {
                size(300, 300);
                background(255);
                smooth();
              }
void draw()  { if (mousePressed) {
                
                stroke(0);
                r = int(random(0, 255));
                g = int(random(0, 255));
                b = int(random(0, 255));
                a = int(random(0, 255));
                x = int(random(10, 60));
                y = int(random(10, 60));
                fill(r, g, b, a);
                rectMode(CENTER);
                rect(mouseX, mouseY, x, y);
              }
            }
                


