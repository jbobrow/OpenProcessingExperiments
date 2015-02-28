
//Variables
int x1,y1,xfin,yfin,xz1,yz1,xz2,yz2,n=0,t=0;
float[] rate_jbgde = new float[1000];//rate de escala
float[] angle = new float[1000];
int[] which_one = new int[1000];
color fondo1 = color(220, 243, 235, 255);
color fondo2 = color(random(100, 255), random(200, 255), random(200, 255));
color jbgde1_1[] = new color[1000];
color jbgde1_2[] = new color[1000];
color jbgde2_1[] = new color[1000];
color jbgde2_2[] = new color[1000];
void setup() {
  size(700, 500);
  background(220, 243, 235);
  smooth();
  noStroke();
}
void draw() {
  //Fondo inicial
  if (mousePressed==true) { // if mouse Pressed,all rectangles will be erase.
    fondo1=int(random(fondo2));
  }
  if(mouseX > 250) { if(t==0) fondo1 = inv(fondo1); t++; t%=5; }
  noStroke();
  fill(fondo1);
  rect(0, 0, 700, 500);
  for(int i=0;i<n;i++) {
      pushMatrix();
      // Transladar a la esquina izq sup
      translate(width/2, height/2);
      rotate(angle[i]);
      //agrandar a escala por porcentaje: (1.0 = 100%)
      scale(rate_jbgde[i]);
      if(which_one[i]==0) {
      if (mouseX < 250) { //Si mouse posición X mayor a 250
        //jellybean grande sombra simple
        noFill();
        strokeWeight(70);
        stroke(101, 255, 175);
        bezier(330, 100, 280, 135, 230, 315, 192, 350);
        //jellybean grande
        stroke(jbgde1_1[i]);
        bezier(330-15, 100-15, 280-15, 135-15, 230-15, 315-15, 192-15, 350-15);
      }
      else {
        //jellybean grande sombra simple
        noFill();
        strokeWeight(70);
        stroke(101, 255, 175);
        bezier(330+R(10), 100+R(10), 280+R(10), 135+R(10), 230+R(10), 315+R(10), 192+R(10), 350+R(10));
        //jellybean grande
        stroke(jbgde1_2[i]);
        bezier(330-15+R(10), 100-15+R(10), 280-15+R(10), 135-15+R(10), 230-15+R(10), 315-15+R(10), 192-15+R(10), 350-15+R(10));
      }
      } else {
      if (mouseX < 250) { //Si mouse posición X mayor a 250
        //jellybean grande sombra simple
        noFill();
        strokeWeight(50);
        stroke(101, 255, 175);
        bezier(450, 220, 500, 270, 515, 370, 460, 420);
        //jellybean grande
        stroke(jbgde2_1[i]);
        bezier(450-15, 220+15, 500-15, 270+15, 515-15, 370+15, 460-35, 420+15);
      }
      else {
        //jellybean grande sombra simple
        noFill();
        strokeWeight(50);
        stroke(101, 255, 175);
        bezier(450+R(10), 220+R(10), 500+R(10), 270+R(10), 515+R(10), 370+R(10), 460+R(10), 420+R(10));
        //jellybean grande
        stroke(jbgde2_2[i]);
        bezier(450-15+R(10), 220+15+R(10), 500-15+R(10), 270+15+R(10), 515-15+R(10), 370+15+R(10), 460-35+R(10), 420+15+R(10));
      }
      }
      // Increase the scale variable
      rate_jbgde[i]+=0.01;
      // Retstart r
      if (rate_jbgde[i] > 2) {
        rate_jbgde[i] = 0;
      }
      popMatrix();
  }
}
void keyPressed() {
  if (key == ' ') {
    save("Yelibin - "+day()+"."+month()+"."+year()+"_"+hour()+"."+minute()+"."+second()+".jpeg");
}
}
void mouseClicked() {
  rate_jbgde[n]=0;
  jbgde1_1[n] = color (r(255), r(255), r(255));
  jbgde1_2[n] = color (r(255), r(255), r(255));
  jbgde2_1[n] = color (r(255), r(255), r(255));
  jbgde2_2[n] = color (r(255), r(255), r(255));
  angle[n] = random(0,2*PI);
  which_one[n] = round(random(0,1));
  n++;
}
int r(int n) { return int(round(random(0,n))); }
int R(int n) { return int(round(random(-n,n))); }
color inv(color c) { return color(255-red(c),255-green(c),255-blue(c)); }
