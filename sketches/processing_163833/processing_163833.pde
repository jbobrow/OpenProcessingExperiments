
 for (int gridX = 0; gridX < img.width; gridX++) {
    for (int gridY = 0; gridY < img.height; gridY++) {
      // grid position + tile size
      float tileWidth = width / (float)img.width;
      float tileHeight = height / (float)img.height;
      float posX = tileWidth*gridX;
      float posY = tileHeight*gridY;

      // get current color
      color c = img.pixels[gridY*img.width+gridX];
      // greyscale conversion
      int greyscale =round(red(c)*0.222+green(c)*0.707+blue(c)*0.071);

      switch(drawMode) {
      case 1:
        // greyscale to stroke weight
        float w1 = map(greyscale, 0,255, 15,0.1);
        stroke(0);
        strokeWeight(w1 * mouseXFactor);
        line(posX, posY, posX+5, posY+5); 
        break;
