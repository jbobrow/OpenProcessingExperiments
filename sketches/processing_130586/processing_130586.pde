
int a = 300;      //integer values
int b = 200;
int c = 100;
int d = 50;
int e = 350;
int f = 2;
int h = 0;
int g = 450;
int i = 500;
int l = 75;
int m = 25;
float x = 256;    //float value

void setup() {
  size(500,500);     //background size
  frameRate(f);      //animation speed
}

void draw() {
  background((random (x)), (random(x)), (random(x)));  //background color and change
  
  ellipse((random(a)), (random(a)), c, c);  //ellipse size and location
  fill(b,h,h);
  
  strokeWeight(10);    //thickness of stroke
  line((random(b)), d, (random(b)), c);    //line size and location
  stroke(0);           //color of stroke
  
  ellipse((random(g)), (random(g)), d, d);
  fill(h,h,b);
  
  ellipse((random (i)), (random(i)), l, l);
  fill(c,c,c);
  
  ellipse((random(l)), (random(c)), d, d);
  fill(h,b,h);
  
  ellipse((random(a)), (random(i)), m, m);
  fill(l,m,l);
  
  line((random(g)), l, (random(g)), g);
  
  line((random(e)), m, (random(e)), b);
  
  line((random(d)), c, (random(d)), m);
  
  line((random(h)), a, (random(i)), l);
}

