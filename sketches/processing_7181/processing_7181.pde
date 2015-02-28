
float x, y, x2, y2;
float easing = 0.07;
float eyesize = 1.0;


void setup(){
  size(640, 480, P3D);
  noStroke();
  background(0);
}

void draw(){
  if(pmouseX != 0 && pmouseY != 0){

    background(0);

    float dirY = (mouseY / float(height) - 0.5) * 3;
    float dirX = (mouseX / float(width) - 0.5) * 3;

    float d = dist(mouseX, mouseY, 210, 240);
    float d2 = dist(mouseX, mouseY, 430, 240);

    float targetX = mouseX;
    float targetY = mouseY;

    x += (targetX - x) * easing;
    y += (targetY - y) * easing;

    x2 += (targetX - x2) * easing;
    y2 += (targetY - y2) * easing;

    if(mousePressed && (mouseButton == LEFT)){
      //left eyebrow
      beginShape();
      noFill();
      stroke(62, 43, 32);
      strokeWeight(8);
      vertex(100, 130);
      bezierVertex(150, 45, 250, 45, 300, 130);
      endShape();

      //right eyebrow
      beginShape();
      noFill();
      stroke(62, 43, 32);
      strokeWeight(8);
      vertex(340, 130);
      bezierVertex(380, 150, 480, 45, 540, 130);
      endShape();
      
      //change lighting color
      //directionalLight(42, 175, 245, -dirX, -dirY, -1); 
      directionalLight(400, 400, 400, -dirX, -dirY, -1); 

      noStroke();
      fill(255);
      pushMatrix();
      translate(450, 240, -100); //bulge!
      scale(eyesize);
      sphere(100); //65 w/o random
      popMatrix();

      pushMatrix();
      translate(190, 240,  -100);
      scale(eyesize);
      sphere(100);
      popMatrix();

      pushMatrix();
      translate(0, 0, 210);
      fill(0);
      ellipse(x, y, 20 * eyesize, 20 * eyesize);
      x = constrain(x, 260, 255);
      y = constrain(y, 220, 255);
      popMatrix();

      pushMatrix();
      translate(0, 0, 210);
      fill(0);
      ellipse(x2, y2, 20 * eyesize, 20 * eyesize);
      x2 = constrain(x2, 380, 370);
      y2 = constrain(y2, 220, 255);
      popMatrix();

      if (eyesize <  1.3){
        eyesize += 0.03;
      }

    }
    else{
      //left eyebrow
      beginShape();
      noFill();
      stroke(62, 43, 32);
      strokeWeight(8);
      vertex(140, 150);
      float my = constrain(mouseY, 80, 150);
      bezierVertex(180, my, 280, my, 300, 130);
      endShape();

      //right eyebrow
      beginShape();
      noFill();
      stroke(62, 43, 32);
      strokeWeight(8);
      vertex(340, 130);
      bezierVertex(380, my, 480, my, 500, 150);
      endShape();

      //moving pupils  
      noStroke();
      fill(0);
      ellipse(x, y, 40, 40);
      x = constrain(x, 175, 275);
      y = constrain(y, 180, 300);

      //other pupil
      fill(0);
      ellipse(x2, y2, 40, 40);
      x2 = constrain(x2, 365, 470);
      y2 = constrain(y2, 180, 300);

      //whites
      //normal eyes
      directionalLight(400, 400, 400, -dirX, -dirY, -1); 
      pushMatrix();
      fill(255);
      translate(210, 240, -105); 
      sphere(100); //value = radius
      if(d <= 99){
        sphere(random(100, 104));
      }

      popMatrix();
      fill(255);
      translate(430, 240, -105); 
      sphere(100);

      if(d2 <= 99){
        sphere(random(100, 104));
      }

      if (eyesize > 1.0){
        eyesize -= 0.009;
      }
    }
  }
}
//println(eyesize);




