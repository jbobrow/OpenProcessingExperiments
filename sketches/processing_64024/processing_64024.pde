
//Adam Lastowka.
//zn+1 = zn^2+c
double ar;
double bi;
double newar;
double newbi;
double p;
//For the location of the icon, input these paramaters.
//double ypos =-0.92535;
//double xpos = -0.10576804;
//float zoom = 206.56265;
double ypos = 0;
double xpos = 0;
float zoom = 0.45;
double n = -0.425;//Real Part
double l = -0.01;//Imaginary Part
float c = 0;
float q = 1;
boolean j = true;
int maxIterations = 200;
boolean t;
void setup () {
  size(300, 300, P2D);
  colorMode(HSB);
  textSize(13);
}
void draw() {
  for(double a = (-width/2/q); a < (width/2/q); a++) {
    for(double b = (-height/2/q); b < (height/2/q); b++) {
      ar = ((a) / (0.5 * zoom * width) + xpos);
      bi = ((b) / (0.5 * zoom * height*((float(width))/(float(height)))) + ypos);
      int p;
      if(j == true) {
      n = ar;
      l = bi;
      }
      for(p = 0; p < maxIterations; p++) {
        if(t==false) {
          newar = (ar*ar)-(bi*bi);
          newbi = 2*ar*bi;
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
      stroke((p+c)%255, 255, 255);
      if(p > maxIterations-1){
      stroke(0);
      }
      point(q*((float)(a*q+width/2)), q*((float)(b*q+height/2)));
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
  if(key=='j')
    n-=0.02;
  if(key=='l')
    n+=0.02;
  if(key=='i')
    l+=0.02;
  if(key =='k')
    l-=0.02;
  if(key=='c')
    c++;
  if(key=='u')
    saveFrame("output.png");
  }
  stroke(50);
  fill(50);
  text("Zoom: " + zoom, 10, 20);
  if(j==true) {
  text("Position:(" + (float)xpos + ", " + (float)ypos + "i)", 10, 50);
  }else{
  text("c:(" + (float)n + ", " + (float)l + "i)", 10, 50);
  }
  noFill();
  ellipse(width/2, height/2, 50, 50);
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);
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

