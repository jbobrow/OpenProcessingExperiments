
class Letter {
  char letter;
  //original home loc
  float homex, homey;
  float x,y;
  float theta;
  float v = 255;

  Letter(float x_, float y_, char letter_) {
    homex = x = x_;
    homey = y = y_;
    letter = letter_;
    theta = random(PI);
  }
  //display the letter
  void display() {
    frameRate(30);
    fill(v,127);
    textAlign(LEFT);
    text(letter,x,y);
  }

  //move letters
  void shake() {
    //variables
    float minX = random(2, height/6);
    float maxX = width - minX;
    float minY = random(2,height/6);
    float maxY = height - minY;
    textSize(random(16,40));
    v=255;

    //text grouped 
    //reverse linear mapping
    /*  float reverseX = map(mouseX, 0, width, maxX, minX); // linear map to maxX..minX (reversed range)
     float reverseY = map(mouseY, 0, height, maxY, minY); // linear map to maxY..minY (reversed range)
     x= reverseX;
     y= reverseY;*/

    // spread out within box
    if (mouseX>width/4 && mouseX <(3*width)/4 && mouseY > height/3  && mouseY < (2*height)/3) {

      //non linear sinusoidal mapping
      float angleX = map(mouseX, 0, width, 0, 360); 
      float angleY = map(mouseY, 0, height, 0, 360); 
      float sinusoidalX = map(sin(radians(angleX)), -2, 2, minX, maxX); 
      float sinusoidalY = map(sin(radians(angleY)), -1, 1, minY, maxY); 
      //  ellipse(sinusoidalX, sinusoidalY, 12, 12);
      x = sinusoidalX + random(-width/2,width/4);
      y = sinusoidalY + random(-height/8,height/4);
    }
  }

  //home
  void home() {
    //lerp(value1, value2, amt
    //fill(v);
    //println(v);
    if (abs(x-homex) < 2) {
      v=0;
    } else {
      v=255;
    }
    textSize(20);
      
    x = lerp(x,homex,0.1);
    y = lerp(y,homey,0.1);
    theta = lerp(theta,0,0.01);
   // println(x-homex);
  }
}


