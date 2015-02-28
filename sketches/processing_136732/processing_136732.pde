
/*Rotation is a bit strange.  It seems simple enough, just remember that
 rotation 'rotates' around the point (0,0).  So, you are rotating the entire
 matrix around the upper left hand corner of the window.  For example:  */
int rotation;

void setup() {
  size(620, 250);
  background(0);
  rotation = 0;
}

void draw() {
  strokeWeight(2);

  background(0);
  stroke(255);

  if (rotation < 360) {

    pushMatrix();
    stroke(random(100), random(255), 120);
    translate(width/2, height/2);
    rotate(radians(rotation));
    line(0, 0, width/2, height/2);
    line(0, 0, -width/2, height/2);
    popMatrix();

    pushMatrix();
    stroke(random(200), 0, random(120));
    translate(width/2, height/2);
    rotate(radians(360 - rotation));
    line(0, 0, width/2, height/2);
    line(0, 0, -width/2, height/2);
    popMatrix();

    pushMatrix();
    stroke(random(200), 0, 120);
    translate(width/2, height/2);
    rotate(radians(360 - rotation * 2));
    line(0, 0, width/2, height/2);
    line(0, 0, -width/2, height/2);
    popMatrix();

    pushMatrix();
    stroke(0, random(200), 120);
    translate(width/2, height/2);
    rotate(radians(rotation * 2));
    line(0, 0, width/2, height/2);
    line(0, 0, -width/2, height/2);
    popMatrix();


    rotation++;
  }

  if (rotation >= 360) {
    rotation = 0;
  }
}



