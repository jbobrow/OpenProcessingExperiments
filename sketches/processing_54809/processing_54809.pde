
class Robot 
{
  //PShapes
  float xpos, ypos;
  float colors = random(255);
  float colors2 = random(255);
  float colors3 = random(255);
  float angle = 180;
  float angle2 = 180;
  float angle3 = 50;

  Robot(int tx, int ty, float health)
  {
    //loadshapes
    xpos = tx;
    ypos = ty;
  
    //float angle;
  }





 
  void rotateRightarm2(){
   pushMatrix();

      translate(xpos+465, ypos+305);  
      rotate(angle2);
       shape(rightforearms, 0, 0, 70, 90);
         angle2 += 0.1 * direction;
  if ((angle2 > radians(190)) || (angle < radians(170)))
    direction = -direction;
    popMatrix();

 }
 
 void rotateRightarm(){
   pushMatrix();

      translate(650, 310);  
      rotate(angle2);
       shape(rightforearms, 0, 0, 70, 90);
         angle2 += 0.1 * direction;
  if ((angle2 > radians(190)) || (angle < radians(170)))
    direction = -direction;
    popMatrix();

 }

 
    void rotateRightfoot(){
   pushMatrix();
      translate(xpos+210, ypos+426);  
      rotate(angle3);
       shape(rightfoot, 0, 0, 130, 120);
         angle3 += 0.1 * direction;
  if ((angle3 == radians(100)) || (angle == radians(90)))
    direction = -direction;
    popMatrix();

 }
  
  

  void display () {
    pushMatrix();
    translate(xpos, ypos);
    noStroke();
    //arms
    smooth();
    shape(leftleg, 65, 380, 150, 250);
    shape(rightleg, 180, 250, 150, 280);
    //body
    fill(colors, colors2, colors3);
    rect(120, 150, 160, 170);
    fill(colors, colors2, colors3);
    float health = int(random(0, 360));
    ellipse(200, 150, 160, 20);
    //health
    fill(#67FA79);

    arc(200, 230, 50, 50, 0, health);
    fill(255);
    ellipse(200, 230, 30, 30);
    fill( colors, colors2, colors3);
    ellipse(200, 320, 160, 20);
    //left/right arm
    shape(leftarm, 48, 150, 110, 200);
    shape(rightuparm, 220, 129, 150, 170);

  
  
    
    
      //head
      float headX = random(190, 210);
      ellipse(headX, 100, 100, 100);
      fill(255);
      ellipse(headX, 80, 40, 40);
      fill(0);
      ellipse(headX, 75, 30, 30);
      fill(colors, colors2, colors3);
      fill(0);
      rect(headX, 20, 1, 30);
      
      //glare
      fill(255);
      ellipse(headX+8, 63, 10, 10);

      fill(#ED3030);
      ellipse(headX, 20, 20, 20);

      popMatrix();
    }
    
    
    
  }


