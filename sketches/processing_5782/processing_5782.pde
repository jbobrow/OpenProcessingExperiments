
float r;
float gr;
float mini;
float maxi;

void setup () {

  size(600,600);
  background (40,0,0);
  frameRate (150);
  smooth();
  gr = 50;
}


void draw () {

  fill (random(255),0,0);


  if ((mouseX>=0.1) && (mouseX<=width-0.1)) {

    if (keyPressed) {

      switch (keyCode) {
      case UP: 
        gr+=1;
        break;

      case DOWN: 
        gr-=1;
        break;
      }

      switch (key) {
      case ' ': 
        background (40,0,0);
      }

    }

    mini = 7;
    maxi = 200;

    if (gr<mini) {
      gr=mini;
    }
    if (gr>maxi) {
      gr=maxi;
    }

    r= gr+sin(frameCount)*4;

    ellipse( mouseX, mouseY, r, r ); 

  }

}








