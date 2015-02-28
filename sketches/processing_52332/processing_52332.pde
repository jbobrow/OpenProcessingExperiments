
class Field {

  float centerX;
  float centerY;
  float endX;
  float endY;
  float endZ;
  float thumbW= 140;
  float endAngleX = -32; // changing the viewport angle
  // int cols;
  float spacer = 400;
  Photograph[] photographs;

  Field(Photograph[] photographs_, int cols_, float centerX_, float centerY_) {
    photographs = photographs_;
    cols = cols_;
    centerX = centerX_;
    centerY = centerY_;
  }

  void display(Picker picker, Viewport viewport) {

    pushMatrix();

    viewport.x = viewport.x + (endX - viewport.x) * damping;
    viewport.y = viewport.y + (endY - viewport.y) * damping;
    viewport.z = viewport.z + (endZ - viewport.z) * damping;
    viewport.angleX = viewport.angleX + (endAngleX - viewport.angleX) * damping;

    rotateX(radians(viewport.angleX)); 
    translate(viewport.x, viewport.y, viewport.z);

    // loop through photos
    for (int i = 0; i < photographs.length; i++) {
      picker.start(i);
      photographs[i].display();
    }

    popMatrix();

    onMouseOver();
  }

  void position() {


    int[] rowCount = new int[22];

    for (int i = 0; i < photographs.length; i++) {
      String position = photographs[i].player.playerPosition;

      // positioning algorithm
      float col = 0;
      int row = 0;

      if (position == "Goalkeeper") {
        row = 0;
      }
      else if (position == "Defender") {
        row = 1;
      }
      else if (position == "Midfield") {
        row = 2;
      }
      else if (position == "Forward") {
        row = 3;
      }
      else if (position == "HeadCoach") {
        row = 21;
      }

      rowCount[row]++;
      col = rowCount[row];

      // calculate horizontal offset to center grid in sketch window
      float totalWidthOfObjects = thumbW * cols;
      float spaceBetweenObjects = spacing * (cols-1); 
      float offsetX = centerX - (totalWidthOfObjects / 2) - (spaceBetweenObjects / 2);


      // calculate view end coordinates
      float endX = (offsetX-200) + (thumbW + spacing) * col;
      float endY = centerY;
      float endZ = spacer/2 - spacer * row;

      if (row == 0) {
        endX = (offsetX+100) + (thumbW + spacing) * col;
      }

      photographs[i].position(endX, endY, endZ);
    }
  }


  void onMouseOver() {
    // clear hover state for all photos by setting isHovered to false
    for (int i = 0; i < photographs.length; i++) {
      photographs[i].isHovered = false;
    }

    int selectedPhotoIndex = picker.get(mouseX, mouseY);

    if (selectedPhotoIndex > -1) {

      if (!photographs[selectedPhotoIndex].isHovered) {
        photographs[selectedPhotoIndex].isHovered = true;
      }
    }
  }
}


