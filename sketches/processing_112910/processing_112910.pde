
//TP4 - Yelibins para Juan bajo la lluvia - Paula MALLOL

//Variables
int n=0; 
float[] rate_jbgde = new float[1000];//rate de escala
float[] rate_threshold = new float[1000];//rate comienzo
float[] angulo = new float[1000];
int[] cualjb = new int[1000];
int[] heightjb = new int[1000];
int[] widthjb = new int[1000];
//color fondo
color fondo1 = color(220, 243, 235, 255);
//colores jb grandes
color jbgde1_1[] = new color[1000];
color jbgde1_2[] = new color[1000];
color jbgde2_1[] = new color[1000];
color jbgde2_2[] = new color[1000];
color jbgde3_1[] = new color[1000];
color jbgde3_2[] = new color[1000];
color jbgde4_1[] = new color[1000];
color jbgde4_2[] = new color[1000];
//colores jb medianas
color jbmed1_1[] = new color[1000];
color jbmed1_2[] = new color[1000];
color jbmed2_1[] = new color[1000];
color jbmed2_2[] = new color[1000];
color jbmed3_1[] = new color[1000];
color jbmed3_2[] = new color[1000];
color jbmed4_1[] = new color[1000];
color jbmed4_2[] = new color[1000];
color jbmed5_1[] = new color[1000];
color jbmed5_2[] = new color[1000];
//colores jb chicas
color jbchi1_1[] = new color[1000];
color jbchi1_2[] = new color[1000];
color jbchi2_1[] = new color[1000];
color jbchi2_2[] = new color[1000];
color jbchi3_1[] = new color[1000];
color jbchi3_2[] = new color[1000];
color jbchi4_1[] = new color[1000];
color jbchi4_2[] = new color[1000];
color jbchi5_1[] = new color[1000];
color jbchi5_2[] = new color[1000];
color jbchi6_1[] = new color[1000];
color jbchi6_2[] = new color[1000];
color jbchi7_1[] = new color[1000];
color jbchi7_2[] = new color[1000];
//colores sombras
color sombra1 = color (101, 255, 175);
color sombra2 = color (61, 249, 204);
color sombra3 = color (84, 204, 173);
//gotas
gotas[] gotas = new gotas[10000];//cant de gotas que llega antes reiniciar
int totalGotas = 0;//


void nueva_jellybean() {
  //fondo1=int(random(fondo2));
  rate_jbgde[n]=0;
  rate_threshold[n]=random(0, 1);
  heightjb[n] = int(random(height/6, 5*height/6+1));
  widthjb[n] = int(random(width/6, 5*width/6+1));
  //color grandes
  jbgde1_1[n] = color (255, 210+random(-50, 50), 255);
  jbgde1_2[n] = color (0+random(0, 255));
  jbgde2_1[n] = color (33+random(-50, 50), 187, 215);
  jbgde2_2[n] = color (0+random(0, 255));
  jbgde3_1[n] = color (255, 193, 104+random(-50, 50));
  jbgde3_2[n] = color (0+random(0, 255));
  jbgde4_1[n] = color (0+random(-50, 50), 237, 255);
  jbgde4_2[n] = color (0+random(0, 255));
  //color medianas
  jbmed1_2[n] = color (0+random(0, 200));
  jbmed1_2[n] = color (0+random(0, 255));
  jbmed2_1[n] = color (249, 142, 112+random(-50, 50));
  jbmed2_2[n] = color (0+random(0, 255));
  jbmed3_1[n] = color (255+random(0, -200));
  jbmed3_2[n] = color (0+random(0, 255));
  jbmed4_1[n] = color (177+random(-50, 50), 216, 252);
  jbmed4_2[n] = color (0+random(0, 255));
  jbmed5_1[n] = color (249, 247, 178+random(-50, 50));
  jbmed5_2[n] = color (0+random(0, 255));
  //color chicas
  jbchi1_1[n] = color (249, 133+random(-50, 50), 163);
  jbchi1_2[n] = color (0+random(0, 255));
  jbchi2_1[n] = color (249, 231, 175+random(-50, 50));
  jbchi2_2[n] = color (0+random(0, 255));
  jbchi3_1[n] = color (232, 232+random(-50, 50), 232);
  jbchi3_2[n] = color (0+random(0, 255));
  jbchi4_1[n] = color (230, 155+random(-50, 50), 249);
  jbchi4_2[n] = color (0+random(0, 255));
  jbchi5_1[n] = color (0+random(0, 200));
  jbchi5_2[n] = color (0+random(0, 255));
  jbchi6_1[n] = color (190, 191+random(-50, 50), 191);
  jbchi6_2[n] = color (0+random(0, 255));
  jbchi7_1[n] = color (192+random(-50, 50), 255, 243);
  jbchi7_2[n] = color (0+random(0, 255));
  //
  angulo[n] = random(0, 2*PI);
  cualjb[n] = int(random(16));
  n++;
}


