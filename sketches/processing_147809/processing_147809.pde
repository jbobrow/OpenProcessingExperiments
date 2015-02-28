
PImage img;
color c;


void setup() {
  img = loadImage("cat.jpg");
  size(512, 349);
}

void draw() {
  //image(img,x,y,img.width,imgheight); 
  //image(img,0,0,width,height); 
  image(img, 0, 0 );

  for ( int i = 0 ; i < height; i = i + 5 ) {

    c =img.get(mouseX, i);
    stroke(c);
    strokeWeight(5);
    line(0, i, mouseX, i);
  }
}



