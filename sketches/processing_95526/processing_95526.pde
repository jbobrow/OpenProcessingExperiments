
float mapped1;
float mapped2;
float mapped3;
float mapped4;

void setup()  {
                size(600, 300);
                background(0);
              }
              
void draw()  {
                smooth();
                stroke(0);  
                mapped1=map(mouseX, 0, 600, 170, 230);
                mapped2=map(mouseY, 0, 300, 125, 175);
                mapped3=map(mouseX, 0, 600, 370, 430);
                mapped4=map(mouseY, 0, 300, 125, 175);
                fill(255);
                ellipseMode(CENTER);
                ellipse(200, 150, 90, 60);
                ellipse(400, 150, 90, 60);
                fill(0);
                ellipse(mapped1, mapped2, 10, 10);
                ellipse(mapped3, mapped4, 10, 10);
              } 
                


