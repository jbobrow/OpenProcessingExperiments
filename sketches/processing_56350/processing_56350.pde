
class Character {
  PImage[] img = new PImage[20];

  int imageIndex;
  float x;
  float y;
  float rot;
  float tilt;
  int stage; // to check position of characters
  int speed;
  Character() {
    //initialise images
    for(int i = 0; i < img.length; i++) {
      img[i] = loadImage("char" + i + ".gif");
    }
    
    x = 0;
    // Positions of characters
    stage = int(random(3));
      if (stage == 0) y = (height-150)/4;
      if (stage == 1) y = (height-50)/2;
      if (stage == 2) y = height-150;
    tilt = 0.04;
    rot = random(-0.9,0.9); //character start off with different angle
    
    //characters change base on level
    if (level == 1){ imageIndex = int(random(5)); speed =  5;}
    if (level == 2){ imageIndex = int(random(5,10)); speed = 6;}
    if (level == 3){ imageIndex = int(random(10,15)); speed = 7;}
    if (level == 4){ imageIndex = int(random(15,20)); speed = 7;}
    if (level == 5){ imageIndex = int(random(20)); speed = 6;} //bonus level  
  }
  
  void display() {
    translate(x,y);
    rotate(rot);
    imageMode(CENTER);  
    image(img[imageIndex],0,0);    
    rot+= tilt;
    if (rot > 0.9 || rot < -0.9) { 
      tilt *= -1;
    }
   }    

  
  void move() {
    x+=speed;
  }
  
  //check if our target is aimed at the top half of objects
  boolean onSpot() {
    if (mousePressed && mouseX > x-img[imageIndex].width/2 && mouseX < x+img[imageIndex].width/2
        && mouseY > y-img[imageIndex].height/2 && mouseY < y) {
          return true;
        } else {
          return false;
        } 
    }
}

    
    

