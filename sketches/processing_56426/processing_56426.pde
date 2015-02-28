
void setup() {
      size(700, 700);
      background(240, 240, 240);
      stroke(127, 127, 127);
      strokeWeight (1);
      smooth ();
       
    }
 
    void draw() {
      noFill();
      ellipse(350,  350, mouseX, mouseY);
      strokeWeight(0.3);
      float f = 0.3333333;
      float durchmesser = random(100);
      stroke(random(255),random(255),random(255), 50);

 
       
       
    }
     
 
 
   void mousePressed() {
      background(167, 251, 222);
      stroke(217, 202, 215);
    }
    
