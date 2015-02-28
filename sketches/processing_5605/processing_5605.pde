


class Background_image {

  float xpos = -4700;
  float xspeed = 20; 
  PImage b_image;

  Background_image(String image_name) {

    b_image = loadImage(image_name); 

    if (image_name == "drive_by") {
      go = true;
    }
  }

  void display () {
    if(go) {
      println(xpos);
      xpos = xpos + xspeed;

      if (xpos > width) {
        xpos = width - 4700;
      }
      
      pushMatrix();
      translate(xpos,0); 
      image (b_image,0,0);
      popMatrix();
      
    }
    else
      image (b_image,0,0);

  }
}

void destroy() {
  pushMatrix();
  frameRate(15);
  translate(75,0);
  frame = (frame+1) % numFrames;  // Use % to cycle through frames
  image(images[frame], 50, 50);
  popMatrix();
}
  






