
int value = 91;
int value2 = 294;
float fill1 = 23;
float fill2 = 88;
float fill3 = 46;
int alpha1 = 255;
int alpha2 = 0;
int alpha3 = 100;
int alpha4 = 0;

int bck1 = 234;
int bck2 = 224;
int bck3 = 189;

void setup()
{
  size (857, 600);
  smooth();
}

void draw ()
{
  background (bck1, bck2, bck3);
  stroke (0);
  smooth();
  noStroke();

  //Petit cercle jaune
  fill (234, 185, 48);
  ellipse (mouseX*0.415, mouseY*0.68, 86, 86);

  // Cercle rouge fond
  fill (211, 84, 91);
  translate (-450, -600);
  ellipse (mouseX*1.3, mouseY*2.39, 216, 216);
  translate (450, 600);

  //Cercle rose
  fill (210, 112, 150);
  translate (250, -150);
  ellipse (-mouseX*0.34, mouseY-30, 204, 204);
  translate (-250, 150);

  //petit cercle rouge
  stroke (0);
  strokeWeight (0.005);
  fill (194, 23, 13);
  translate (500, 500);
  ellipse (mouseX*-0.75, mouseY*-0.98, 62, 62);
  translate (-500, -500);

  //Cercle noir
  noStroke ();
  fill (8, 11, 20,alpha1);
  translate (-30, 60);
  ellipse (mouseX-290, mouseY-240, 170, 170);
  translate (30, -60);  
  
  fill (249,246,237,alpha2);
  translate (-30,60);
  ellipse (mouseX-290, mouseY-240, 170, 170);
  translate (30,-60);

  //Cercle violet
  fill (85, 47, 160);
  translate (600, 300);
  ellipse  (mouseX*-1.15, mouseY*-0.6, 84, 84);
  translate (-600, -300);

  //Cercle violet foncé
  noStroke ();
  fill (54, 34, 119);
  translate (250, 600);
  ellipse (mouseX*-0.33, mouseY*-1.60, 32, 32);
  translate (-250, -600);

  //petit cercle violet clair
  fill (176, 169, 200);
  translate (50, 50);
  ellipse (mouseX*0.10, mouseY*1.25, 104, 104);
  translate (-50, -50);

  //petit cercle bleu turquoise
  fill(106, 190, 175);
  translate (250, -500);
  ellipse (mouseX-590, mouseY+623, 84, 84);
  translate (-250, 500);

  //petit cercle jaune
  stroke (0);
  strokeWeight (1);
  fill (218, 181, 38);
  translate (-500, 500);
  ellipse (mouseX*1.375, mouseY*-0.25, 60, 60);
  translate (500, -500);

  //quad noir
  fill (0);
  noStroke ();
  translate (mouseX-425, mouseY-300);
  quad (114, 365, 253, 440, 245, 450, 110, 370);
  translate (-mouseX+425, -mouseY+300);

  //lignes
  stroke (0);
  line (value, value2, 398, 210);

  translate (-mouseX+430, -mouseY+280);
  line (288, 56, 287, 211);
  translate (mouseX-430, mouseY-280);

  translate (mouseX-420, -mouseY+300);
  line (255, 61, 362, 113);
  translate (-mouseX+420, mouseY-300);

  translate (-2*mouseX+850, 1.5*mouseY-450);
  line (265, 111, 318, 111);
  line (271, 122, 324, 122);
  translate (2*mouseX-850, -1.5*mouseY+450);

  line (288, 153, mouseX, mouseY);
  line (mouseX, mouseY, 526, 362);

  //motif mosaique

  fill (253, 72, 7);
  translate (mouseX*0.5-215, mouseY*0.5-150);
  quad (206, 366, 235, 394, 217, 420, 190, 406);
  fill (193, 236, 219);
  quad (235, 394, 217, 420, 223, 423, 243, 403);
  translate (mouseX*0.5+215, -mouseY*0.5+150);

  fill (236, 222, 213);
  translate (-428,0);
  quad (223, 423, 243, 403, 255, 416, 238, 431);
  quad (206, 366, 215, 346, 250, 373, 235, 394);

  fill (130, 184, 44);
  quad (238, 431, 255, 416, 267, 426, 253, 440);

  noFill ();
  stroke (0, alpha1);
  strokeWeight (2);
  
  translate (mouseX-400,mouseX-400);
  
  arc (402,407,66,66,TWO_PI-PI,TWO_PI);
  
  stroke (219,215,56,alpha2);
  arc (469,407,66,66,TWO_PI-PI,TWO_PI);
  
  stroke (187,0,9, alpha1);
  arc (535,407,66,66,TWO_PI-PI,TWO_PI);
  
  stroke (0, alpha2);
  arc (602,407,66,66,TWO_PI-PI,TWO_PI);
  
  strokeWeight (1);
  stroke (219,178,194,alpha1);
  arc (438,440,66,66,TWO_PI-PI,TWO_PI);
  
  stroke (0,alpha2);
  arc (505,440,66,66,TWO_PI-PI,TWO_PI);
  arc (547,472,66,66,TWO_PI-PI,TWO_PI);
  
  stroke (181,190,143,alpha1);
  arc (583,505,66,66,TWO_PI-PI,TWO_PI);
  
  translate (-mouseX+400, -mouseX+400);
  
  strokeWeight (2);
  stroke(0);
  line (701,196,705,77);
  line (716,196,721,77);
  line (732,196,737,77);
  line (650,120,780,120);
  line (650,136,780,136);
  line (650,152,780,152);
  
  fill (147,229,145,alpha3);
  noStroke ();
  ellipse (mouseX+200,mouseY-200,250,250);
  fill (105,23,105,alpha4);
  ellipse (mouseX+200,mouseY-200,250,250);
  
  fill (fill1, fill2, fill3);
  noStroke ();
  rotate (radians(mouseX));
  translate (0, -800);
  triangle (457, 327, 591, 232, 649, 327);
  translate (100,100);
  

}

void mouseClicked () {
  if ((value == 91) && (value2==294) && (fill1==23) && (fill2 == 88) && (fill3==46) && (alpha1==255) && (alpha2==0) && (alpha3==100) && (alpha4==0) && (bck1==234) && (bck2==224) && (bck3==189) ){
    value = 400;
    value2=600;
    fill1=136;
    fill2=112;
    fill3=24;
    alpha1=0;
    alpha2=255;
    alpha3=0;
    alpha4=100;
    bck1 = 27;
    bck2 = 34;
    bck3 = 60;
  } 
  else {
    value = 91;
    value2 = 294;
    fill1 = 23;
    fill2 = 88;
    fill3 = 46;
    alpha1 = 255;
    alpha2 = 0;
    alpha3 = 100;
    alpha4 = 0;
    bck1 = 234;
    bck2 = 224;
    bck3 = 189;
  }
}


