
String message = "THE ACADEMY MUSEUM OF MOTION PICTURES";
PImage copper;
float xpos;
float xpos2;


void setup() {
  size(500, 500);
  smooth();
  PFont font = loadFont("OratorStd-48.vlw");
  copper = loadImage("copper3.jpg");
  textFont(font);
  textAlign(LEFT, CENTER);
  textSize(30);
}

void draw() {
 //shape(copper, 0,0, width,height);
 // background(255);
  fill(255);
  rect(0,0,width,height);
 
  

  float xpos=map(mouseX, 0, width, 240, 370);
  float xpos2=map(mouseX, 0, width, 150, 280);

 float diff1 = xpos - 80;
 float diff2 = xpos2 - 80;
 
// println(diff1);
//println(diff2);
 float fill1 = map(diff1, 150,280, 10, 40);
 float fill2 = map(diff2, 280,150, 10, 40);
 
  beginShape();
   //fill(20, 20, 20);
   fill(fill1,200);
  noStroke();
  vertex(90, 260);
  vertex(90, 340);
  vertex(xpos, 340);
  vertex(xpos, 180);
  endShape();


  beginShape();
  fill(fill2,200);
  noStroke();
  vertex(420, 260);
  vertex(420, 340);
  vertex(xpos2, 340);
  vertex(xpos2, 180);
  endShape();


  println( brightness(get(mouseX,mouseY)) );
  loadPixels();
  copper.loadPixels();

  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++ ) {
      int loc = x + y*width;

      if (brightness(pixels[loc]) < 60) {
        pixels[loc] = copper.pixels[loc];
      }
    }
  }
  updatePixels();
  copper.updatePixels();



 fill(0, 0, 0);
  text(message, 90, 340, 340, 100);
  
}

