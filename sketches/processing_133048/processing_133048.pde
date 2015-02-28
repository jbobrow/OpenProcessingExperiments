
float myPerlin;
float c=0;
float d=0;
float e=0;
//float x=0;
float y=0;
float randPerl;
float count=0;
float  mapHeight;

void setup() {
  background(#ffffff);
  size(800, 300);
  noFill();
  mapHeight=height;

}

void draw() {
  changeColor();
  changePerlin();
  paint();
  count++;
  mapHeight=mapHeight-1;
//  if (mapHeight==0) {
//    noLoop();
//  }
  println(mapHeight);
}



void changeColor() {
  
  c = sin(radians(count))+1;
  d = sin(radians(count+60))+1;
  e = sin(radians(count+120))+1;
  c = map(c,0,1,0,255);
  d = map(d,0,1,0,255);
  e = map(e,0,1,0,255);
  println(c,d,e);
  stroke(c,d,220);
//  if (c>255) {
//    noLoop();
//  }
}
void paint() {
  for (int x=0; x<width; x=x+1) {
    myPerlin = noise(float(x)/200,count/200);
    float myY = map(myPerlin, 0, 1, 0, height-mapHeight);
    line(x, myY, x,height );
  }
 
}

void changePerlin() {
//  randPerl = random(0,110);
  myPerlin = noise(count);
//  println(myPerlin);

}




