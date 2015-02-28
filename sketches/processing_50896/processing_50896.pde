
PImage images[];
PImage bgyacht;  
int r;
int p;
int timer;


void setup() {

  size(510, 510);
  bgyacht = loadImage("bgyacht.jpg");
  background(bgyacht);

  imageFolder("image_", 9);
}

void draw() {


  if (millis() - timer > 10*1000) { 
    //image(images[r],0,0);  this will make the image actually show up on the front...
    r=int(random(1, 9));
    p = p+1;
    //save("pic" + p + ".jpg");//activate if image save is wanted
    timer = millis();
  }
  if (p > 9) {
    p = 0;
  }
  copy(images[r], mouseX, mouseY, 20, 20, mouseX, mouseY, 20, 20);
}


void imageFolder(String image_, int filecount) {

  images = new PImage[filecount];

  for ( int i = 0; i< images.length; i++ ) {
    images[i] = loadImage(image_ + (i) + ".jpg" );
  }
}


