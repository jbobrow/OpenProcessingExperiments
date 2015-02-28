
// Inspired by
// http://www.youtube.com/watch?v=GcCIrRTukE0&t=1m48s
// Little Boots - Shake
// Click to SHAKE
 
float c = 0;
float x = 360;
 
void setup()
{
  size(500,500);
  textFont(createFont("Trebuchet MS",32));
  colorMode(HSB,360,100,100);
}
 
void draw() {
    
  //mouse stuff
  //println("X: " + mouseX + " Y: " +mouseY);
 
  if (c == 360)
  {
    c=0;
  }
  c += 1;
  
  if (x == 0)
  {
    x=360;
  }
  
  
  background(c,100,50);
  String t = "e v e r y b o d y";
  float tw = textWidth(t);
  fill(random(255), random(255), random(255));
  text(t, (width-tw)/2, (height-370)/2);
  
  //shake
  //S
  if (mousePressed == true) {
        if (mouseButton == LEFT) {
          x -= 1;
          fill(255);
          text("S", random(30, 90), 120);
          text("S", random(30, 90), 180);
          text("S", random(30, 90), 240);
          text("S", 30, random(120, 180));
          text("S", 90, random(180, 240));
          text("S", random(30, 90), 180);
          text("S", random(30, 90), 120);
          text("S", random(30, 90), 180);
          text("S", random(30, 90), 240);
          text("S", 30, random(120, 180));
          text("S", 90, random(180, 240));
          text("S", random(30, 90), 180);
          text("S", random(30, 90), 120);
          text("S", random(30, 90), 180);
          text("S", random(30, 90), 240);
          text("S", 30, random(120, 180));
          text("S", 90, random(180, 240));
          text("S", random(30, 90), 180);
          } 
        }
        
    if (mousePressed == false) {
          fill(0);
          text("S", 30, 150);
          text("S", 30, 120);
          text("S", 50, 120);
          text("S", 70, 120);
          text("S", 90, 120);
          text("S", 30, 180);
          text("S", 50, 180);
          text("S", 70, 180);
          text("S", 90, 180);
          text("S", 90, 210);
          text("S", 90, 240);
          text("S", 70, 240);
          text("S", 50, 240);
          text("S", 30, 240);
          }
  
  //H
  if (mousePressed == true) {
        if (mouseButton == LEFT) {
          text("h", random(120, 180), 180);
          text("h", 120, random(120, 240));
          text("h", 180, random(120, 240));
          text("h", random(120, 180), 180);
          text("h", 120, random(120, 240));
          text("h", 180, random(120, 240));
          text("h", random(120, 180), 180);
          text("h", 120, random(120, 240));
          text("h", 180, random(120, 240));
          }
        }
        
  if (mousePressed == false) {
      text("H", 120, 120);
      text("H", 120, 150);
      text("H", 120, 180);
      text("H", 120, 210);
      text("H", 120, 240);
  
      text("H", 140, 180);
      text("H", 160, 180);
  
      text("H", 180, 120);
      text("H", 180, 150);
      text("H", 180, 180);
      text("H", 180, 210);
      text("H", 180, 240);
  }
  
  //A
  if (mousePressed == true) {
        if (mouseButton == LEFT) {
          text("a", random(210, 270), 120);
          text("a", random(210, 270), 180);
          text("a", 210, random(120, 240));
          text("a", 270, random(120, 240));
          text("a", random(210, 270), 120);
          text("a", random(210, 270), 180);
          text("a", 210, random(120, 240));
          text("a", 270, random(120, 240));
          text("a", random(210, 270), 120);
          text("a", random(210, 270), 180);
          text("a", 210, random(120, 240));
          text("a", 270, random(120, 240));
          }
        }
        
  if (mousePressed == false) {
      text("A", 210, 120);
      text("A", 210, 150);
      text("A", 210, 180);
      text("A", 210, 210);
      text("A", 210, 240);
  
      text("A", 230, 120);
      text("A", 250, 120);
  
      text("A", 230, 180);
      text("A", 250, 180);
  
      text("A", 270, 120);
      text("A", 270, 150);
      text("A", 270, 180);
      text("A", 270, 210);
      text("A", 270, 240);
      }
  
  //K
  if (mousePressed == true) {
        if (mouseButton == LEFT) {
          text("k", 300, random(120, 240));
          text("k", 300, random(120, 240));
          text("k", 300, random(120, 240));
          text("k", 300, random(120, 240));
          text("k", 300, random(120, 240));
          text("k", 300, random(120, 240));
          text("k", 300, random(120, 240));
          text("k", 300, random(120, 240));
          text("k", random(300, 320), 180);
          text("k", random(320, 340), 150);
          text("k", random(320, 340), 210);
          text("k", random(340, 360), 120);
          text("k", random(340, 360), 240);
          text("k", random(300, 320), 180);
          text("k", random(320, 340), 150);
          text("k", random(320, 340), 210);
          text("k", random(340, 360), 120);
          text("k", random(340, 360), 240);
          text("k", random(300, 320), 180);
          text("k", random(320, 340), 150);
          text("k", random(320, 340), 210);
          text("k", random(340, 360), 120);
          text("k", random(340, 360), 240);
          }
        }
  
  if (mousePressed == false) {
      text("K", 300, 120);
      text("K", 300, 150);
      text("K", 300, 180);
      text("K", 300, 210);
      text("K", 300, 240);
  
      text("K", 320, 180);
  
      text("K", 340, 150);
      text("K", 340, 210);
  
      text("K", 360, 120);
      text("K", 360, 240);
      }
  
  //E
  if (mousePressed == true) {
        if (mouseButton == LEFT) {
          text("e", random(390, 470), 120);
          text("e", random(390, 470), 180);
          text("e", random(390, 470), 240);
          text("e", 390, random(120, 240));
          text("e", random(390, 470), 120);
          text("e", random(390, 470), 180);
          text("e", random(390, 470), 240);
          text("e", 390, random(120, 240));
          text("e", random(390, 470), 120);
          text("e", random(390, 470), 180);
          text("e", random(390, 470), 240);
          text("e", 390, random(120, 240));
          }
        }
        
  if (mousePressed == false) {
      text("E", 390, 120); 
      text("E", 390, 150); 
      text("E", 390, 180); 
      text("E", 390, 210); 
      text("E", 390, 240); 
      text("E", 410, 120); 
      text("E", 410, 180); 
      text("E", 410, 240); 
      text("E", 430, 120); 
      text("E", 430, 180); 
      text("E", 430, 240); 
      text("E", 450, 120); 
      text("E", 450, 180); 
      text("E", 450, 240); 
      text("E", 470, 120); 
      text("E", 470, 180); 
      text("E", 470, 240);
      }
  
  String t = "until your heart";
  float tw = textWidth(t);
  fill(random(255), random(255), random(255));
  text(t, (width-tw)/2, (height+50)/2);
  
  //breaks
  //B
  if (mousePressed == true) {
        if (mouseButton == LEFT) {
            fill(x,100,50);
  text("B", 190, 320);
  text("B", 190, 350);
  text("B", 190, 380);
  text("B", 190, 410);
  text("B", 190, 440);
  
  text("B", 170, 330);
  text("B", 170, 360);
  text("B", 170, 390);
  text("B", 170, 420);
  
  text("B", 150, 340);
  text("B", 150, 370);
  text("B", 150, 400);
  
  text("B", 130, 350);
  text("B", 130, 380);
  
  //R
  text("R", 210, 340);
  text("R", 210, 370);
  text("R", 210, 400);
  text("R", 210, 430);
  text("R", 210, 460);
  
  //E
  text("E", 230, 360);
  text("E", 230, 390);
  text("E", 230, 420);
  text("E", 230, 450);
  text("E", 230, 480);
  
  //A
  text("A", 250, 360);
  text("A", 250, 390);
  text("A", 250, 420);
  text("A", 250, 450);
  text("A", 250, 480);
  //K
  text("K", 270, 340);
  text("K", 270, 370);
  text("K", 270, 400);
  text("K", 270, 430);
  text("K", 270, 460);
  
  //S
  text("S", 290, 320);
  text("S", 290, 350);
  text("S", 290, 380);
  text("S", 290, 410);
  text("S", 290, 440);
  
  text("S", 310, 330);
  text("S", 310, 360);
  text("S", 310, 390);
  text("S", 310, 420);
  
  text("S", 330, 340);
  text("S", 330, 370);
  text("S", 330, 400);
  
  text("S", 350, 350);
  text("S", 350, 380);
      }
  }
}
