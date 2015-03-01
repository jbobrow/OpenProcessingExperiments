
void setup()
{
  size(400, 400);
  fill(0);
}
void draw()
{
  background(255);
  pushMatrix();
  float my_angle = map(mouseX, 0, width, 0, 2*PI);
  translate(50, 50);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
  
    pushMatrix();
 translate(150, 50);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
  
     pushMatrix();
  translate(250, 50);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
  
       pushMatrix();
  translate(350, 50);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
   
        pushMatrix();
  translate(50, 150);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
  
         pushMatrix();
  translate(150, 150);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
  
        pushMatrix();
  translate(250, 150);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
  
          pushMatrix();
  translate(350, 150);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
  
            pushMatrix();
  translate(50, 250);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
  
              pushMatrix();
  translate(150, 250);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
  
               pushMatrix();
  translate(250, 250);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
  
                pushMatrix();
  translate(350, 250);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
  
                  pushMatrix();
  translate(50, 350);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
  
                    pushMatrix();
  translate(150, 350);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
  
                     pushMatrix();
  translate(250, 350);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
  
                       pushMatrix();
  translate(350, 350);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
}
