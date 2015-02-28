
//Variables
int n=0;
float[] rate_jbgde = new float[1000];//rate de escala
float[] rate_threshold = new float[1000];
float[] angulo = new float[1000];
int[] cualjb = new int[1000];
color fondo1 = color(220, 243, 235, 255);
color fondo2 = color(random(100, 255), random(200, 255), random(200, 255));
color jbgde1_1[] = new color[1000];
color jbgde1_2[] = new color[1000];
color jbgde2_1[] = new color[1000];
color jbgde2_2[] = new color[1000];
void setup() {
  size(700, 500);
  background(220, 243, 235);
  
  fondo1=int(random(fondo2));
  rate_jbgde[n]=0;
  rate_threshold[n]=random(1,2);
  jbgde1_1[n] = color (255, 95+random(-50, 50), 197+random(-150, 50));
  jbgde1_2[n] = color (33+random(-5, 50), 187+random(-50, 5), 215);
  jbgde2_1[n] = color (255, 208+random(-150, 50), 40+random(-5, 150));
  jbgde2_2[n] = color (255, 193, 104);
  angulo[n] = random(0, 2*PI);
  cualjb[n] = round(random(0, 1));
  n++;
}
void draw() {
  //Fondo inicial
  noStroke();
  fill(fondo1);
  rect(0, 0, 700, 500);
  //Fondo random
  /*if (mousePressed==true) { // if mouse Pressed,all rectangles will be erase.
   fondo1=int(random(fondo2));
   }*/
  for (int i=0;i<n;i++) {
    pushMatrix();
    translate(width/2, height/2);// Translada al medio
    rotate(angulo[i]); //rotar angulo
    scale(rate_jbgde[i]);//agranda a escala por porcentaje: (1.0 = 100%)
    //if (cualjb[i]==0) {
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
        bezier(330, 100, 280, 135, 230, 315, 192, 350);
        //jellybean grande
        stroke(jbgde1_2[i]);
        bezier(330-15, 100-15, 280-15, 135-15, 230-15, 315-15, 192-15, 350-15);
      }
      
    //} 
    /*else {
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
     bezier(450, 220, 500, 270, 515, 370, 460, 420);
     //jellybean grande
     stroke(jbgde2_2[i]);
     bezier(450-15, 220+15, 500-15, 270+15, 515-15, 370+15, 460-35, 420+15);
     }*/

    popMatrix();
    
    rate_jbgde[i]+=0.01;// Agrandar en > escala
    if(i==n-1 && rate_jbgde[i] > rate_threshold[i] && i < 999) {
    
      fondo1=int(random(fondo2));
      rate_jbgde[n]=0;
      rate_threshold[n]=random(0,1.5);
      jbgde1_1[n] = color (255, 95+random(-50, 50), 197+random(-150, 50));
      jbgde1_2[n] = color (33+random(-5, 50), 187+random(-50, 5), 215);
      jbgde2_1[n] = color (255, 208+random(-150, 50), 40+random(-5, 150));
      jbgde2_2[n] = color (255, 193, 104);
      angulo[n] = random(0, 2*PI);
      //cualjb[n] = round(random(0, 1));
      n++;
      
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
/*void mouseClicked() {
 fondo1=int(random(fondo2));
 rate_jbgde[n]=0;
 jbgde1_1[n] = color (255, 95+random(-50, 50), 197+random(-150, 50));
 jbgde1_2[n] = color (33+random(-5, 50), 187+random(-50, 5), 215);
 jbgde2_1[n] = color (255, 208+random(-150, 50), 40+random(-5, 150));
 jbgde2_2[n] = color (255, 193, 104);
 angulo[n] = random(0, 2*PI);
 cualjb[n] = round(random(0, 1));
 n++;
 }*/
