
PFont f;
void setup() {
     size(500, 500);
     f =createFont("Helvetica",14,true);
     strokeWeight(12);
     smooth();
     mouseX = width/2;
     mouseY = height/2;
}
   void draw() {
     background(255);
     textAlign(CENTER);
     textFont(f,14);
     fill(0);
     text("use mouse",width/2,height/2+30);
     noFill();
     stroke(250);
     line(width/2, height/2, mouseX, mouseY);  // White line
     
     stroke(200);
     line(width/2+40, height/2, mouseX+10, mouseY);
     
     stroke(200);
     
     line(width/2-40, height/2, mouseX-10, mouseY);
     
     stroke(150);
     line(width/2+80, height/2, mouseX+20, mouseY);
     
     stroke(150);
     line(width/2-80, height/2, mouseX-20, mouseY);
     
     stroke(100);
     line(width/2+120, height/2, mouseX+30, mouseY);
     
     stroke(100);
     float mx33 = mouseX/2 +30;
     line(width/2-120, height/2,mouseX-30 , mouseY);
     
     stroke(50);
     line(width/2+160,height/2, mouseX+40, mouseY);  // Black line
     
     stroke(50);
     line(width/2-160,height/2, mouseX-40, mouseY);
     
     line(410,height/2,90,height/2);
 }
   

