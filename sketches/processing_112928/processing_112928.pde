
void setup() {
  smooth();
  size(800,800);
  background(0);

  frameRate(24);
}

void draw() {
  fill(0, 2);
  rect(0, 0, width+20, height+20);
  textLeading(100);

  int q= int(random(0, 2000));
  char c= char(q);

  for (int a = 0; a<width; a+=50) {
    for (int b = 0; b<height; b+=30) {
      stroke(240);
      strokeWeight(3);
      fill(random(10), random(255), random(10));
      int s=5;
      text(q, a, b);
      if (keyPressed == true)  {
        textSize(30);
       // rotate(PI/5);
        frameRate(1);
        textAlign(CENTER);
        textSize(50);
        text("FREE YOUR MIND",width/2,height/2);
        
      }
      else {
        textSize(15);
        fill(random(250), random(10), random(10));
      }
      //int q= int(, 0, 999));
    }



    //if (dist(mouseX, mouseY, a, b)<9) {
    //textSize(30);
  }
}



