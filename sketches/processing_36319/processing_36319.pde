
void setup() {
  size(300, 300);
}

int keelcenter=1;
int mast=3;
int sailLeftside=4;
int sailRightside=15;
int flag=-15;
int skull=-3;
int bone=-12;
int bonetwo=1;
int light=10;


void draw() {
  background(196, 223, 240);

  //The sea (which does not move)
  noStroke();
  fill(0, 152, 250);
  rect(0, 200, 300, 100);

  //The boat
  fill(116, 67, 50);
  arc(keelcenter, 195, 60, 40, 0, PI);

  //The Mast
  fill(0, 0, 0);
  stroke(2);
  line(mast, 195, mast, 170);

  //The Sail 
  noStroke();
  fill(255, 255, 255);
  triangle(sailLeftside, 170, sailLeftside, 190, sailRightside, 190);

  if (mousePressed) {
    fill(70, 70, 70);

    //Clouds
    ellipseMode(CENTER);
    ellipse(50, 40, 70, 50);
    ellipse(30, 20, 30, 30);
    ellipse(20, 30, 30, 30);
    ellipse(60, 25, 30, 30);
    ellipse(80, 30, 30, 30);
    ellipse(80, 55, 30, 30);
    ellipse(60, 55, 30, 30);
    ellipse(30, 60, 30, 30);

    ellipse(150, 40, 70, 50);
    ellipse(130, 20, 30, 30);
    ellipse(120, 30, 30, 30);
    ellipse(160, 25, 30, 30);
    ellipse(180, 30, 30, 30);
    ellipse(180, 55, 30, 30);
    ellipse(160, 55, 30, 30);
    ellipse(130, 60, 30, 30);

    ellipse(250, 40, 70, 50);
    ellipse(230, 20, 30, 30);
    ellipse(220, 30, 30, 30);
    ellipse(260, 25, 30, 30);
    ellipse(280, 30, 30, 30);
    ellipse(280, 55, 30, 30);
    ellipse(260, 55, 30, 30);
    ellipse(230, 60, 30, 30);

    //ARGGG Pirate flag
    fill(0, 0, 0);
    rect(flag, 170, 20, 20);
    fill(255);
    ellipse(skull, 175, 8, 5);
    stroke(255);
    strokeWeight(2);
    line(bone, 180, bonetwo, 185);
    line(bone, 188, bonetwo, 180);

    //strokes of lightning 
    stroke(255, 243, 6);
    line(3*light, 60, 4*light, 97);
    line(4*light, 97, 2*light, 135);
    line(2*light, 135, 4*light, 155);

    line(5*light, 60, 6*light, 97);
    line(6*light, 97, 4*light, 135);
    line(4*light, 135, 6*light, 155);

    line(13*light, 60, 15*light, 97);
    line(15*light, 97, 12*light, 135);
    line(12*light, 135, 15*light, 155);

    line(18*light, 60, 20*light, 97);
    line(20*light, 97, 17*light, 135);
    line(17*light, 135, 20*light, 155);

    line(23*light, 60, 25*light, 97);
    line(25*light, 97, 22*light, 135);
    line(22*light, 135, 25*light, 155);

    line(28*light, 60, 30*light, 97);
    line(30*light, 97, 27*light, 135);
    line(27*light, 135, 30*light, 155);
  }
  else {


    fill(255);

    //Clouds
    ellipseMode(CENTER);
    ellipse(50, 40, 70, 50);
    ellipse(30, 20, 30, 30);
    ellipse(20, 30, 30, 30);
    ellipse(60, 25, 30, 30);
    ellipse(80, 30, 30, 30);
    ellipse(80, 55, 30, 30);
    ellipse(60, 55, 30, 30);
    ellipse(30, 60, 30, 30);

    ellipse(150, 40, 70, 50);
    ellipse(130, 20, 30, 30);
    ellipse(120, 30, 30, 30);
    ellipse(160, 25, 30, 30);
    ellipse(180, 30, 30, 30);
    ellipse(180, 55, 30, 30);
    ellipse(160, 55, 30, 30);
    ellipse(130, 60, 30, 30);

    ellipse(250, 40, 70, 50);
    ellipse(230, 20, 30, 30);
    ellipse(220, 30, 30, 30);
    ellipse(260, 25, 30, 30);
    ellipse(280, 30, 30, 30);
    ellipse(280, 55, 30, 30);
    ellipse(260, 55, 30, 30);
    ellipse(230, 60, 30, 30);


    //Sun
    fill(255, 243, 6);
    ellipse(50, 150, 30, 30);
  }


  keelcenter++;
  mast++;
  sailLeftside++;
  sailRightside++;
  flag++;
  skull++;
  bone++;
  bonetwo++;
}


