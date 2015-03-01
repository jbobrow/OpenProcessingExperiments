
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PFont font;


int count;
int imageNumber;


void setup(){
  size(400,400);
  background(0);
  img1 = loadImage("img1.jpg");
  img2 = loadImage("img2.jpg");
  img3 = loadImage("img3.jpg");
  img4 = loadImage("img4.jpg");
  font= loadFont("AppleBraille-Pinpoint6Dot-48.vlw");
 imageMode(CENTER);
}
void draw(){
  if (count == 0) {
    switch(imageNumber) {
    case 0:
      image(img1, width/2, height/2);
      noFill();
      stroke(255);
      beginShape();
      vertex(0, height);
      vertex(width/2, height/2);
      vertex(400, 400);
      endShape();
      break;
    case 1:
      image(img2, width/2, height/2);
            noFill();
      stroke(255);
      beginShape();
      vertex(width, 91);
      vertex(width/2, height/2);
      vertex(400, 400);
      endShape();
      break;
    case 2:
      image(img3, width/2, height/2);
            noFill();
      stroke(255);
      beginShape();
      vertex(width, 0);
      vertex(width/2, height/2);
      vertex(0, 0);
      endShape();
      break;
    case 3:
      image(img4, width/2, height/2);
            noFill();
      stroke(255);
      beginShape();
      vertex(0, 0);
      vertex(width/2, height/2);
      vertex(width, 0);
      vertex(width, height);
      vertex(width/2, height/2);
      vertex(0, height);

      endShape();
      break;

    }
    imageNumber = (imageNumber + 1)%5;
  }
//        text(str, x1, y1, x2, y2)


  count = (count + 1)%80;
//          text("In architecture it isn’t enough to just have the right building that works well. It can also be beautiful. It can also be different. It can create surprise. And surprise is the main thing in a work of art.  I like and respect Brasí­lia very much.",50,50,350,350);

}


