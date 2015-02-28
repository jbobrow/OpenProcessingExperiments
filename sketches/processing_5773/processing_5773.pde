
void setup (){
  size (620,620);
  frameRate (50);
  noStroke ();
  background(255);

}


void draw () {

  int gridX = (width/4)/3;
  int gridY = (height/4)/3;

  for (int x = 4; x<600; x+=70) {
    for (int y = 4; y<600; y+=70) {
      if (x==600) {
        x=0;
      }
      fill (random(255),random(255),random(255));
      rect (x,y,gridX,gridY);
    }
  }


}




