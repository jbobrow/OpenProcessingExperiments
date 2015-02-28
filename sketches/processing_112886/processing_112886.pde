
int z;
int l;
float a, x, y;
float teta;
int b;
float c;
float d;
void setup() {
  background(130, 216, 255);
  for (int z = 0; z <= 500; z = z+100) {//céu com estrelas
    for (int b = 0; b <+ 500; b = b+50) {
      strokeWeight(2);
      stroke (random(0, 255));
      point(random(a), random(b));
    }

    size(900, 600);
    frameRate (5);
  }
} 
void draw() {
  colorMode(RGB);
  background(130, 190, 200);

  for (int a=1; a<502; a+=1) {

    stroke(a/2, 50, 50);
    line(0, a, 1000, a);
  }
  stroke(0);
  for(int a=0; a<50; a++)
  rect(a*20+random(15), 500, random(20,40), -random(100,200));

  //luzes------ 
  for (float d = 0; d<320; d=d+15) {
      stroke(random(c), random(c), random(c));
    noFill();
    ellipseMode(CENTER);
    ellipse(450, 300, d, d);


    //roda gigante---
    strokeWeight(1);
    noFill();
    stroke(190);
    ellipse(450, 300, 350, 350);
    ellipse(450, 300, 320, 320);

    fill(90);
    colorMode (HSB);
    for (int i=0; i<48; i++)
    {
      teta= i* PI/24 +mouseX * PI/width;
      x=167*cos(teta);
      y=167*sin(teta);
      fill(teta*255/48, 255, 255);
      ellipse(450+x, 300+y, 15, 15);
    }


    colorMode (RGB);
    //estruturas/
    strokeWeight(5);
    line(450, 300, 400, 500);
    line(450, 300, 500, 500);

    strokeWeight(0);
    line(450, 140, 450, 460);
    line(290, 300, 610, 300);
    //piso/
    fill(90);
    strokeWeight(3);
    line(0, 500, 900, 500);
    rect(400, 480, 100, 20);
  }
}




void keyPressed() {
  if (keyCode == UP) {
    c = 255;
  } 
  else if (keyCode == DOWN) {
    c = 0;
  }
}
