
//TP4 Las Yelibis de Juan
//Variables
int n=0,t=0;
float[] rate_jbgde = new float[1000];//rate de escala
float[] rate_threshold = new float[1000];
float[] angulo = new float[1000];
int[] cualjb = new int[1000];
int[] heightjb = new int[1000];
int[] widthjb = new int[1000];
//colores fondo
color fondo1 = color(220, 243, 235, 255);
color fondo2 = color(random(220, 255), random(220, 255), random(220, 255));
//colores jb
color jbgde1_1[] = new color[1000];
color jbgde1_2[] = new color[1000];
color jbgde2_1[] = new color[1000];
color jbgde2_2[] = new color[1000];
color jbgde3_1[] = new color[1000];
color jbgde3_2[] = new color[1000];
color jbgde4_1[] = new color[1000];
color jbgde4_2[] = new color[1000];
//colores sombras
color sombra1 = color (101, 255, 175);
color sombra2 = color (61, 249, 204);
color sombra3 = color (84, 204, 173);
 
void nueva_jellybean() {
  //fondo1=int(random(fondo2));
  rate_jbgde[n]=0;
  rate_threshold[n]=random(0, 1);
  heightjb[n] = int(random(height/6, 5*height/6+1));
  widthjb[n] = int(random(width/6, 5*width/6+1));
  jbgde1_1[n] = color (255, 95+random(-101, 100), 197+random(-150, 50));
  jbgde1_2[n] = color (33+random(-50, 50), 187+random(-100, 5), 215);
  jbgde2_1[n] = color (255, 208+random(-90, 50), 40+random(-5, 150));
  jbgde2_2[n] = color (255, 193+random(-50, -100), 104+random(-100, 150));
  jbgde3_1[n] = color (255, 95+random(-50, 50), 197+random(-150, 50));
  jbgde3_2[n] = color (33+random(-5, 50), 187+random(-50, 5), 215);
  jbgde4_1[n] = color (255, 208+random(-150, 50), 40+random(-5, 150));
  jbgde4_2[n] = color (255, 193+random(-50, -100), 104+random(-50, 150));
  angulo[n] = random(0, 2*PI);
  cualjb[n] = int(random(4));
  n++;
}
void r() { if(t>600) return int(random(-10,10)); else return 0; }
 
void setup() {
  size(1000, 600);
  background(220, 243, 235);
  nueva_jellybean();
}
void draw() {
  t++; t%=800;
  //Fondo inicial
  noStroke();
  if(t>600 && t%4==0) fondo1 = color(255-red(fondo1),255-green(fondo1),255-blue(fondo1));
  fill(fondo1);

  rect(0, 0, 1000, 600);
 
  for (int i=0;i<n;i++) {
    pushMatrix();
    translate(widthjb[i], heightjb[i]);// Translada
    rotate(angulo[i]); //rotar angulo
    scale(rate_jbgde[i]);//agranda a escala por porcentaje: (1.0 = 100%)
 
 
    if (mouseX < 250) { //Si mouse posición X mayor a 250 cambian colores
      if (cualjb[i]==0) {
        noFill();//jellybean grande_1
        strokeWeight(80);
        stroke(sombra2);//sombra
        bezier(154+r(), 110+r(), 104+r(), 138+r(), 44+r(), 189+r(), 15+r(), 230+r());
        stroke(jbgde1_1[i]);
        bezier(154-25+r(), 110-5+r(), 104-25+r(), 138-5+r(), 44-25+r(), 189-5+r(), 15-25+r(), 230-5+r());
      }
      else if (cualjb[i]==1) {
        noFill();//jellybean grande_2
        strokeWeight(70);
        stroke(sombra1);//sombra
        bezier(330+r(), 100+r(), 280+r(), 135+r(), 230+r(), 315+r(), 192+r(), 350+r());
        stroke(jbgde2_1[i]);
        bezier(330-15+r(), 100-15+r(), 280-15+r(), 135-15+r(), 230-15+r(), 315-15+r(), 192-15+r(), 350-15+r());
      }
      else if (cualjb[i]==2) {
        noFill();//jellybean grande_3
        strokeWeight(50);
        stroke(sombra1);//sombra
        bezier(450+r(), 220+r(), 500+r(), 270+r(), 515+r(), 370+r(), 460+r(), 420+r());
        stroke(jbgde3_1[i]);
        bezier(450-15+r(), 220+15+r(), 500-15+r(), 270+15+r(), 515-15+r(), 370+15+r(), 460-35+r(), 420+15+r());
      }
      else if (cualjb[i]==3) {
        noFill();//jellybean grande_4
        strokeWeight(80);
        stroke(sombra1);//sombra
        bezier(651+r(), 331+r(), 688+r(), 367+r(), 745+r(), 429+r(), 769+r(), 459+r());
        stroke(jbgde4_1[i]);
        bezier(651-20+r(), 331+r(), 688-20+r(), 367+r(), 745-20+r(), 429+r(), 769-20+r(), 459+r());
      }
    }
    else {
      if (cualjb[i]==0) {
        noFill();//jellybean grande_1
        strokeWeight(80);
        stroke(sombra2);//sombra
        bezier(154, 110, 104, 138, 44, 189, 15, 230);
        stroke(jbgde1_2[i]);
        bezier(154-25, 110-5, 104-25, 138-5, 44-25, 189-5, 15-25, 230-5);
      }
      else if (cualjb[i]==1) {
        noFill();//jellybean grande_2
        strokeWeight(70);
        stroke(sombra1);//sombra
        bezier(330, 100, 280, 135, 230, 315, 192, 350);
        stroke(jbgde2_2[i]);
        bezier(330-15, 100-15, 280-15, 135-15, 230-15, 315-15, 192-15, 350-15);
      }
      else if (cualjb[i]==2) {
        noFill();//jellybean grande_3
        strokeWeight(50);
        stroke(sombra1);//sombra
        bezier(450, 220, 500, 270, 515, 370, 460, 420);
        stroke(jbgde3_2[i]);
        bezier(450-15, 220+15, 500-15, 270+15, 515-15, 370+15, 460-35, 420+15);
      }
      else if (cualjb[i]==3) {
        noFill();//jellybean grande_4
        strokeWeight(80);
        stroke(sombra1);//sombra
        bezier(651, 331, 688, 367, 745, 429, 769, 459);
        stroke(jbgde4_2[i]);
        bezier(651-20, 331, 688-20, 367, 745-20, 429, 769-20, 459);
      }
    }
 
    popMatrix();
 
    rate_jbgde[i]+=0.005;// Agrandar en < escala
    if (i==n-1 && rate_jbgde[i] > rate_threshold[i] && i < 999) {
      fondo1=color(random(128)+128,random(128)+128,random(128)+128);
      nueva_jellybean();
    }
    if (rate_jbgde[i] > 2) {// rate = 0
      rate_jbgde[i] = 0;
    }
  }
}
 
void keyPressed() {
  if (key == ' ') {
    save("Yelibin - "+day()+"."+month()+"."+year()+"_"+hour()+"."+minute()+"."+second()+".jpeg");
  }
}
