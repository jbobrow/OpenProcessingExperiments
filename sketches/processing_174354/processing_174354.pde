
PImage webImg;
PImage webmg;
float i=500;
   float l=203;
    float m=187;
int z = (int)random(0, -10000);
void catmullRom (float x1, float y1, float x2, float y2,
 float x3, float y3, float x4, float y4) { // equivalent to Processing curve() function
 beginShape();
 for (float t=0; t<=1; t+=0.02) {
 float t2 = t*t;
 float t3 = t2*t;
 float x= (-.5*x1 + 1.5*x2 -1.5*x3 + .5*x4)*t3 + (x1 -2.5*x2 +2*x3 -.5*x4)*t2 + (-.5*x1 + .5*x3)*t + x2;
 float y= (-.5*y1 + 1.5*y2 -1.5*y3 + .5*y4)*t3 + (y1 -2.5*y2 +2*y3 -.5*y4)*t2 + (-.5*y1 + .5*y3)*t + y2;
 vertex(x, y);
 }
 endShape();
}
void setup() {
  size(600,600,P3D);
  String url = "http://postfiles1.naver.net/20141202_208/golrom0914_1417531290814xBVAW_PNG/%A4%A7%A4%A1.png?type=w2";
  // Load image from a web server
  webImg = loadImage(url, "png");
  String urrl = "http://postfiles9.naver.net/20141203_264/golrom0914_1417532464172ut8dQ_PNG/fist.png?type=w2";
  // Load image from a web server
  webmg = loadImage(urrl, "png");
}
void move() {
 z += 1;
 }

void draw() {

  background(255);

     strokeWeight(50);
     strokeCap(ROUND);


stroke(236,180,131);
 strokeWeight(20);

 catmullRom(0, 0, width/2.31, height/1.34, i, 0, width-100, 300 );
 i--;
 ellipse( i, 0,20,20);
 //catmullRom(100, 300, mouseX, mouseY, width-100, 300, width, 0);
 imageMode(CENTER);
  image(webImg, width/2, height); 
  if(i <=-60){
 
float k=1;

     background(255);
     translate(0,0,k);
    image(webImg, width/2, height); 
    image(webmg, width/2.4, height/1.4,l,m);

l+=5;
m+=5;
   
}

  if(keyPressed){
     float l=203;
    float m=187;
  }
}
