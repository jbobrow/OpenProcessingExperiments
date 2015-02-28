
void setup() {
  size(500, 500);
  smooth();

  background(255, 195, 100);
}

void draw() {
}

int a=50;
int b=50;

void mousePressed() {
  for (int x=0; x<width; x+=50) {       //sets x grid 
    for (int y=0; y<height; y+=20) {       //sets y grid
      int myColor = floor(random(1, 250));        //determines scale for porbablility

       if (myColor <=5) {       //key for the white to black gradient rectangles
        strokeWeight(.1);  
        fill(random(0, 255));
        rect(x, y, 50, 20); 
      }
      if (myColor >=249) {        //key for the red rectangles
        fill(230,63,63);
      rect(x, y, 50, 20);
      }
       if (myColor ==50) {        //key for orange rectangles
        fill(255, 195, 100);
      rect(x, y, 50, 20);
      }
      if (myColor==100){        //white transparent elongated rectangles
        fill(250,250,250,80);
        rect(x,y,width/2,20);
      }
       if (myColor==150){      //black transparent elongated rectangles
        fill(0,0,0,100);
        rect(x,y,width/2,20);
      }
    }
  }
}


