
PImage img;
int smallPoint, largePoint;
float xoff=0, yoff =0;
float d = 100;
float timeCnt = 0; 
void setup() {

  img = loadImage("http://blogfiles.naver.net/20141105_277/sountphen_1415118230246B5z50_JPEG/kin.jpg");
  size(img.width, img.height);
  smallPoint = 1;
  largePoint = 10;
  imageMode(CENTER);
  noStroke();
  background(255);
}
void draw() { 
  float pointillize = map(timeCnt++, 0, width, smallPoint, largePoint);
  if (pointillize>largePoint)
    pointillize = largePoint;

  float angleInc = PI / (width/10);
  float angle =0;
  for (int x = 0; x <= width; x += 10) {
    int y =  (int)map(noise(xoff, yoff), 0, 1, 0-d, height+d);
    color pix = img.get(x, y);
    fill(pix, 128);
    angle+=angleInc;
    ellipse(x+20*sin(angle), y, pointillize, pointillize);

    xoff+=0.01;
  }
  yoff+=0.01;
}
