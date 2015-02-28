
PImage myImage;
PImage secImage;
PImage thirdImage;
PImage fourImage;

void setup (){
  size(600,600);
  noStroke();
  smooth();
  strokeWeight(4);
  stroke(255, 0, 0);
  myImage = loadImage("letter 1.jpg");
  secImage = loadImage("letter2.jpg");
  thirdImage = loadImage("letter3.jpg");
  fourImage = loadImage("letter4-1.jpg");
  blend(secImage, 0, 0, 33, 100, 67, 0, 33, 100, DARKEST);
  frameRate(10);
}

void draw (){
  line(200, 200, 300, 500);
  line(200, 200, 400, 100);
  line(300, 500, 250, 600);
  line(400, 100, 600, 250);
  line(0, 350, 125, 400);
  line(600, 600, 540, 570);
  line(100, 0, 330, 230);
  line(330, 230, 0, 250);
  line(450, 600, 600, 300);
  line(600, 0, 400, 375);
  line(400, 375, 600, 400);
  line(300, 0, 300, 215);
  line(300, 564, 300, 600);
  fill(random(255),random(255),random(255),random(255));
  rect(random(600), random(600), random(600), 30, 50);
  
  tint(153, 245, 216, 50);
  image(myImage, -100, -200, 450, 550);
  
  tint(52, 216, 204, 50);
  image(secImage, 0, 100, 800, 600);
  
  tint(146, 202, 229, 50);
  image(thirdImage, 300, -100, 300, 600);
  
  tint(146, 202, 229, 25);
  image(fourImage, -100, 350, 500, 300);
}

void mousePressed(){
  saveFrame("sketch_121122a");
}
