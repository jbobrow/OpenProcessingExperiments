
/*****************************************
 * Assignment 02
 * Name: Rhett Richardson
 * E-mail: merichards@brynmawr.edu
 * Course: CS 110 - Section 01
 * Submitted: 9/19/12
 * 
 * This is the sketch for assignment 2.
 * It is a Christmas scene in which the gifts
 * are randomly placed beneath the tree, where the 
 * mouse clicks at certain locations place Christmas-time
 * ornamentation (on tree, walls, fireplace),
 * and the fire in the fire place is of random "strength".
 * Each time a key is pressed, the scene resets and a new
 * "background" is generated.
***********************************************/

// Declared variables

int color1 = color(178,34,34); // christmas red
int color2 = color(34,139,34); // christmas green

  
  
  void setup() {
    smooth();
    size (900,520);
    noStroke ();
    drawBackground();
  }


  void draw() { /* remains empty */ }

  void mousePressed() {
    
    // Ornaments
    if (mouseX>145 && mouseX<365 && mouseY<330 && mouseY>120) { 
        ellipseMode (CENTER);
        fill (color1);
        ellipse (mouseX,mouseY,30,30);
        println ("Ornament Location: "+mouseX+" "+mouseY);
      }
     if (mouseX>600 && mouseX<770 && mouseY<230 && mouseY<290) {
        ellipseMode (CENTER);
        fill (color1);
        ellipse (mouseX,mouseY,30,30);
        println ("Ornament Location: "+mouseX+" "+mouseY);
        }
        
     // Tree Topper
     if (mouseX>230 && mouseX<290 && mouseY>50 && mouseY<120 ) { 
        ellipseMode (CENTER);
        fill (255,244,18);
        ellipse (mouseX,mouseY,40,40);
        println ("Topper Location: "+mouseX+" "+mouseY);
        }
        
      // Garland
      if (mouseY<100) {
        stroke(85,107,47);
        noFill();
        bezier(4,2,4,166,452,149,456,3);
        bezier(896,4,895,140,452,149,456,3);
      }
        
      // 
        
    
  }


  void keyPressed() {
   drawBackground();

  }

  void drawBackground() {
    
    // Wall
    background (238,221,130);
    
    
    // Floor
    fill (random(255),random(255),random(255));
    rect (0,350,900,520);
  
    // Christmas Tree
    fill(85,107,47);
    triangle (260,80,190,180,330,180);
    triangle (260,120,160,260,360,260);
    triangle (260,200,140,340,380,340);
    fill(139,69,19);
    rect (240,340,40,60);
    
   // Fireplace
   fill (210,105,30);
   rect (600,230,170,130);
   fill(139,69,19);
   rect (595,220,180,20);
   rect (575,240,25,132);
   rect (770,240,25,132);
   
   // Fire
   fill (color1);
   for (int flame = 0; flame < 4; flame++) {
      triangle (random(610,740),360,random(610,740),360,random(610,740),random(240,310) );
   }
   fill (232,267,2);
   for (int flame = 0; flame < 2; flame++) {
     triangle (random(610,740),360,random(610,740),360,random(610,740),random(240,310) );
   }
   
   
   // Gifts
   for (int gifts = 0; gifts < 8; gifts++) {
     fill(color1);
     int x = (int) random(70,450);
     int y = (int) random(350,410);
     rect (x,y,60,60);
     fill (color2);
     rect (x+23,y,15,60);
    }
    
  }
