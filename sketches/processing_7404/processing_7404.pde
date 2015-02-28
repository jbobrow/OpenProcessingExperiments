

class Hanabi{

  float x, curY, gravity, radius, curr;  
  float v, accel;
  color rainbow;
  boolean exploding, justExploded;
  
  Hanabi(){
    x = random(width/6, width*5/6);
    curY = height;
    curr= 1;
    radius = random(70, 300);
    rainbow = color(random(0,100), 0,99);
    exploding = false;
    justExploded = false;
    
    v = -random(5, 15);
    accel = random(0, 0.2);
    
  }
  
  void update(){
    generateColor();
    v += accel;
    curY += v;
    if(v <0 && !exploding){
      risingSeed();
    }
    else{
      accel = 0.05;
      explosion();
      exploding = true;
    }
    
  }
  
  boolean explosionSound(){
    if(justExploded == false && exploding == true){
      justExploded = true;
      return true;
    }
    else 
      return false;
  }
  
  void generateColor(){//generates gradual change in color
    float s = random(10,240);
    float h = hue(rainbow);
    float a ;
    h+=1;
    if(exploding){
      a = 40 -v*10;
    }
    else{
       a = v*10 + 100;}
    rainbow = color(h, s, 100, a);
  }
  
  void risingSeed(){
    drawSparkles();
  }
  
  void explosion(){//creates a circle of circles
    pushMatrix();
      translate(x,curY);
      noStroke();
      fill(rainbow);
      if(curr < radius){
        curr+=2;
      }
      float sRadius = random(1,6);
      for(int deg = 0; deg < 360; deg += 12){
        float angle = radians(deg);
        float tempx =(cos(angle)* curr);
        float tempy = (sin(angle) * curr);
        ellipse(tempx, tempy, sRadius, sRadius);}
    popMatrix();
  }

  void drawSparkles(){//draws sparkles (for when mouse not pressed)
    pushMatrix();
    stroke(rainbow,50);
    translate(x, curY);
    strokeWeight(1);
    noFill();
    ellipse(0, 0, 10, 10);
    float randX = random(-30,30);
    float randY = random(-30,30);
    float randL = random(1,5);
    drawPlus(randX, randY, randL);
    popMatrix();
  }

  void drawPlus(float x, float y, float l){//draws plus signs in different angles
    rotate(random(0, PI));
    line(x-l, y, x+l, y);
    line(x, y-l, x, y+l);
  }
  
  boolean isAlive(){
    if(50 -v*10<0)
      return false;
    return true;
  }

}

