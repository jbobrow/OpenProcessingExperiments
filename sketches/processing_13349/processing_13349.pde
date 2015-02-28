
     void setup() {
       noLoop();
       background(220);
       size(400, 400);
       stroke(255);
      
     }
          
     void draw() {
       
       fill(random(120),random(250),random(230), 30);
       noStroke();
       ellipse(mouseX, mouseY, 300, 300);
     }
                
