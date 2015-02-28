
float brainSize = 80;
float r = 200;
float g = 150;
float b = 0;
float a = 150;
float leftEyeX = 100;
float rightEyeX = 200;
float eyeY = 135;
float eyeSize = 20;
void setup() {
  size(300, 300);
  background(#71E0D2);
  }

  void draw() {
    noStroke();

    fill(#E875AD); //brain
    ellipse(150, 100, 2*brainSize, brainSize);
    rect(135, 100, 20, 200);

    fill(#35AAA1, 150);//flesh
    quad(120, 230, 180, 230, 100, 300, 200, 300);
    ellipse(150, 130, 250, 200);
    ellipse(150, 175, 175, 200);

    fill(r,g,b, 150);//eyebrows
    rect(75, 100, 40, 10, 3);
    rect(175, 100, 40, 10, 3);

    fill(#D0F0E4, 150);//sclera
    ellipse(95, 140, 40, 40);
    ellipse(195, 140, 40, 40);

    fill(0, 150);//irises
    ellipse(leftEyeX, eyeY, eyeSize, eyeSize);
    ellipse(rightEyeX, eyeY, eyeSize, eyeSize);

    fill(255);//reflection in eye
    ellipse(99, 132, 5, 5);
    ellipse(199, 132, 5, 5);

    fill(#FABC9F, 200);//bridge of nose
    quad(135, 140, 155, 140, 170, 190, 130, 190);
    ellipse(130, 190, 12, 12);
    ellipse(168, 190, 12, 12);

    fill(#D0F0E4, 100);//ridge above lips
    quad(148, 198, 153, 196, 157, 220, 148, 220);

    fill(r,g,b,200);//tip of nose
    ellipse(150, 190, 30, 20);

    fill(#E03D76, 200);//neck
    ellipse(151.5, 232, 55, 15);
    quad(148, 220, 157, 220, 180, 230, 125, 230);
    
    fill(#FA444A,a);//blush
    ellipse(90,180,30,20);
    ellipse(210,180,30,20);

    strokeWeight(1);
    stroke(25, 200);
    line(178, 230, 125, 230);
  }
  
void mousePressed(){
  brainSize = random(20,110);
  r = random(150,255);
  g = random(50,255);
  b = random(0,150);
  a = random(50,255);
  eyeSize = random(5,30);
  eyeY = random(125,145);
  rightEyeX = random(90,110);
  leftEyeX = random(190,210);
}
