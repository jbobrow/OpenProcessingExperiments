
int colour = 0;

void setup() 
{
  size(800, 600);
  strokeWeight(12);
  smooth();
  colorMode(HSB, 360, 100, 100);
}

void draw() {


  if (mousePressed == true) {
    
      if (mouseButton == LEFT) {
        colorEllipse(mouseX, mouseY, pmouseX, pmouseY);
      }
      
      if (mouseButton == RIGHT) {
        colorEllipse(mouseX, mouseY, pmouseX, pmouseY);
      }
      
      if (mouseButton == CENTER) {
        colorEllipse(mouseX, mouseY, pmouseX, pmouseY);
      }
      
  }
  
if (keyPressed) {
    
    if (key == '1') {
      background(0, 0, 100);
    }
    
    if (key == '2') {
      background(0, 0, 90);
    }
    
    if (key == '3') {
      background(0, 0, 80);
    }
    
    if (key == '4') {
      background(0, 0, 70);
    }
    
    if (key == '5') {
      background(0, 0, 60);
    }
    
    if (key == '6') {
      background(0, 0, 50);
    }
    
    if (key == '7') {
      background(0, 0, 40);
    }
    
    if (key == '8') {
      background(0, 0, 30);
    }
    
    if (key == '9') {
      background(0, 0, 20);
    }
    
    if (key == '0') {
      background(0, 0, 0);
    }
    
         if (key == CODED) {
              if (keyCode == UP) {
                if (colour <= 360) {
                  pushMatrix();
                    colour += 1;
                  popMatrix();
                  stroke(colour, 0, 100, 100);
                  strokeWeight(5);
                  ellipse(mouseX, mouseY, 70, 70);
                  fill(colour, int(random(50, 100)), int(random(10, 100)), int(random(100, 200)));
                  ellipse(mouseX, mouseY, 50, 50);
                  fill(colour, int(random(100)), int(random(10,100)), int(random(100, 200)));
                  ellipse(mouseX, mouseY, 30, 30);
                  fill(colour, 100, 100, 255);
                  ellipse(mouseX, mouseY, 10, 10);
                }
                      else {
                        colour = 0;
                      }
              }
         
             if (keyCode == DOWN) {
              if (colour >= 0) {
                pushMatrix();
                  colour -= 1;
                popMatrix();
                  stroke(colour, 0, 100, 100);
                  strokeWeight(5);
                  ellipse(mouseX, mouseY, 70, 70);
                  fill(colour, int(random(50, 100)), int(random(10, 100)), int(random(100, 200)));
                  ellipse(mouseX, mouseY, 50, 50);
                  fill(colour, int(random(100)), int(random(10,100)), int(random(100, 200)));
                  ellipse(mouseX, mouseY, 30, 30);
                  fill(colour, 100, 100, 255);
                  ellipse(mouseX, mouseY, 10, 10);
              }
              
                    else {
                      colour = 360;
                   }
            }
         }
        
        if (key == 's' || key == 'S') {
          saveFrame("animation-######.png");
        }

  }
}

void colorEllipse(int x, int y, int px, int py)  {
  
  float speed = abs(x-px) + abs(y-py);
  println(speed);
  stroke(colour, 0, 100, 100+speed);
  strokeWeight(speed/5);
  ellipse(x, y, speed, speed);
  fill(colour, int(random(50, 100))+speed/3, int(random(10, 100))+speed/3, int(random(100, 200)));
  ellipse(x, y, speed*0.9, speed*0.9);
  fill(colour, int(random(100))+speed/3, int(random(10,100))+speed/3, int(random(100, 200)));
  ellipse(x, y, speed*0.6, speed*0.6);

}

