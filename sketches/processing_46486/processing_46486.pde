
float rote1;
float rote2;
PFont type;
PFont type2;
int x, y;

PImage img;


void setup() {
  size (600, 600, P3D);

  type = loadFont("BlackmoorLetPlain-48.vlw");
  type2 = loadFont("BanglaMN-48.vlw");
  smooth();
  img = loadImage("light.gif");
}

void draw() {
  background(250);
  rote1 += 0.005;
  translate(300, 300, mouseY);
  rotateY(rote1);
  fill(255);
  image(img, -150, -150);
  strokeWeight(1);
  directionalLight(255, 255, 255, 100, 100, 100);

  fill(random(255), random(255), random(255));
  sphere(70);
  fill(200, 100, 255);
  textFont(type, 50);
  text("ITP TIME", -130, -150, 100);
  fill(0);
  textFont(type2, 20);
  text("Fianl is Coming,", -200, 30, 120);
  text("What is your ICM and", -200, 60, 120);
  text("Pcom idea?", -200, 90, 120);

  text("I love coding,", -50, -90, 140);
  text("but code doesn't love me!", -50, -60, 140);

  fill(255, 0, 0);
  text("Thinking about it day and night?", -100, 150, 160);

  directionalLight(255, 255, 255, -300, -100, -300);
  pushMatrix();
  rote2 +=0.1;
  translate(100, 100, 100);
  rotate(rote2);
  sphere(40);
  popMatrix();
  pushMatrix();
  rote2 +=0.1;
  translate(-100, -100, 100);
  rotate(rote2);
  sphere(20);
  popMatrix();
  pushMatrix();
  fill(0, random(255), random(200));
  rote2 +=0.1;
  translate(200, 200, -100);
  rotate(rote2);
  sphere(30);
  popMatrix();
  pushMatrix();
  rote2 +=0.1;
  translate(-200, -100, -100);
  rotate(rote2);
  sphere(30);
  popMatrix();

  fill(255);
  textFont(type2, 15);
  text("can I just put my stupid pet trick work?", 0, -60, -210);
  text("media control is a good project too", 0, -90, -220);
  text("can I put what ever I want in winter show?", 0, -120, -250);
  text("I am thinking about have the best x'mas.", 0, 100, -300);
  text("I can't wait for winter vacation, I am going back home.", 0, -200, -220);
  text("I don't care about winter show, just let me finish my final work.", 50, -60, -100);
  text("Soon, you will see me on the really paper because my work is great!!!", 100, -90, -130);
  text("I hate people thinking about getting job, art is more important.", 50, -120, -260);
  text("Art? can you eat that?? ", -50, 150, -180);
  text("please give me an A!!!", -50, -60, -210);
  text("I love coding.", -50, -90, -220);
  text("Play with code", -25, -120, -250);
  text("have a nice thanksgiving", -32, 100, -300);
  text("In a Dark time for Final", -200, 60, -200);
  text("but light will come right soon", -200, 90, -100);
  text("don't worry", -200, -120, -150);
  text("final two weeks", -200, 150, -220);
  text("Join the winter show", -50, 60, -200);
  text("com out with good idea", -50, 90, -100);
  text("Play with code", -10, -120, -150);
  text("have a nice thanksgiving", -10, 200, -220);
  text("In a Dark time for Final", 100, 60, -100);
  text("but light will come right soon", 100, 90, -130);
  text("don't worry", 100, 120, -260);
  text("final two weeks", -300, -150, -180);
  text("Join the winter show", -300, -60, -210);
  text("com out with good idea", -300, -90, -220);
  text("Play with code", -250, -120, -250);
  text("have a nice thanksgiving", -320, 100, -300);
  text("have a nice thanksgiving", -10, -200, -220);
  text("In a Dark time for Final", 100, -60, -100);
  text("but light will come right soon", 100, -90, -130);
  text("don't worry", 100, -120, -260);
  text("final two weeks", -300, 150, -180);
  text("Join the winter show", -300, -60, -210);
  text("com out with good idea", -300, -90, -220);
  text("Play with code", -250, -120, -250);
  text("have a nice thanksgiving", -320, 100, -300);

  strokeWeight(100);
  noFill();
  stroke(200, 100, 255);
  rectMode(CENTER);
  rect(0, 0, 599, 599);

  if (mousePressed) {
    sphereDetail(mouseX/10);
  }
}


