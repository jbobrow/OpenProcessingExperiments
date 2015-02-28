
class SingleS {
  float angle;
  float shift;
  float shiftSpeed;
  float angularSpeed;
  float acceleration;
  color c;
  float x;
  float y;
  float crazy;
  Boolean circular = true;

  SingleS() {
    angle = random(0, 60);
    shift = 1;
    shiftSpeed = random(-0.05, 0.05);
    angularSpeed = random(PI/720, PI/180);
    acceleration = random(1,5);
    float starFill = random(0,3);
    if (starFill < 0.4) {
      fill(225,225,0);
    } 
    else if (starFill < 0.8) {
      c = (255);
    } 
    else {
      c = color(255,255,0);
    }
  }

  void moveStar() {
    angle += angularSpeed;
    if (angle > 360) {
      angle -= 360;
    }

    shift += shiftSpeed;   
    shiftSpeed += random( -0.05, 0.05 );
    if (shift > 30) {
      shiftSpeed = Math.abs(shiftSpeed) * -0.5;
    }
    else if (shift < -50) {
      shiftSpeed = Math.abs(shiftSpeed) * 0.5;
    } 
  }

  void drawStar() {


    noStroke();
    fill(c, 100);
    float baseRadius = width / 3.5;
    if(circular == true){
      x = cos(angle) * (baseRadius + shift) + (width / 2);
      y = sin(angle) * (baseRadius + shift) + (height / 2);
    }
    else{
      y += acceleration;
    }
    ellipse(x, y, 4, 4);

    if (mousePressed == true){
      shiftSpeed += crazy;
      crazy = map(shiftSpeed,  mouseX*-0.009, mouseY*-0.006, -0.05, 0.05);
      stroke(60);
      strokeWeight(1);
      line(mouseX, mouseY, width/2, height/2);
      ellipse(mouseX, mouseY, 5, 5);
    } 

    if (keyPressed){
      if (key=='s'){
        save("image" + key + ".jpg");     
      }

      if(key == 'f'){
        if(circular == false){
          circular = true; 
        }
        else{
          circular = false;
        }
      }

    }
    //     println(shiftSpeed);
  }
}



