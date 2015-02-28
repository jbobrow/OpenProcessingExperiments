
PImage img;
int vx=0;//x axis water speed//
int vvelerx=7;//x axis ship speed//
int vy=1;//y axis water speed//
int posx=0;//x axis ellipse start point//
int posy=height/2+400;//y axis water start point//
float midax=random(50, 20);//ellipse geometry width//
float miday=random(10, 5);//ellipse geometry height//
int posvelerx=width;//x axis ship start point//
void setup() {
  size(600, 600);
  img = loadImage("ship.png");//ship image load//
  noSmooth();
}
void draw() {
  posvelerx=posvelerx-vvelerx;//x axis ship movement definition//
  posx=posx+vx;//x axis water movement definition//
  posy=posy+vy;//y axis water movement definition//
  for (int o=0; o<height+50; o++) {//sky background//
    stroke(o/4, o/2, o, o/4);
    line(0, o-50, width, o-50);
  }
  for (int i=0; i<width; i++) {
    stroke(i, i/4, 0, i/4);
    line(0, height/10+i, width, height/10+i);
  }
  image(img, posvelerx, (height/2)+50, 100, 100);//ship image settings//
  noStroke();
  for (int d=0; d<10000;d++) {//water bucle definition//
    fill(random(posx), random(posx), random(posy), 10);//ellipse color//
    ellipse(posx+random(width), posy+d/65, midax, miday);//ellipse definition//
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
  if (posvelerx<-500) {
    posvelerx=width+100;
    posvelerx=posvelerx-vvelerx;
  }
  int []posVx = {//ship x axis position matrix//
    posvelerx+50, posvelerx+100, posvelerx-50, posvelerx+160, posvelerx-160, posvelerx-130, posvelerx+200, posvelerx+100, posvelerx+70
  };
  int []posVy = {//ship y axis position matrix//
    (height/2)+51, (height/2)+57, (height/2)+60, (height/2)+65, (height/2)+70, (height/2)+77, (height/2)+80, (height/2)+80, (height/2)+100
  };
  int []mides = {//ship size matrix//
    101, 107, 113, 115, 120, 127, 130, 120, 150
  };
  for (int m=0; m<mides.length;m++) {//ship bucle definition//
    rotate(random(0.006, -0.006));
    image(img, posVx[m], posVy[m], mides[m], mides[m]);
  }
}


