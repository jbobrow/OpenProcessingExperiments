
void setup() {
  size(500, 500);
  smooth();
}
 
 
void draw() {
  background(99, 141, 158);
  
  fill(255, 171, 2);
  noStroke();
  ellipseMode(CENTER);
  ellipse(0, 0, 250, 250);
  
  pushMatrix();
   translate(width/5, height/4);   // Move coordinate system to center of sketch
    fill(255);
  noStroke();
  ellipseMode(CENTER);
  ellipse(0, 0, 2, 2);
   popMatrix();
   
   pushMatrix();
   translate(width/2, height/2);   // Move coordinate system to center of sketch
    fill(255);
  noStroke();
  ellipseMode(CENTER);
  ellipse(0, 0, 2, 2);
   popMatrix();
   
   
  translate(width/3, height/4);   // Move coordinate system to center of sketch
  scale(.25);
  
  
  rotate( radians(160) );
   rotate(millis() * 0.001 * TWO_PI / -50.0); 
   
  fill(255, 207, 79);
  noStroke();
  ellipseMode(CENTER);
  ellipse(0, 0, 300, 300);
    fill(255, 186, 0);
    rotate( radians(180) );
  ellipse(0, 0, 500, 10);
  
  
 
  pushMatrix();
  fill(255);
  rotate(millis() * 0.01 * TWO_PI / 50.0);  
  translate(400, 0); // Move away from the center
 
  ellipse(0, 0, 50, 50);
   ellipse(0, 0, 5, 100);
    ellipse(0, 0, 150, 5);
 
 
  pushMatrix();
    rotate((millis() * 0.001 * TWO_PI / 10.0) * -1);    // One revolution every second
    translate(100, 0); // Move away from the center
 
    ellipse(0, 0, 10, 10);
    ellipse(0, 0, 2, 20);
    ellipse(0, 0, 20, 2);
  popMatrix();
 
  pushMatrix();
    rotate((millis() * 0.001 * TWO_PI / 10.0) );    // One revolution every second
    translate(70, 0); // Move away from the center
 
    ellipse(0, 0, 20, 20);
  popMatrix();
  popMatrix();
   
   
   
     pushMatrix();
  fill(255);
  rotate(millis() * 0.01 * TWO_PI / 50.0);  
  translate(400, 0); // Move away from the center
 
  ellipse(0, 0, 50, 50);
   ellipse(0, 0, 5, 100);
    ellipse(0, 0, 150, 5);
 
 //
 
  pushMatrix();
    rotate((millis() * 0.005 * TWO_PI / 10.0) * -1);    // One revolution every second
    translate(70, 0); // Move away from the center
 
    ellipse(0, 0, 10, 10);
  popMatrix();
  popMatrix();

   
    pushMatrix();
  rotate((millis() * 0.005 * TWO_PI / 80.0) * -1);  
  translate(600, 0); // Move away from the center
 
  ellipse(0, 0, 40, 40);
 ellipse(0, 0, 5, 90);
 ellipse(0, 0, 90, 5);
 
  pushMatrix();
    rotate(millis() * 0.001 * TWO_PI / 5.0);    // One revolution every second
    translate(70, 0); // Move away from the center
 
    ellipse(0, 0, 20, 20);
  popMatrix();
  popMatrix();
 
 
 
   //rotate(millis() * 0.001 * TWO_PI / -50.0);
   
    pushMatrix();
  fill(255);
  rotate(millis() * 0.01 * TWO_PI / -70.0);  
  translate(1200, 0); // Move away from the center
 
  ellipse(0, 0, 90, 90);
   ellipse(0, 0, 20, 180);
   
 
 
  pushMatrix();
    rotate((millis() * 0.01 * TWO_PI / -30.0) * -1);    // One revolution every second
    translate(250, 0); // Move away from the center
 
    ellipse(0, 0, 10, 10);
    ellipse(0, 0, 5, 50);
    ellipse(0, 0, 70, 6);
  popMatrix();
  popMatrix();

   
}

