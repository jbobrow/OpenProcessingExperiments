
class pixelizer {

  int xPos;
  int yPos;

  int wRect;
  int hRect;

  color pixelColor;

  

  pixelizer() {
    
    pixelColor= myImage.get(mouseX, mouseY);
  }




  void colors() {

    if (keyPressed && key == 'c') {
      //  if (key == 'c') {
      pixelColor = myImage.get(mouseX - 30, mouseY - 310);
    }
  }


  void fakeGrid() {

    //Grid------------------------------------>
    for (int i = 0; i <= 400 ; i= i+20) {
      for (int j = 0; j <= 400 ; j= j+20) {
        rect(200+i, 200+j, 20, 20);
      }
    }
  }

  void filler() {
    if (mousePressed) {  
      for (int i = 200; i < 620 ; i+=20) {
        for (int j = 200; j < 620; j+=20) {
          if (mouseX > i && mouseX <= i+20) {
            if (mouseY > j && mouseY <= j+20) {
              fill(pixelColor);
              rect(i, j, 20, 20);
            }
          }
        }
      }
    }
  }
}



