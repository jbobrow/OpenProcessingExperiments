

PImage img;
int vx=0;//x axis ellipse speed//
int vvelerx=10;//x axis ellipse speed//
int vy=1;//y axis ellipse speed//
int posx=0;//x axis ellipse start point//
int posy=height/2+400;//y axis ellipse start point//
float midax=random(50, 20);//ellipse geometry width//
float miday=random(10, 5);//ellipse geometry height//
int posvelerx=width;//x axis ellipse start point//
void setup() {
  size(600, 600);
  img = loadImage("ship.png");
  noSmooth();
}
void draw() {
  posvelerx=posvelerx-vvelerx;
  posx=posx+vx;//x axis ellipse movement definition//
  posy=posy+vy;//y axis ellipse movement definition//
  for (int o=0; o<height+50; o++) {
    stroke(o/4, o/2, o, o/4);
    line(0, o-50, width, o-50);
 }
 for (int i=0; i<width; i++) {
  stroke(i, i/4, 0, i/4);
  line(0, height/10+i, width, height/10+i);
 }
  image(img, posvelerx, (height/2)+50, 100, 100);
  noStroke();
  for (int d=0; d<10000;d++) {//bucle definition//
    fill(random(posx), random(posx), random(posy),10);//ellipse color//
    ellipse(posx+random(width), posy+d/60, midax, miday);//ellipse definition//
  }//geometries bounce//
  if ((posx+midax)>=width) {
    vx=-vx;
  }
  if ((posy+miday)>=height) {
    vy=-vy;
  }
  if ((posx+midax)<=0) {
    vx=-vx;
  }
  if ((posy+miday)<(height/2)+400) {
    vy=-vy;
  }
  if (posvelerx<-100) {
    posvelerx=width+100;
    posvelerx=posvelerx-vvelerx;
  }
}



