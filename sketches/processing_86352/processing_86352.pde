
int sz=100;  //groese
float powD=1;  //pushPower

P[][] ps= new P[sz][sz];
float t1;
String rnd;

void setup() {
  stroke(255);
  size(600, 600);
  smooth();
  background(0);
  float w= width/sz;
  for (int x=0; x<sz; x++)
    for (int y=0; y<sz; y++)
      ps[x][y]= new P(w/2+w*x, w/2+w*y);
/*
  rnd= "";
  for (int i=0; i<3;i++)
    rnd+= (char)((int)random(25)+65);
  println(rnd +" heißt die serie. speichern mit s. bedienung: power: q,a ");
*/
 println(" speichern mit s. bedienung: power: q,a ");
}


void draw() {
  //background(0);
  noStroke();
  fill(0, 10);
  rect(0, 0, width, height);
  for (int x=0; x<sz; x++)
    for (int y=0; y<sz; y++) {
      ps[x][y].origion();
      ps[x][y].show();
    }
}

void mousePressed() {
  t1= millis();
}

void mouseReleased() {
  float t2= millis();
  float p= t2-t1;
  // p/= powD;
  // p= pow(p,2);
  p= sqrt(p)*powD;
  float xp= mouseX;
  float yp= mouseY;
  for (int x=0; x<sz; x++)
    for (int y=0; y<sz; y++) 
      ps[x][y].adept(xp, yp, p);
}


int No=0;

void keyPressed() {
  if (key=='q')
    powD*=1.2;
  else if (key=='a')
    powD*=0.8;
  if (powD<0.5)
    powD=0.5;
  if (key=='s') {
    save(rnd+No+".jpg");
    No++;
  }
}

class P {

  float x, y;
  float ox, oy;
  float d;
  color c= color((int) random(255), (int) random(255), (int) random(255));

  P(float t, float z) {
    ox=t;
    oy=z;
    x=ox;
    y=oy;
  }


  void adept(float xp, float yp, float p) {
    d= dist(xp, yp, x, y);
    float alph= atan2(y-yp, x-xp);
    float nx= x+(x-xp)/d*p;
    float ny= y+(y-yp)/d*p;
    x=nx-cos(alph)*d/2;
    y=ny+sin(alph)*d/2;
  }

  void origion() {
    if (ox==x && oy==y)
      return;

    float d= dist(ox, oy, x, y);
    if (d<2) {
      x=ox; 
      y=oy;
      return;
    }
    //println(d);
    x= x-((x-ox)/d);
    y= y-((y-oy)/d);
  }

  void show() {
    float d= dist(ox, oy, x, y)*4;
    //    fill(red(c),green(c),blue(c),255-d);
    fill(c);
    ellipse(x, y, 5, 5);
  }
}



