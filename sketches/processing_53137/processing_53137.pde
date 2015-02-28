
//Raven Kwok | 郭锐文
//Email: raystain@gmail.com
//Blog: the-moor.blogbus.com
//Vimeo: vimeo.com/ravenkwok
//Weibo: weibo.com/ravenkwok
//Inspired by Pete Hipwell's Sine Dive via http://openprocessing.org/visuals/?visualID=4324

float base;
float baseDegree;
float range;
float incre;

void setup() {
  size(400, 400, P2D);
  range = 1000;
  incre = 0.01;
}
void draw() {
  base = sin(radians(baseDegree))*range;
  background(0);
  loadPixels();
  for (int i=0;i< width/2;i++) {
    for (int j=0;j< height/2;j++) {
      int index1 = i+j*width;
      int index2 = width-1-i+j*width;
      int index3 = i+(height-1-j)*width;
      int index4 = width-1-i+(height-1-j)*width;
      float r = 255*sin(radians(base*dist(i,j,width/2,height/2)));
      float g = 255*cos(radians(base*dist(i,j,0,0)));
      float b = 255*sin(radians(base*dist(i,j,width,height)));
      pixels[index1] = color(r,g,b);
      pixels[index2] = color(r,g,b);
      pixels[index3] = color(r,g,b);
      pixels[index4] = color(r,g,b);
    }
  }
  baseDegree +=incre;
  updatePixels();
}


