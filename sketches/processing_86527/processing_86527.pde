
void draw() {
 background(0);
 stroke(0);
 //line(50, 400, mouseX, mouseY);
 
 //Color Stream Breath
 if (mouseY > 230) {
 if (mouseY < 750) {
 if (mouseX != 0.0) {
   float m = (500.0 - mouseY) / -mouseX;
   float b = mouseY - (m * mouseX);
   
    for(int i=0; i<100; i++) {
      float x= random(50, mouseX);
      float y = m * x + b;
      strokeWeight(random(0, 8));
      fill(mouseY/3.2, random(50, 255), mouseX);
      ellipse(x, y, random(50, 80), random(50, 80));
      rect(random(x-10, x+10)-25, random(y-10, y+10)-25, random(50, 80), random(50, 80));
    }
 }
 }
 }
 strokeWeight(4);
 
 //Isaac's Bottom Jaw
 fill(195, 150, 1000);
 rect(0, 750, 300, 50);
 
 //Isaac's Lower Teeth
 fill(0, 90, 1000);
 triangle(0, 750, 50, 750, 25, 750-90);
 fill(30, 90, 1000);
 triangle(50, 750, 100, 750, 75, 750-90);
 fill(60, 90, 1000);
 triangle(100, 750, 150, 750, 125, 750-90);
 fill(90, 90, 1000);
 triangle(150, 750, 200, 750, 175, 750-90);
 fill(120, 90, 1000);
 triangle(200, 750, 250, 750, 225, 750-90);
 fill(150, 90, 1000);
 triangle(250, 750, 300, 750, 275, 750-90);
 
 //Isaac's Upper Teeth
 fill(180, 90, 1000);
 triangle(0, 230, 50, 230, 25, 320);
 fill(210, 90, 1000);
 triangle(50, 230, 100, 230, 75, 320);
 fill(240, 90, 1000);
 triangle(100, 230, 150, 230, 125, 320);
 fill(270, 90, 1000);
 triangle(150, 230, 200, 230, 175, 320);
 fill(300, 90, 1000);
 triangle(200, 230, 250, 230, 225, 320);
 fill(330, 90, 1000);
 triangle(250, 230, 300, 230, 275, 320);
 
 //Isaac's Head - Lip
 fill(45, 150, 1000);
 rect(0, 180, 300, 50);
 //Isaac's Head - Noggin
 fill(45, 90, 1000);
 rect(0, 30, 250, 150);
 
 //Isaac's Hair
 fill(18, 255, 133);
 ellipse(223, 20, 60, 60);
 ellipse(10, 20, 60, 60);
 ellipse(180, 30, 60, 60);
 ellipse(70, 30, 60, 60);
 ellipse(120, 20, 60, 60);
 ellipse(0, 30, 60, 60);
 ellipse(200, 10, 60, 60);
 ellipse(50, 10, 60, 60);
 ellipse(150, 5, 60, 60);
 
 //Glasses
 stroke(169, 219, 199);
 noFill();
 ellipse(70, 130, 120, 100);
 stroke(169, 255, 1000);
 ellipse(200, 130, 120, 100);
 line(130, 130, 140, 130);
 
 //Color Changing Circular Eye
 fill(random(0, 360), 1000, 1000);
 rotate(0);
 ellipse(200, 120, 50, 70);
 
 //Rotating Color Changing Rectangular Eye
 fill(random(0, 360), 1000, 1000);
 translate(70, 120);
 for(int g=0; g<10; g++) {
 rotate(mouseX/3.0);
 }
 rect(-26, -26, 50, 70);
 
}

void setup() {
 size(800, 800); 
 colorMode(HSB);
 
}


