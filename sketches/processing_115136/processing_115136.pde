
PImage img;
int x;
int y;
color pix;
float pointillize=5;

void setup() {
  size(600, 424);
  img = loadImage("Dali.jpg");
  //imageMode(CENTER);
}

void draw() { 
  background(0);
  image (img, 0, 0);
  for (y=0; y<424; y+=5){
    for(x=0; x<600; x+=5){
      pix = img.get(x,y);
      if (pix !=color(0,0,0)){
        noStroke();
        fill(pix);
        if (dist(mouseX, mouseY, x, y)<=1.9){
          pointillize=50;
        }
        else{
          pointillize =5;
        }
        ellipse(x,y,pointillize, pointillize);
      }
    }
  }
}


