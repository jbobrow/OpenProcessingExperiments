


class Branch {
  
  int x, y, rot;
  
  // starting position branches
  float curlx = 1.0;     
  float curly = -0.4;    

  float f = sqrt(2)/2.;

  float deley = 10;
  float growth = 0.4;
  float growthTarget = 5;
  float scal;
  
  color Color = color(random(255), random(10, 120), 100); // random color optional
  
  float rnd1 = random(100, 150);
  float rnd2 = random(100, 150);
  
  
  Branch(int tempX, int tempY, int tempRot, float tempScal) {
   
   x = tempX;
   y = tempY;
   rot = tempRot;
   scal = tempScal;
     
  }
  
  void display() {
    
    // color of the branch based on proximity of the ball (a.k.a. visitor)
    stroke(dist(x, y, mouseX, mouseY), rnd1, rnd2);

    //stroke(Color);
  
    // coiling of the branch based on proximity of the ball (a.k.a. visitor)
    if(dist(x, y, mouseX, mouseY) < 200) {
      curlx = dist(x, y, mouseX, mouseY)/200;
    }
    
    // OPTIONAL
    /*
    if(dist(x, y, s, v) < 200) {
      curlx = dist(x, y, s, v)/200;
      stroke(dist(x, y, s, v), 200, 200);
    }
    */
    
    translate(x,y);
    rotate(rot);
    scale(scal);
    
  }
  
  void branch (float len, int num){
  
    // recursiveness (steeds kleiner)
    len *= f;
    num -= 1;
  
    if((len > 1) && (num > 0)){
    
      pushMatrix();
      rotate(curlx);
      line(0,0,0,-len);
      translate(0,-len);
      branch(len,num);
      popMatrix();

      len *= growth;
      pushMatrix();
      rotate(curlx-curly);
      line(0,0,0,-len);
      translate(0,-len);
      branch(len,num);
      popMatrix();
    
    }
  
  } 
  
  
  
  
}

