



void setup() {

  size(400, 400);

  smooth();

  background(0);

  colorMode(HSB);


}

void draw() {

  filter(BLUR);


  if (mousePressed) {


    filter(DILATE);


  } else {

    filter(ERODE);


  }


  stroke(frameCount % 256, 255, 255);
//fill(frameCount % 256, 255, 255);
  strokeWeight(10);


//  rect(pmouseX, pmouseY, mouseX, mouseY);
 //  line(pmouseX, pmouseY, mouseX, mouseY);
 ellipse(pmouseX, pmouseY, mouseX, mouseY);






     





}



