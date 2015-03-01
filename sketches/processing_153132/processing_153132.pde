

PImage myImg;
color[] pixelColors;
color[] spiralColors;
int scanLine;  // vertical position
/* @pjs preload="sunset-4.jpg"; */ 

void setup() {
  size(700, 622);
  myImg = loadImage("sunset-4.jpg");
  pixelColors = new color[1080];
  scanLine = 0;
  smooth(4);
}

void draw() {
  background(0);

  // read the colours for the current scanLine
  for (int i=0; i<10; i++) {
    pixelColors[i] = myImg.get(17+i*35, scanLine);
  }



  //fill(color(255));
  for (int i=1080; i>1; i--){
      
      pixelColors[i-1] = pixelColors[i-2];
      fill(pixelColors[i-1]);
    if (i%3==0){

      float x = (360-i/3)*cos(radians(i)) + width/2 ;
      float y = (360-i/3)*sin(radians(i)) + height/2 ;
      ellipse(x,y,30,30);
      x = (330-i/3)*cos(radians(i)) + width/2 ;
      y = (390-i/3)*sin(radians(i)) + height/2 ;      
      fill(pixelColors[i-1] ^ 0x00FFFFFF);
      ellipse(x,y,30,30);      
      
    }
  }

  // increment scan line position every second frame
  if (frameCount % 2 == 0) {
    scanLine ++;
  }

  if (scanLine > height) {
    scanLine = 0;
  }


}



