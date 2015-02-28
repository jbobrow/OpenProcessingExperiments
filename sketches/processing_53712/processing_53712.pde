
class Meteor{
  float x;
  float y;
  float spdX;
  float spdY;
  float gravity = .06;
  float colorSegment;
  
  //constructor
  Meteor(float tempx, float tempy){
    x = tempx;
    y = tempy;
    spdX = random(-3,3);  //original speed in horizontal direction
    spdY = random(-6,-1); //original speed in vertical direction
  }
  
  void display(){
    smooth();
    noStroke();
    colorSegment = random(50,255);
    fill(colorSegment,colorSegment,0);  //fill a random yellow as the meteor's color
    //draw the star shape meteor
    beginShape();
    vertex(x,y-height/60);
    vertex(x+width/200,y-height/200);
    vertex(x+width/60,y);
    vertex(x+width/200,y+height/200);
    vertex(x,y+height/60);
    vertex(x-width/200,y+height/200);
    vertex(x-width/60,y);
    vertex(x-width/200,y-height/200);
    endShape();
  }

  //let the meteor moves like a projectile
  void move(){
    x += spdX;
    spdY += gravity;
    y += spdY;
  }

}

