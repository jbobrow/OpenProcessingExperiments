
float angle = 0.1;
float sw = 0.3;
int colour = 0;
int strokeCol = 0;
int strokeIntensity = 0;

void setup() {
  
  size(1280, 700, JAVA2D);
  background(255);
  smooth();
  colorMode(HSB, 360, 100, 100);
  fill(100);
  int z = 100;
  textSize(22);
  text("Left, Right or Center MouseButton", 40, z);
  text("to create shapes.", 40, z + 22);
  text("Hit 1 for a White, 0 for a Black Background.", 40, z + (22 * 2 + 15));
  text("Hold Up or Downarrow to change colour.", 40, z + (22 * 3 + 15));
  text("Pressing A, L or R might give weird results.", 40, z + (22*4 + 30));
  strokeWeight(sw);
  textSize(16);

  
//org();  // content of setup()

}

void draw() {
  
  stroke(strokeCol, strokeIntensity, 100,int(random(80, 180)));
  float msx = int(random(-50, 300));
  float msy = int(random(10, 250));
  println(frameRate);

  translate(mouseX, mouseY);


  
  if (mousePressed) {
    
      cursor(WAIT);
    
       if (mouseButton == LEFT) {
        angle += 0.8;
        rotate(angle);
        scale(random(0.5, 1.5));
        for (int i = 0; i <= 10; i++) {
            fill(colour, int(random(70, 100)), int(random(40, 100)), int(random(80, 255)));
            triangle(random(-10, 10), random(-10, 10), random(200), random(200),random(150), random(150));
            fill(colour, int(random(70, 100))/1.1, int(random(40, 100))/1.1, int(random(80, 255)));
            text(frameRate, random(-50, 150), random(-50, 150));
             }
       
     
        }
       
       if (mouseButton == RIGHT) {
         tris(colour, int(random(30, 100)), int(random(30, 100)), int(random(10, 255)));
       }
       
       if (mouseButton == CENTER) {
         tris(colour, int(random(0, 100)), int(random(0, 100)), int(random(50, 255)));         
       }

  }
          else {
            cursor(ARROW);
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
           colour += 1;
           fill(0,0,100,200);
           rect(0,-55, 120, 60);
           fill(colour, 100,100);
           textSize(64);
           text(colour, 0, 0);
           textSize(16);
        }
      
              else {
                colour = 0;
              }
      }
     
     if (keyCode == DOWN) {
      if (colour >= 0) {
         colour -= 1;
         fill(0,0,100,200);
         rect(0,-55, 120, 60);
         fill(colour, 100,100);
         textSize(64);
         text(colour, 0, 0);
         textSize(16);
     }
          else {
            colour = 360;
          }
     
      }
     }
     
          if (key == 'm' || key == 'M') {
        if (colour <= 360) {
          colour += 1;
        }
          else {
            colour = 0;
          }
     
      }
      
                if (key == 'n' || key == 'N') {
      if (colour >= 0) {
        colour -= 1;
     }
          else {
            colour = 360;
          }
     
      }
    
    if (key == 's' || key == 'S') {
      saveFrame("hsb-########.tif");
    }
    
    if (key == 'l' || key == 'L') {
      fill(colour, int(random(100)), int(random(100)), int(random(50, 200)));
      translate(mouseX, mouseY);
      rotate(angle++);
      textSize(int(random(12, 192)));
      text("LOL", -20, -20);
      textSize(20);
    }
    

    if (key == 't' || key == 'T') {
      fill(colour, int(random(100)), int(random(100)), int(random(50, 200)));
      textSize(int(random(12, 192)));
      float r1 = random(-400, 400);
      float r2 = random(-300, 300);
      text("ROFL", r1, r2);
      String r = "ROFL";
      float ul = textWidth(r);
      noStroke();
      rect(r1, r1, ul, 10);
      strokeWeight(sw);
      textSize(18);
    }

 
    if (key == 'r' || key == 'R') {
      fill(colour, int(random(20, 100)), int(random(30,100)), int(random(50, 200)));
      textSize(int(random(12, 192)));
      text("ROFL", random(-400, 400), random(-300,300));
      textSize(20);
    }
    
    if (key == 'o' || key == 'O') {
      org();
    }
    
    if (key == 'a' || key == 'A') {
      for (int i = 10; i < 600; i += 20) {
        fill(colour, int(random(20, 100)), int(random(20, 100)), int(random(20, 220)));
        textSize(int(random(8, 64)));
        scale(random(0.1, 2));
        text("Array", mouseX + int(random(600)), mouseY + i);
        textSize(16);
      }
    }
    
  }
  
}


void tris(int degree, int satur, int bright, int transp) {
    angle += 0.8;
    rotate(angle);
    scale(random(0.5, 1.5));
    for (int i = 0; i <= 10; i++) {
      fill(degree, satur, bright, transp);
      triangle(random(-10, 10), random(-10, 10), random(200), random(200),random(150), random(150));
      fill(degree, satur/1.1, bright/1.1, transp);
     text(frameRate, random(-50, 150), random(-50, 150));
    }
}


void org() {
  background(0, 0, 100);
  smooth();
  fill(100);
  int z = 0;
  rotate(angle++);
  pushMatrix();
  text("Left, Right or Center MouseButton", 40, z);
  text("to create shapes.", 40, z + 22);
  text("Hit 1 for a White Background", 40, z + (22 * 2 + 15));
  text("or 0 for a Black Background.*", 40, z + (22 * 3 + 15));
  text("Press S to save the current composition.", 40, z + (22*4 + 30));
  popMatrix();
  strokeWeight(sw);
  stroke(0,0,100,int(random(100, 180)));
}



