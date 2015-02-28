
//Yelibins - Paula Mallol
 
//Variables
//color fondo
color fondo1 = color(220, 243, 235, 255);
color fondo2 = color(random(128)+128, random(128)+128, random(128)+128);
//colores jellybeans
color jbgde1_1 = color (255, 210+random(-50, 50), 255);
color jbgde2_1 = color (33+random(-50, 50), 187, 215);
color jbgde3_1 = color (255, 193, 104+random(-50, 50));
color jbgde4_1 = color (0+random(-50, 50), 237, 255);
 
color jbmed1_1 = color (0+random(0, 200));
color jbmed2_1 = color (249, 142, 112+random(-50, 50));
color jbmed3_1 = color (255+random(0, -200));
color jbmed4_1 = color (177+random(-50, 50), 216, 252);
color jbmed5_1 = color (249, 247, 178+random(-50, 50));
 
color jbchi1_1 = color (249, 133+random(-50, 50), 163);
color jbchi2_1 = color (249, 231, 175+random(-50, 50));
color jbchi3_1 = color (232, 232+random(-50, 50), 232);
color jbchi4_1 = color (230, 155+random(-50, 50), 249);
color jbchi5_1 = color (0+random(0, 200));
color jbchi6_1 = color (190, 191+random(-50, 50), 191);
color jbchi7_1 = color (192+random(-50, 50), 255, 243);
 
//colores sombras
color sombra1 = color (101, 255, 175);
color sombra2 = color (61, 249, 204);
color sombra3 = color (84, 204, 173);
 
void setup() {
  size(700, 500);
  background(220, 243, 235);
}
 
void draw() {
  //Fondo inicial
  noStroke();
  fill(fondo1);
  rect(0, 0, 700, 500);
  //Fondo random
  if (mousePressed==true) { // fondo cambia con click
    fondo1=int(random(fondo2));
  }
  //Jelly Beans
  //Grandes - arriba izq > abajo der
  noFill();//jellybean grande_1
  strokeWeight(80);
  stroke(sombra2);//sombra
  bezier(154, 110, 104, 138, 44, 189, 15, 230);
  stroke(jbgde1_1);
  bezier(154-25, 110-5, 104-25, 138-5, 44-25, 189-5, 15-25, 230-5);
 
  noFill();//jellybean grande_2
  strokeWeight(70);
  stroke(sombra1);//sombra
  bezier(330, 100, 280, 135, 230, 315, 192, 350);
  stroke(jbgde2_1);
  bezier(330-15, 100-15, 280-15, 135-15, 230-15, 315-15, 192-15, 350-15);
 
  noFill();//jellybean grande_3
  strokeWeight(50);
  stroke(sombra1);//sombra
  bezier(450, 220, 500, 270, 515, 370, 460, 420);
  stroke(jbgde3_1);
  bezier(450-15, 220+15, 500-15, 270+15, 515-15, 370+15, 460-35, 420+15);
 
  noFill();//jellybean grande_4
  strokeWeight(80);
  stroke(sombra2);//sombra
  bezier(651, 331, 688, 367, 745, 429, 769, 459);
  stroke(jbgde4_1);
  bezier(651-20, 331, 688-20, 367, 745-20, 429, 769-20, 459);
   
  //Medianas - arriba izq > abajo der
  noFill();//jellybean mediana_1
  strokeWeight(40);
  stroke(sombra3);//sombra
  bezier(-40, -25, -5, 2, 22, 2, 36, 21);
  stroke(jbmed1_1);
  bezier(-40+5, -25+20, -5+5, 2+20, 22+5, 2+20, 36+5, 21+20);
 
  noFill();//jellybean mediana_2
  strokeWeight(40);
  stroke(sombra1);//sombra
  bezier(91, 70, 135, 96, 119, 142, 160, 155);
  stroke(jbmed2_1);
  bezier(91+8, 70-10, 135+8, 96-10, 119+8, 142-10, 160+8, 155-10);
 
  noFill();//jellybean mediana_3
  strokeWeight(40);
  stroke(sombra1);//sombra
  bezier(87, 444, 85, 474, 189, 474, 184, 520);
  stroke(jbmed3_1);
  bezier(87-15, 444+2, 85-15, 474+2, 189-15, 474+2, 184-15, 520+2);
 
  noFill();//jellybean mediana_4
  strokeWeight(40);
  stroke(sombra2);//sombra
  bezier(325, 409, 290, 476, 375, 507, 364, 548);
  stroke(jbmed4_1);
  bezier(325-30, 409-2, 290-30, 476-2, 375-30, 507-2, 364-30, 548-2);
 
  noFill();//jellybean mediana_5
  strokeWeight(50);
  stroke(sombra3);//sombra
  bezier(571, 21, 616, 50, 541, 131, 583, 153);
  stroke(jbmed5_1);
  bezier(571+25, 21-5, 616+25, 50-5, 541+25, 131-5, 583+25, 153-5);
 
  //Chicas - arriba izq > abajo der
  noFill();//jellybean chica_1
  strokeWeight(25);
  stroke(sombra1);//sombra
  bezier(28, 370, 24, 398, -24, 416, -29, 439);
  stroke(jbchi1_1);
  bezier(28+5, 370-20, 24+5, 398-20, -24+5, 416-20, -29+5, 439-20);
 
  noFill();//jellybean chica_2
  strokeWeight(40);
  stroke(sombra1);//sombra
  bezier(228, -3, 245, 14, 244, 40, 227, 60);
  stroke(jbchi2_1);
  bezier(228-10, -3+20, 245-10, 14+20, 244-10, 40+20, 227-10, 60+20);
 
  noFill();//jellybean chica_3
  strokeWeight(40);
  stroke(sombra3);//sombra
  bezier(390, 302, 397, 321, 354, 315, 356, 339);
  stroke(jbchi3_1);
  bezier(390-10, 302-5, 397-10, 321-5, 354-10, 315-5, 356-10, 339-5);
 
  noFill();//jellybean chica_4
  strokeWeight(40);
  stroke(sombra1);//sombra
  bezier(465, 20, 453, 33, 458, 83, 448, 81);
  stroke(jbchi4_1);
  bezier(465+15, 20-3, 453+15, 33-3, 458+15, 83-3, 448+15, 81-3);
 
  noFill();//jellybean chica_5
  strokeWeight(40);
  stroke(sombra2);//sombra
  bezier(525, 238, 530, 240, 507, 271, 495, 270);
  stroke(jbchi5_1);
  bezier(525-15, 238-5, 530-15, 240-5, 507-15, 271-5, 495-15, 270-5);
 
  noFill();//jellybean chica_6
  strokeWeight(40);
  stroke(sombra1);//sombra
  bezier(587, 422, 605, 440, 580, 475, 598, 494);
  stroke(jbchi6_1);
  bezier(587-30, 422-2, 605-30, 440-2, 580-30, 475-2, 598-30, 494-2);
 
  noFill();//jellybean chica_7
  strokeWeight(40);
  stroke(sombra2);//sombra
  bezier(645, 159, 642, 167, 649, 196, 659, 207);
  stroke(jbchi7_1);
  bezier(645-5, 159+10, 642-5, 167+10, 649-5, 196+10, 659-5, 207+10);
}
 
void keyPressed() {//Al apretar Space
  if (key == ' ') {
    save("Yelibin - "+day()+"."+month()+"."+year()+"_"+hour()+"."+minute()+"."+second()+".jpeg");
  }
}