void setup() {
  size(1000, 600);
  background(220, 243, 235);
  nueva_jellybean();

}


void draw() {
  //Fondo inicial
  noStroke();
  fill(fondo1);
  rect(0, 0, 1000, 600);
  
  if ((mouseX>= 955 && mouseY>=10 && mouseX<=990 && mouseY<=37)) {
    gotas[totalGotas] = new gotas();// empezar con 1
    totalGotas++ ;// incremento de gotas
    if (totalGotas >= gotas.length) {
      totalGotas = 0; //vuelve a 0
    }
    for (int g = 0; g < totalGotas; g++ ) {
      gotas[g].caer();
      gotas[g].lluvia();
    }
  }

  for (int i=0;i<n;i++) {
    //nube
    noStroke();
    fill(190);
    ellipse(968, 18, 15, 15);
    //fill(195);
    ellipse(978, 18, 15, 15);
    //fill(205);
    ellipse(962, 25, 15, 15);
    //fill(210);
    ellipse(982, 25, 15, 15);
    //fill(200);
    ellipse(972, 29, 15, 15);

    pushMatrix();
    translate(widthjb[i], heightjb[i]);// Translada 
    rotate(angulo[i]); //rotar angulo
    scale(rate_jbgde[i]);//agranda a escala por porcentaje: (1.0 = 100%)

    if (!(mouseX>= 955 && mouseY>=10 && mouseX<=990 && mouseY<=37)) { //Si mouse posición X 
      if (cualjb[i]==0) {
        noFill();//jellybean grande_1
        strokeWeight(80);
        stroke(sombra2);//sombra
        bezier(154, 110, 104, 138, 44, 189, 15, 230);
        stroke(jbgde1_1[i]);
        bezier(154-25, 110-5, 104-25, 138-5, 44-25, 189-5, 15-25, 230-5);
      } 
      else if (cualjb[i]==1) {
        noFill();//jellybean grande_2
        strokeWeight(70);
        stroke(sombra1);//sombra
        bezier(330, 100, 280, 135, 230, 315, 192, 350);
        stroke(jbgde2_1[i]);
        bezier(330-15, 100-15, 280-15, 135-15, 230-15, 315-15, 192-15, 350-15);
      } 
      else if (cualjb[i]==2) {
        noFill();//jellybean grande_3
        strokeWeight(50);
        stroke(sombra1);//sombra
        bezier(450, 220, 500, 270, 515, 370, 460, 420);
        stroke(jbgde3_1[i]);
        bezier(450-15, 220+15, 500-15, 270+15, 515-15, 370+15, 460-35, 420+15);
      } 
      else if (cualjb[i]==3) {
        noFill();//jellybean grande_4
        strokeWeight(80);
        stroke(sombra1);//sombra
        bezier(651, 331, 688, 367, 745, 429, 769, 459);
        stroke(jbgde4_1[i]);
        bezier(651-20, 331, 688-20, 367, 745-20, 429, 769-20, 459);
      }
      else if (cualjb[i]==4) {
        noFill();//jellybean mediana_1
        strokeWeight(40);
        stroke(sombra3);//sombra
        bezier(-40, -25, -5, 2, 22, 2, 36, 21);
        stroke(jbmed1_1[i]);
        bezier(-40+5, -25+20, -5+5, 2+20, 22+5, 2+20, 36+5, 21+20);
      }
      else if (cualjb[i]==5) {
        noFill();//jellybean mediana_2
        strokeWeight(40);
        stroke(sombra1);//sombra
        bezier(91, 70, 135, 96, 119, 142, 160, 155);
        stroke(jbmed2_1[i]);
        bezier(91+8, 70-10, 135+8, 96-10, 119+8, 142-10, 160+8, 155-10);
      }
      else if (cualjb[i]==6) {
        noFill();//jellybean mediana_3 
        strokeWeight(40);
        stroke(sombra1);//sombra
        bezier(87, 444, 85, 474, 189, 474, 184, 520);
        stroke(jbmed3_1[i]);
        bezier(87-15, 444+2, 85-15, 474+2, 189-15, 474+2, 184-15, 520+2);
      }
      else if (cualjb[i]==7) {
        noFill();//jellybean mediana_4
        strokeWeight(40);
        stroke(sombra2);//sombra
        bezier(325, 409, 290, 476, 375, 507, 364, 548);
        stroke(jbmed4_1[i]);
        bezier(325-30, 409-2, 290-30, 476-2, 375-30, 507-2, 364-30, 548-2);
      }
      else if (cualjb[i]==8) {
        noFill();//jellybean mediana_5
        strokeWeight(50);
        stroke(sombra3);//sombra
        bezier(571, 21, 616, 50, 541, 131, 583, 153);
        stroke(jbmed5_1[i]);
        bezier(571+25, 21-5, 616+25, 50-5, 541+25, 131-5, 583+25, 153-5);
      }
      else if (cualjb[i]==9) {
        noFill();//jellybean chica_1
        strokeWeight(25);
        stroke(sombra1);//sombra
        bezier(28, 370, 24, 398, -24, 416, -29, 439);
        stroke(jbchi1_1[i]);
        bezier(28+5, 370-20, 24+5, 398-20, -24+5, 416-20, -29+5, 439-20);
      } 
      else if (cualjb[i]==10) {
        noFill();//jellybean chica_2
        strokeWeight(40);
        stroke(sombra1);//sombra
        bezier(228, -3, 245, 14, 244, 40, 227, 60);
        stroke(jbchi2_1[i]);
        bezier(228-10, -3+20, 245-10, 14+20, 244-10, 40+20, 227-10, 60+20);
      }
      else if (cualjb[i]==11) {
        noFill();//jellybean chica_3
        strokeWeight(40);
        stroke(sombra3);//sombra
        bezier(390, 302, 397, 321, 354, 315, 356, 339);
        stroke(jbchi3_1[i]);
        bezier(390-10, 302-5, 397-10, 321-5, 354-10, 315-5, 356-10, 339-5);
      }
      else if (cualjb[i]==12) {
        noFill();//jellybean chica_4
        strokeWeight(40);
        stroke(sombra1);//sombra
        bezier(465, 20, 453, 33, 458, 83, 448, 81);
        stroke(jbchi4_1[i]);
        bezier(465+15, 20-3, 453+15, 33-3, 458+15, 83-3, 448+15, 81-3);
      }
      else if (cualjb[i]==13) {
        noFill();//jellybean chica_5
        strokeWeight(40);
        stroke(sombra1);//sombra
        bezier(525, 238, 530, 240, 507, 271, 495, 270);
        stroke(jbchi5_1[i]);
        bezier(525-15, 238-5, 530-15, 240-5, 507-15, 271-5, 495-15, 270-5);
      }
      else if (cualjb[i]==14) {
        noFill();//jellybean chica_6
        strokeWeight(40);
        stroke(sombra1);//sombra
        bezier(587, 422, 605, 440, 580, 475, 598, 494);
        stroke(jbchi6_1[i]);
        bezier(587-30, 422-2, 605-30, 440-2, 580-30, 475-2, 598-30, 494-2);
      }
      else if (cualjb[i]==15) {
        noFill();//jellybean chica_7
        strokeWeight(40);
        stroke(sombra2);//sombra
        bezier(645, 159, 642, 167, 649, 196, 659, 207);
        stroke(jbchi7_1[i]);
        bezier(645-5, 159+10, 642-5, 167+10, 649-5, 196+10, 659-5, 207+10);
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
      else if (cualjb[i]==4) {
        noFill();//jellybean mediana_1
        strokeWeight(40);
        stroke(sombra3);//sombra
        bezier(-40, -25, -5, 2, 22, 2, 36, 21);
        stroke(jbmed1_2[i]);
        bezier(-40+5, -25+20, -5+5, 2+20, 22+5, 2+20, 36+5, 21+20);
      }
      else if (cualjb[i]==5) {
        noFill();//jellybean mediana_2
        strokeWeight(40);
        stroke(sombra1);//sombra
        bezier(91, 70, 135, 96, 119, 142, 160, 155);
        stroke(jbmed2_2[i]);
        bezier(91+8, 70-10, 135+8, 96-10, 119+8, 142-10, 160+8, 155-10);
      }
      else if (cualjb[i]==6) {
        noFill();//jellybean mediana_3 
        strokeWeight(40);
        stroke(sombra1);//sombra
        bezier(87, 444, 85, 474, 189, 474, 184, 520);
        stroke(jbmed3_2[i]);
        bezier(87-15, 444+2, 85-15, 474+2, 189-15, 474+2, 184-15, 520+2);
      }
      else if (cualjb[i]==7) {
        noFill();//jellybean mediana_4
        strokeWeight(40);
        stroke(sombra2);//sombra
        bezier(325, 409, 290, 476, 375, 507, 364, 548);
        stroke(jbmed4_2[i]);
        bezier(325-30, 409-2, 290-30, 476-2, 375-30, 507-2, 364-30, 548-2);
      }
      else if (cualjb[i]==8) {
        noFill();//jellybean mediana_5
        strokeWeight(50);
        stroke(sombra3);//sombra
        bezier(571, 21, 616, 50, 541, 131, 583, 153);
        stroke(jbmed5_2[i]);
        bezier(571+25, 21-5, 616+25, 50-5, 541+25, 131-5, 583+25, 153-5);
      }
      else if (cualjb[i]==9) {
        noFill();//jellybean chica_1
        strokeWeight(25);
        stroke(sombra1);//sombra
        bezier(28, 370, 24, 398, -24, 416, -29, 439);
        stroke(jbchi1_2[i]);
        bezier(28+5, 370-20, 24+5, 398-20, -24+5, 416-20, -29+5, 439-20);
      } 
      else if (cualjb[i]==10) {
        noFill();//jellybean chica_2
        strokeWeight(40);
        stroke(sombra1);//sombra
        bezier(228, -3, 245, 14, 244, 40, 227, 60);
        stroke(jbchi2_2[i]);
        bezier(228-10, -3+20, 245-10, 14+20, 244-10, 40+20, 227-10, 60+20);
      }
      else if (cualjb[i]==11) {
        noFill();//jellybean chica_3
        strokeWeight(40);
        stroke(sombra3);//sombra
        bezier(390, 302, 397, 321, 354, 315, 356, 339);
        stroke(jbchi3_2[i]);
        bezier(390-10, 302-5, 397-10, 321-5, 354-10, 315-5, 356-10, 339-5);
      }
      else if (cualjb[i]==12) {
        noFill();//jellybean chica_4
        strokeWeight(40);
        stroke(sombra1);//sombra
        bezier(465, 20, 453, 33, 458, 83, 448, 81);
        stroke(jbchi4_2[i]);
        bezier(465+15, 20-3, 453+15, 33-3, 458+15, 83-3, 448+15, 81-3);
      }
      else if (cualjb[i]==13) {
        noFill();//jellybean chica_5
        strokeWeight(40);
        stroke(sombra1);//sombra
        bezier(525, 238, 530, 240, 507, 271, 495, 270);
        stroke(jbchi5_2[i]);
        bezier(525-15, 238-5, 530-15, 240-5, 507-15, 271-5, 495-15, 270-5);
      }
      else if (cualjb[i]==14) {
        noFill();//jellybean chica_6
        strokeWeight(40);
        stroke(sombra1);//sombra
        bezier(587, 422, 605, 440, 580, 475, 598, 494);
        stroke(jbchi6_2[i]);
        bezier(587-30, 422-2, 605-30, 440-2, 580-30, 475-2, 598-30, 494-2);
      }
      else if (cualjb[i]==15) {
        noFill();//jellybean chica_7
        strokeWeight(40);
        stroke(sombra2);//sombra
        bezier(645, 159, 642, 167, 649, 196, 659, 207);
        stroke(jbchi7_2[i]);
        bezier(645-5, 159+10, 642-5, 167+10, 649-5, 196+10, 659-5, 207+10);
      }
    }
    popMatrix();

    rate_jbgde[i]+=0.005;// Agrandar en < escala
    if (i==n-1 && rate_jbgde[i] > rate_threshold[i] && i < 999) {
      fondo1=color(random(128)+128, random(128)+128, random(128)+128);
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

//lluvia
class gotas {
  float pX,pY; 
  float speed;
  float radio;
  color agua;

  gotas() {
    radio = random(4,7);
    pX = random(width);
    pY = -radio*4;//empieza arriba de pY=0
    speed = random(1,5);
    agua = color (33+random(-200, 100), 187+random(-50, +100), 255,100); 
  }

  void caer() {
    pY += speed; //se acelera mientras cae
  }
  void lluvia() {
    fill(agua);
    noStroke();
    for (int j = 2; j < radio; j++ ) {
      ellipse(pX,pY+j*4,j,j);
    }
  }
}


