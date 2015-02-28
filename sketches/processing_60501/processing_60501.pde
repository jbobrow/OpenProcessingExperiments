
class Cat {
  int catX;
  int catY;
  
  int catWidth;
  int catHeight;
  
  int catLegWidth;
  int catLegHeight;

  int catspeed;
  int catdirection;

  Cat() {
    ellipseMode(CENTER);
    strokeWeight(3);
    catX = 20;
    catY = 120;
    catWidth = 150;
    catHeight = 150;
    catspeed = 10;
    catdirection = 1;
  }

  void drawCat() {
    fill(216, 160, 55);
    ellipse(catX-15, catY+28, 10, 25); //left leg
    ellipse(catX+25, catY+28, 10, 25); //right leg
    ellipse(catX+40, catY-5, 10, 20); //tail
    fill(216, 160, 55);
    strokeWeight(3);
    ellipse(catX, catY, 70, 40); //body
    fill(216, 160, 55);
    ellipse(catX-35, catY, 30, 30); //head
    fill(216, 160, 55);
    ellipse(catX-50, catY-15, 10, 15); //left ear
    ellipse(catX-20, catY-15, 10, 15); //right ear
    fill(255);
    strokeWeight(1);
    ellipse(catX-43, catY-3, 7, 5); //left eye
    ellipse(catX-30, catY-3, 7, 5); //right eye
    fill(0);
    strokeWeight(2);
    ellipse(catX-36, catY+2, 3, 3); //nose
    line(catX-45, catY+7, catX-27, catY+7); //mouth() {
    //bottom: catY + 28 + 13 = 161
    //top: catY - 15 - 8 = 97
    //height: 
  }

  void display() {
    drawCat();
    catX = catX + catspeed;

    if ((catX > width - 20) || (catX - 20 < 0)) {
      meow.trigger();
      catspeed = catspeed * -catdirection;
    }
  }
  
      //cat dimensions
    //left coordinate: catX-35-15: 400-35-15: 350
    //right coordinate: catX+40+5: 400+45: 445
    //total width: 95 pixels
    //top coordinate: catY + 20: 270
    //bottom coordinate: catY - 20: 230
    //total height: 40 pixels
}


