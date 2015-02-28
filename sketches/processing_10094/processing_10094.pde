
PImage Image;
float x = 50;
float maxDistance;

void setup() {
  size(400, 400);
  Image = loadImage("pointer.png");
  maxDistance = dist(0, 0, width, height);
}

void draw() {


  background(255);


  strokeWeight(1);
  stroke(0);

  for (int x2 = 50; x2 < width; x2+=50){
    for (int y = 50; y < height; y+=50){
      float angle = atan2(mouseY-y, mouseX-x2);
      float angle2 = atan2(-mouseX, -mouseY);
      float mouseDist = dist(mouseX, mouseY, x2, y);
      float diameter = (maxDistance-(mouseDist))/30;

      pushMatrix();
      translate(x2, y);
      //Cursor
      pushMatrix();
      rotate(angle+90);


      image(Image, 0, 0);



      //First Eye
      pushMatrix();
      translate(0,10);


      fill(255);
      ellipse(0,0,diameter,diameter);

      pushMatrix();
      rotate(angle2);


      fill(0);
      ellipse(diameter/5,diameter/5,diameter/2,diameter/2);

      popMatrix();
      popMatrix();

      //Second Eye
      pushMatrix();
      translate(9,6);

      if (mousePressed == false) {
        fill(255);
        ellipse(0,0,diameter,diameter);
      }

      pushMatrix();
      rotate(angle2);

      if (mousePressed == false) {
        fill(0);
        ellipse(diameter/5,diameter/5,diameter/2,diameter/2);
      }

      popMatrix();
      popMatrix();
      popMatrix();
      popMatrix();
    }
  }
}



