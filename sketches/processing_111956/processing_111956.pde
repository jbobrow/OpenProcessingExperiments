

PImage zong;

void setup(){
  size(720,960);
  zong = loadImage("scard.jpg");
}
void draw(){
  tint(205,30,145,140);
  image(zong, 0, 0);
  strokeWeight(40);
  line(340,600, 280, 580);
  line(340,600, 410, 600);
  line(410,600, 440, 580);
  line(440,580, 470, 500);
  line(470,500, 410, 575);
  line(410,575, 360, 575);
  line(280, 580, 245, 500);
  line(245,500, 360, 575);
  strokeWeight(3);
  for (int i = 300; i < 450; i = i+5) {
  line(200, i, 600, i);
}
for (int x = 200; x < 600; x = x+5) {
  line(x, 300, x, 450);
}
float l = 0.3;
l = l + .01;

  float n = noise(l) * height;

  line(n, 0, n, height);
  line(0, n, width, n);
  float k=0.02;
  for(int a=0; a < width; a++) {

    float d = noise((mouseX+a)*k, 

                            mouseY*k);

    stroke(d*255);

    line(mouseY+d*1380,a, width, a);

  }
}


