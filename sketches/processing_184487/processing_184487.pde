
/*--------
Casey Hamilton
Feb 5 2015
Art 3001
----------*/

void setup() {
  size(500,500);

}

void draw() {
  for(int x=25; x<width; x=x+50) { //sets x axis/margin
    for(int y=25; y<height; y=y+50) { //sets y axis/margin

      ellipse(x,y,25,25); //size of circles
    }
  }
}



