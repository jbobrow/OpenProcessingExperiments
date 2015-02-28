
double ar;
double bi;
double newar;
double newbi;
double p;
double ypos = 0;
double xpos = 0;
float zoom = 0.45;
double n = -0.425;
double l = -0.01;
float c = 0;
float q = 16;
boolean j = true;
int maxIterations = 150;
boolean t;
float mooX;
float mooY;
void setup () {
  size(600, 600, P2D);
  colorMode(RGB);
  textSize(13);
}
void draw() {
  for(double a = (-width/2/q); a < (width/2/q); a++) {
    for(double b = (-height/2/q); b < (height/2/q); b++) {
      ar = q*((a) / (0.5 * zoom * width) + xpos);
      bi = q*((b) / (0.5 * zoom * height*((float(width))/(float(height)))) + ypos);
      int p;
      if(j == true) {
      n = ar;
      l = bi;
      }
      n = float(mouseX-width)/400;
      l = float(mouseY-height)/400;
      for(p = 0; p < maxIterations; p++) {
        if(t==false) {
          ar = abs((float)ar);
          bi = abs((float)bi);
          double m = ar*ar+bi*bi;
          newar = ar/m;
          newbi = bi/m;
        }else{
          newar = ar*ar*ar-3*ar*bi*bi;
          newbi = 3*ar*ar*bi-bi*bi*bi;
        }
        newar += n;
        newbi += l;
        ar = newar;
        bi = newbi;
        if(ar*ar+bi*bi > 4) {
          break;
        }
      }
      stroke(3*((p+c)%255), 8*((p+c)%255), 6*((p+c)%255));
      if(p > maxIterations-1){
        stroke(255);
      }
      point(q*((float)(a+width/2/q)), q*((float)(b+height/2/q)));
    }
  }
  strokeWeight(q);
  if(keyPressed) {
  if(key=='a')
    xpos-=0.05/zoom;
  if(key=='d')
    xpos+=0.05/zoom;
  if(key=='s')
    ypos+=0.05/zoom;
  if(key=='w')
    ypos-=0.05/zoom;
  if(key=='p')
    zoom*=1.06;
  if(key=='o')
    zoom/=1.06;
  if(key=='c')
    c++;
  if(key=='u')
    saveFrame("output.png");
  }
  if(q!=1) {
    q /= 2;
  }
  mooX = mouseX;
  mooY = mouseY;
}
void mouseMoved() {
  q = 16;
}
 void keyPressed() {
   if(key=='m') {
     if(j==true) {
       j = false;
       n = xpos;
       l = ypos;
       zoom = 0.3;
     }else if(j==false) {
       j = true;
       xpos = n;
       ypos = l;
       zoom = 0.3;
     }
   }
   if(key=='t')
     t = !t;
 }

