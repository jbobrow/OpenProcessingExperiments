
PImage myImage;
//PImage secImage;
PImage thirImage;
PImage fourImage;

void setup () {
  size(450, 600);
  strokeWeight(4);
  background(255);
  frameRate(80);
  myImage = loadImage("IMG_0576.jpg");
  //secImage = loadImage("IMG_0591.JPG");  
  thirImage = loadImage("IMG_0551.jpg");
  fourImage = loadImage("IMG_0564.JPG");
}

void draw (){
  
  fill(random(20), random(20), random(20), 100);
  rect(0, 0, width, height);
  
  tint(255, 20);
  image(myImage, 0, 0, 450, 600);
  
  tint(255, 5);
  image(thirImage, 0, 0, 450, 600);
  
  tint(255, 5);
  image(fourImage, 0, 0, 450, 600);
  
  fill(random(255), 100);
  ellipse(random(600), random(600), 20, 20);
  smooth();
  strokeWeight(0);

  fill(255, 255, 255, 60);
  ellipse(random(600), random(600),20, 20);
  smooth();
  strokeWeight(0);
  
  fill(random(255), random(255), random(255), 60);
  rect(random(600), random(600), 1, 20);
  smooth();
  strokeWeight(0);
  
  fill(random(255), 60);
  ellipse(random(mouseX), random(mouseY), 20, 20);
  smooth();
  strokeWeight(0);
  
  fill(255, 255, 255, 60);
  ellipse(random(600), random(600), 20, 20);
  smooth();
  strokeWeight(0);
  
  tint(mouseX, mouseX); 
  image(myImage, 0, 0, 450, 600);
  
  tint(mouseY, 10);
  image(thirImage, 0, 0, 450, 600);
  
  tint(255, 5);
  image(fourImage, 0, 0, 450, 600);
  
  //tint(255, 10);
  //image(secImage, 0, 0, width, height);
  
  //fill (255, 0, 200);
  //rect(mouseX, mouseY, mouseX+50, mouseY+75);
  //line (200, 200, mouseX, mouseY);
}

