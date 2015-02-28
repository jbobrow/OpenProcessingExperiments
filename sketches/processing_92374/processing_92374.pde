
float X=0;
float Y=0;
float IrisX;
float IrisY;
float TourR;
float IrisR;
float PupX;
float PupY;
float PupR;

float rCourante = 167;
float gCourante = 25;
float bCourante = 151;

float rCiblee = 167;
float gCiblee = 25;
float bCiblee = 151;

float rVitesse, gVitesse, bVitesse;

float k = 0.9;
float d = 0.1;

int timeStamp;
int interval;

float nombrilX = X;
float nombrilY = Y+150;
float nombrilR = 8;

float cptBouge;
float stopy;

 
float rectX;
float rectY; 
float rectW; 
float rectH;

void setup() {

  size (400, 400);
  frameRate (30);
  smooth();

  interval = 10000;

  stopy =1;
  cptBouge =1;
}

void draw() {
  background (125);
  translate (width/2, height/2-15);
  rVitesse = d * (rVitesse + k * (rCiblee - rCourante));
  rCourante = rCourante + rVitesse;
  gVitesse = d * (gVitesse + k * (gCiblee - gCourante));
  gCourante = gCourante + gVitesse;
  bVitesse = d * (bVitesse + k * (bCiblee - bCourante));
  bCourante = bCourante + bVitesse;


  pushMatrix();  //Pied Gauche
  //  strokeWeight(1);
  fill(rCourante, gCourante, bCourante);
  resetMatrix();
  beginShape();
  curveVertex(X+150, Y+353 );
  curveVertex( X+150, Y+351 );
  curveVertex( X+151, Y+348 );
  curveVertex (X+151, Y+346 );
  curveVertex( X+150, Y+345 );
  curveVertex( X+149, Y+344 );
  curveVertex( X+148, Y+343 );
  curveVertex( X+147, Y+343 );
  curveVertex( X+145, Y+342 );
  curveVertex( X+143, Y+342 );
  curveVertex( X+141, Y+343 );
  curveVertex( X+140, Y+344 );
  curveVertex( X+139, Y+346 );
  curveVertex( X+138, Y+348 );
  curveVertex( X+136, Y+350 );
  curveVertex( X+134, Y+351 );
  curveVertex( X+132, Y+353 );
  curveVertex( X+130, Y+355 );
  curveVertex( X+128, Y+357 );
  curveVertex( X+128, Y+357 );
  curveVertex( X+127, Y+357 );
  curveVertex( X+126, Y+357 );
  curveVertex( X+125, Y+358 );
  curveVertex( X+125, Y+358 );
  curveVertex( X+125, Y+359 );
  curveVertex( X+125, Y+361 );
  curveVertex( X+125, Y+362 );
  curveVertex( X+126, Y+362 );
  curveVertex( X+126, Y+362 );
  curveVertex( X+127, Y+362 );
  curveVertex( X+126, Y+363 );
  curveVertex( X+126, Y+364 );
  curveVertex( X+126, Y+365 );
  curveVertex( X+126, Y+366 );
  curveVertex( X+127, Y+367 );
  curveVertex( X+128, Y+367 );
  curveVertex( X+129, Y+367 );
  curveVertex( X+130, Y+367 );
  curveVertex( X+130, Y+367 );
  curveVertex( X+130, Y+367 );
  curveVertex( X+130, Y+367 );
  curveVertex( X+129, Y+368 );
  curveVertex( X+129, Y+370 );
  curveVertex( X+130, Y+371 );
  curveVertex( X+130, Y+372 );
  curveVertex( X+131, Y+372 );
  curveVertex( X+132, Y+373 );
  curveVertex( X+133, Y+373 );
  curveVertex( X+135, Y+372 );
  curveVertex( X+135, Y+372 );
  curveVertex( X+136, Y+371 );
  curveVertex( X+136, Y+372 );
  curveVertex( X+136, Y+374 );
  curveVertex( X+137, Y+375 );
  curveVertex( X+139, Y+377 );
  curveVertex( X+141, Y+377 );
  curveVertex( X+142, Y+377 );
  curveVertex( X+144, Y+377 );
  curveVertex( X+146, Y+377 );
  curveVertex( X+147, Y+376 );
  curveVertex( X+148, Y+375 );
  curveVertex( X+149, Y+373 );
  curveVertex( X+149, Y+371 );
  curveVertex( X+149, Y+369 );
  curveVertex( X+148, Y+368 );
  curveVertex( X+148, Y+367 );
  curveVertex( X+149, Y+366 );
  curveVertex( X+149, Y+364 );
  curveVertex( X+149, Y+361 );
  curveVertex( X+149, Y+358 );
  curveVertex( X+149, Y+356 );
  curveVertex( X+150, Y+353 );
  endShape(CLOSE);
  popMatrix();

  pushMatrix();              //Pied droit
  fill(rCourante, gCourante, bCourante);
  translate(X-200, Y-170);
  resetMatrix();
  beginShape();
  curveVertex(X+267, Y+359 );
  curveVertex( X+266, Y+358 );
  curveVertex( X+265, Y+357 );
  curveVertex( X+264, Y+357 );
  curveVertex( X+263, Y+357 );
  curveVertex( X+261, Y+354 );
  curveVertex( X+260, Y+353 );
  curveVertex( X+259, Y+352 );
  curveVertex( X+258, Y+351 );
  curveVertex( X+257, Y+350 );
  curveVertex( X+255, Y+349 );
  curveVertex( X+254, Y+348 );
  curveVertex( X+254, Y+348 );
  curveVertex( X+253, Y+345 );
  curveVertex( X+251, Y+344 );
  curveVertex( X+250, Y+343 );
  curveVertex( X+249, Y+342 );
  curveVertex( X+247, Y+342 );
  curveVertex( X+246, Y+342 );
  curveVertex( X+245, Y+343 );
  curveVertex( X+244, Y+343 );
  curveVertex( X+242, Y+344 );
  curveVertex( X+241, Y+345 );
  curveVertex( X+241, Y+347 );
  curveVertex( X+241, Y+349 );
  curveVertex( X+241, Y+350 );
  curveVertex( X+242, Y+352 );
  curveVertex( X+242, Y+353 );
  curveVertex( X+242, Y+355 );
  curveVertex( X+242, Y+356 );
  curveVertex( X+242, Y+358 );
  curveVertex( X+243, Y+359 );
  curveVertex( X+243, Y+361 );
  curveVertex( X+243, Y+362 );
  curveVertex( X+243, Y+364 );
  curveVertex( X+243, Y+365 );
  curveVertex( X+243, Y+366 );
  curveVertex( X+243, Y+367 );
  curveVertex( X+244, Y+368 );
  curveVertex( X+243, Y+369 );
  curveVertex( X+243, Y+370 );
  curveVertex( X+243, Y+372 );
  curveVertex( X+243, Y+373 );
  curveVertex( X+244, Y+375 );
  curveVertex( X+245, Y+376 );
  curveVertex( X+247, Y+377 );
  curveVertex( X+248, Y+377 );
  curveVertex( X+250, Y+377 );
  curveVertex( X+251, Y+377 );
  curveVertex( X+253, Y+376 );
  curveVertex( X+255, Y+375 );
  curveVertex( X+255, Y+374 );
  curveVertex( X+255, Y+373 );
  curveVertex( X+256, Y+372 );
  curveVertex( X+256, Y+371 );
  curveVertex( X+257, Y+372 );
  curveVertex( X+258, Y+373 );
  curveVertex( X+259, Y+373 );
  curveVertex( X+260, Y+373 );
  curveVertex( X+261, Y+372 );
  curveVertex( X+262, Y+372 );
  curveVertex( X+262, Y+371 );
  curveVertex( X+262, Y+370 );
  curveVertex( X+262, Y+369 );
  curveVertex( X+262, Y+368 );
  curveVertex( X+262, Y+367 );
  curveVertex( X+261, Y+367 );
  curveVertex( X+261, Y+367 );
  curveVertex( X+262, Y+367 );
  curveVertex( X+263, Y+367 );
  curveVertex( X+264, Y+367 );
  curveVertex( X+265, Y+367 );
  curveVertex( X+265, Y+366 );
  curveVertex( X+266, Y+365 );
  curveVertex( X+266, Y+365 );
  curveVertex( X+266, Y+364 );
  curveVertex( X+265, Y+363 );
  curveVertex( X+265, Y+362 );
  curveVertex( X+265, Y+362 );
  curveVertex( X+266, Y+362 );
  curveVertex( X+267, Y+361 );
  curveVertex( X+267, Y+359 );
  endShape(CLOSE);
  popMatrix();

//Code suivant dessine la bédaine et le torse tout en colorant le dégradé de couleurs

  for (int i=0; i<=50; i++) {
    noStroke();
    fill(rCourante+i*0.5, gCourante, bCourante+i*0.2);
    ellipse (X, Y+30, 170-i, 80-i);    //Corps Torse
    ellipse (X, Y+100, 200-i, 170-i);  //Corps Bedaine
  }


  // detecter le mouseOver sur le nombril
  // Le nombril change de couleur au mouseover
  float distanceN = dist( mouseX-200, mouseY-190, nombrilX, nombrilY );
  if ( distanceN < nombrilR) {

    stroke(0);  //nombril
    strokeWeight(2);
    beginShape();
    curveVertex(X-32.0, Y+126.0);
    curveVertex(X-12.0, Y+152.0);
    curveVertex(X+12.0, Y+152.0);
    curveVertex(X+32.0, Y+126.0);
    endShape();
    fill(0);
    ellipse( X+nombrilX, Y+nombrilY, nombrilR *2, nombrilR );
    fill(255);
    ellipse( X+nombrilX, Y+nombrilY, nombrilR/1.5, nombrilR/2 );
  } 
  else {
    fill(155, 22, 139);
    stroke(155, 22, 139);  //nombril
    strokeWeight(2);
    beginShape();
    curveVertex(X-32.0, Y+126.0);
    curveVertex(X-12.0, Y+152.0);
    curveVertex(X+12.0, Y+152.0);
    curveVertex(X+32.0, Y+126.0);
    endShape();
    ellipse( X+nombrilX, Y+nombrilY, nombrilR *2, nombrilR );
  }



  pushMatrix();    // Dessine le fond de la tête
  noStroke();
  fill(rCourante, gCourante, bCourante);
  resetMatrix();  
  beginShape();
  curveVertex(X+88, Y+72 );
  curveVertex( X+87, Y+72 );
  curveVertex( X+84, Y+74 );
  curveVertex( X+83, Y+74 );
  curveVertex( X+83, Y+74 );
  curveVertex( X+83, Y+74 );
  curveVertex( X+82, Y+75 );
  curveVertex( X+81, Y+76 );
  curveVertex( X+79, Y+77 );
  curveVertex( X+78, Y+78 );
  curveVertex( X+78, Y+78 );
  curveVertex( X+77, Y+79 );
  curveVertex( X+76, Y+79 );
  curveVertex( X+76, Y+80 );
  curveVertex( X+73, Y+83 );
  curveVertex( X+72, Y+83 );
  curveVertex( X+72, Y+84 );
  curveVertex( X+72, Y+84 );
  curveVertex( X+71, Y+85 );
  curveVertex( X+71, Y+85 );
  curveVertex( X+70, Y+86 );
  curveVertex( X+69, Y+88 );
  curveVertex( X+67, Y+90 );
  curveVertex( X+67, Y+92 );
  curveVertex( X+66, Y+94 );
  curveVertex( X+65, Y+95 );
  curveVertex( X+64, Y+98 );
  curveVertex( X+64, Y+98 );
  curveVertex( X+64, Y+98 );
  curveVertex( X+60, Y+115 );
  curveVertex( X+51, Y+147 );
  curveVertex( X+55, Y+177 );
  curveVertex( X+82, Y+196 );
  curveVertex( X+85, Y+197 );
  curveVertex( X+86, Y+197 );
  curveVertex( X+86, Y+197 );
  curveVertex( X+86, Y+197 );
  curveVertex( X+86, Y+197 );
  curveVertex( X+86, Y+197 );
  curveVertex( X+93, Y+199 );
  curveVertex( X+93, Y+199 );
  curveVertex( X+100, Y+200 );
  curveVertex( X+106, Y+201 );
  curveVertex( X+196, Y+209 );
  curveVertex( X+285, Y+201 );
  curveVertex( X+292, Y+200 );
  curveVertex( X+299, Y+199 );
  curveVertex( X+310, Y+196 );
  curveVertex( X+337, Y+177 );
  curveVertex( X+341, Y+147 );
  curveVertex( X+327, Y+98 );
  curveVertex( X+327, Y+98 );
  curveVertex( X+327, Y+98 );
  curveVertex( X+326, Y+95 );
  curveVertex( X+326, Y+94 );
  curveVertex( X+326, Y+94 );
  curveVertex( X+326, Y+94 );
  curveVertex( X+325, Y+91 );
  curveVertex( X+325, Y+91 );
  curveVertex( X+324, Y+91 );
  curveVertex( X+324, Y+91 );
  curveVertex( X+324, Y+90 );
  curveVertex( X+323, Y+88 );
  curveVertex( X+322, Y+86 );
  curveVertex( X+321, Y+85 );
  curveVertex( X+321, Y+85 );
  curveVertex( X+321, Y+85 );
  curveVertex( X+321, Y+85 );
  curveVertex( X+320, Y+84 );
  curveVertex( X+320, Y+84 );
  curveVertex( X+320, Y+84 );
  curveVertex( X+319, Y+83 );
  curveVertex( X+319, Y+83 );
  curveVertex( X+319, Y+83 );
  curveVertex( X+316, Y+79 );
  curveVertex( X+315, Y+79 );
  curveVertex( X+315, Y+79 );
  curveVertex( X+314, Y+79 );
  curveVertex( X+314, Y+78 );
  curveVertex( X+313, Y+77 );
  curveVertex( X+312, Y+76 );
  curveVertex( X+311, Y+76 );
  curveVertex( X+311, Y+76 );
  curveVertex( X+311, Y+76 );
  curveVertex( X+308, Y+74 );
  curveVertex( X+308, Y+74 );
  curveVertex( X+308, Y+74 );
  curveVertex( X+307, Y+74 );
  curveVertex( X+307, Y+74 );
  curveVertex( X+307, Y+74 );
  curveVertex( X+304, Y+72 );
  curveVertex( X+304, Y+72 );
  curveVertex( X+304, Y+72 );
  curveVertex( X+304, Y+72 );
  curveVertex( X+303, Y+72 );
  curveVertex( X+303, Y+72 );
  curveVertex( X+302, Y+72 );
  curveVertex( X+302, Y+72 );
  curveVertex( X+302, Y+72 );
  curveVertex( X+300, Y+71 );
  curveVertex( X+299, Y+71 );
  curveVertex( X+299, Y+71 );
  curveVertex( X+299, Y+71 );
  curveVertex( X+297, Y+70 );
  curveVertex( X+88, Y+72 );
  endShape(CLOSE);
  popMatrix();

//Zône d'intéractivité rectangulaire de la bouche, dessine et fait intéragir les yeux lorsque la souris entre dans la couche

rectX = X;
rectY = Y-35;
rectW = 250;
rectH = 100;

rectMode(CENTER);
float gauche = rectX - rectW/2;
float droite = rectX+rectW/2;
float haut = rectY - rectH/2;
float bas = rectY+rectH/2;
if ( mouseX-200 > gauche && mouseX-200 < droite && mouseY-200 > haut && mouseY-200 < bas ) {
  pushMatrix();
  translate(X-200, Y-0);  //Bouche
  stroke(255, 255, 255);
  strokeWeight(5);
  
  fill(rCiblee = random(110, 215), gCiblee = random(5, 95), bCiblee = random(100, 191));
  
  resetMatrix();
  beginShape();
  curveVertex(X+289, Y+104 );
  curveVertex(X+290, Y+104 );
  curveVertex( X+290, Y+104 );
  curveVertex( X+291, Y+104 );
  curveVertex( X+292, Y+104 );
  curveVertex( X+293, Y+104 );
  curveVertex( X+293, Y+104 );
  curveVertex( X+294, Y+104 );
  curveVertex( X+294, Y+105 );
  curveVertex( X+295, Y+105 );
  curveVertex( X+295, Y+105 );
  curveVertex( X+296, Y+106 );
  curveVertex( X+297, Y+106 );
  curveVertex( X+297, Y+106 );
  curveVertex( X+298, Y+106 );
  curveVertex( X+298, Y+107 );
  curveVertex( X+299, Y+107 );
  curveVertex( X+299, Y+107 );
  curveVertex( X+299, Y+107 );
  curveVertex( X+303, Y+114 );
  curveVertex( X+316, Y+163 );
  curveVertex( X+304, Y+180 );
  curveVertex( X+300, Y+181 );
  curveVertex( X+300, Y+181 );
  curveVertex( X+294, Y+183 );
  curveVertex( X+294, Y+183 );
  curveVertex( X+287, Y+184 );
  curveVertex( X+287, Y+184 );
  curveVertex( X+281, Y+185 );
  curveVertex( X+281, Y+185 );
  curveVertex( X+196, Y+193 );
  curveVertex( X+111, Y+185 );
  curveVertex( X+111, Y+185 );
  curveVertex( X+105, Y+184 );
  curveVertex( X+104, Y+184 );
  curveVertex( X+98, Y+183 );
  curveVertex( X+98, Y+183 );
  curveVertex( X+92, Y+181 );
  curveVertex( X+92, Y+181 );
  curveVertex( X+88, Y+180 );
  curveVertex( X+75, Y+163 );
  curveVertex( X+89, Y+114 );
  curveVertex( X+93, Y+107 );
  curveVertex( X+93, Y+107 );
  curveVertex( X+93, Y+107 );
  curveVertex( X+93, Y+107 );
  curveVertex( X+94, Y+106 );
  curveVertex( X+94, Y+106 );
  curveVertex( X+95, Y+106 );
  curveVertex( X+95, Y+106 );
  curveVertex( X+96, Y+105 );
  curveVertex( X+97, Y+105 );
  curveVertex( X+97, Y+105 );
  curveVertex( X+98, Y+104 );
  curveVertex( X+99, Y+104 );
  curveVertex( X+99, Y+104 );
  curveVertex( X+100, Y+104 );
  curveVertex( X+100, Y+104 );
  curveVertex( X+101, Y+104 );
  curveVertex( X+102, Y+104 );
  curveVertex( X+102, Y+104 );
  curveVertex( X+103, Y+104 );
  curveVertex( X+103, Y+104 );
  curveVertex( X+104, Y+104 );
  curveVertex( X+105, Y+104 );
  curveVertex( X+106, Y+104 );
  curveVertex( X+112, Y+105 );
  curveVertex( X+114, Y+106 );
  curveVertex( X+118, Y+107 );
  curveVertex( X+120, Y+107 );
  curveVertex( X+124, Y+108 );
  curveVertex( X+126, Y+108 );
  curveVertex( X+131, Y+109 );
  curveVertex( X+132, Y+109 );
  curveVertex( X+138, Y+110 );
  curveVertex( X+138, Y+110 );
  curveVertex( X+158, Y+113 );
  curveVertex( X+159, Y+113 );
  curveVertex( X+165, Y+113 );
  curveVertex( X+165, Y+113 );
  curveVertex( X+172, Y+114 );
  curveVertex( X+175, Y+114 );
  curveVertex( X+175, Y+114 );
  curveVertex( X+186, Y+114 );
  curveVertex( X+190, Y+115 );
  curveVertex( X+196, Y+115 );
  curveVertex( X+201, Y+115 );
  curveVertex( X+206, Y+114 );
  curveVertex( X+211, Y+114 );
  curveVertex( X+211, Y+114 );
  curveVertex( X+217, Y+114 );
  curveVertex( X+217, Y+114 );
  curveVertex( X+220, Y+114 );
  curveVertex( X+226, Y+113 );
  curveVertex( X+227, Y+113 );
  curveVertex( X+233, Y+113 );
  curveVertex( X+234, Y+113 );
  curveVertex( X+253, Y+110 );
  curveVertex( X+254, Y+110 );
  curveVertex( X+259, Y+109 );
  curveVertex( X+261, Y+109 );
  curveVertex( X+266, Y+108 );
  curveVertex( X+267, Y+108 );
  curveVertex( X+272, Y+107 );
  curveVertex( X+274, Y+107 );
  curveVertex( X+278, Y+106 );
  curveVertex( X+280, Y+105 );
  curveVertex( X+286, Y+104 );
  curveVertex( X+287, Y+104 );
  curveVertex( X+287, Y+104 );
  curveVertex( X+289, Y+104 );
  curveVertex( X+289, Y+104 );
  curveVertex( X+289, Y+104 );
  curveVertex( X+289, Y+104 );
  endShape(CLOSE);
  popMatrix();
        //Yeux
  noStroke();
  fill(rCourante, gCourante, bCourante);

  float [] IrisX = { 
    X-108, X-97, X-73, X-74, X-57, X-50, X-47, X-20, X-26, X-30, X-5, X-108, X-97, X-73, X-74, X-57, X-50, X-47, X-20, X-26, X
  };
  float [] IrisY = {
    Y-120, Y-147, Y-155, Y-128, Y-105, Y-158, Y-128, Y-113, Y-130, Y-142, Y-147, Y-120, Y-147, Y-155, Y-128, Y-105, Y-158, Y-128, Y-113, Y-130, Y-136
  };
  float [] TourR = {
    40, 37, 27, 37, 32, 40, 30, 30, 15, 15, 40, 40, 37, 27, 37, 32, 40, 30, 30, 15, 40
  };
  float [] IrisR = {
    30, 26, 18, 26, 21, 30, 20, 20, 10, 10, 30, 30, 26, 18, 26, 21, 30, 20, 20, 10, 30
  };
  float[] PupX = { 
    X-105, X-100, X-77, X-80, X-50, X-58, X-50, X-22, X-22, X-32, X-17, X-105, X-100, X-77, X-88, X-50, X-58, X-50, X-22, X-22, X+2
  };
  float[] PupY = {
    Y-129, Y-147, Y-160, Y-130, Y-110, Y-160, Y-130, Y-120, Y-133, Y-140, Y-155, Y-129, Y-147, Y-160, Y-130, Y-110, Y-160, Y-130, Y-120, Y-133, Y-124
  };
  float [] PupR = {
    20, 28, 14, 20, 17, 20, 19, 14, 10, 10, 14, 17, 20, 10, 18, 15, 17, 17, 12, 7, 14
  }; 


  for (int j=0; j<21; j++) {

    float radians = atan2 ((mouseY-190)-IrisY[j], (mouseX-200)-IrisX[j]);
    float distance = dist ((mouseX-200), (mouseY-190), IrisX[j], IrisY[j]);
    distance = constrain ( distance, 0, (IrisR[j]/2)-(PupR[j]/2));

    // PupX = cos(radians)*distance +IrisX[j];
    // PupY = sin(radians)*distance +IrisY[j];

    fill(rCourante, gCourante, bCourante);
    ellipse (IrisX[j], IrisY[j], TourR[j], TourR[j]);
    fill(255, 255, 255);
    ellipse (IrisX[j], IrisY[j], IrisR[j], IrisR[j]);
   fill(rCiblee = random(110, 215), gCiblee = random(5, 95), bCiblee = random(100, 191));
    ellipse (PupX[j]= cos(radians)*distance +IrisX[j], PupY[j]= sin(radians)*distance +IrisY[j], PupR[j], PupR[j]);

    fill(rCourante, gCourante, bCourante);
    ellipse (IrisX[j]+120, IrisY[j], TourR[j], TourR[j]);
    fill(255, 255, 255);
    ellipse (IrisX[j]+120, IrisY[j], IrisR[j], IrisR[j]);
   fill(rCiblee = random(110, 215), gCiblee = random(5, 95), bCiblee = random(100, 191));
    ellipse (PupX[j]+120, PupY[j], PupR[j], PupR[j]);
  }
        
} else {
  pushMatrix();
  translate(X-200, Y-0);  //Bouche
  stroke(255, 255, 255);
  strokeWeight(5);
  fill(77, 16, 70);
  resetMatrix();
  beginShape();
  curveVertex(X+289, Y+104 );
  curveVertex(X+290, Y+104 );
  curveVertex( X+290, Y+104 );
  curveVertex( X+291, Y+104 );
  curveVertex( X+292, Y+104 );
  curveVertex( X+293, Y+104 );
  curveVertex( X+293, Y+104 );
  curveVertex( X+294, Y+104 );
  curveVertex( X+294, Y+105 );
  curveVertex( X+295, Y+105 );
  curveVertex( X+295, Y+105 );
  curveVertex( X+296, Y+106 );
  curveVertex( X+297, Y+106 );
  curveVertex( X+297, Y+106 );
  curveVertex( X+298, Y+106 );
  curveVertex( X+298, Y+107 );
  curveVertex( X+299, Y+107 );
  curveVertex( X+299, Y+107 );
  curveVertex( X+299, Y+107 );
  curveVertex( X+303, Y+114 );
  curveVertex( X+316, Y+163 );
  curveVertex( X+304, Y+180 );
  curveVertex( X+300, Y+181 );
  curveVertex( X+300, Y+181 );
  curveVertex( X+294, Y+183 );
  curveVertex( X+294, Y+183 );
  curveVertex( X+287, Y+184 );
  curveVertex( X+287, Y+184 );
  curveVertex( X+281, Y+185 );
  curveVertex( X+281, Y+185 );
  curveVertex( X+196, Y+193 );
  curveVertex( X+111, Y+185 );
  curveVertex( X+111, Y+185 );
  curveVertex( X+105, Y+184 );
  curveVertex( X+104, Y+184 );
  curveVertex( X+98, Y+183 );
  curveVertex( X+98, Y+183 );
  curveVertex( X+92, Y+181 );
  curveVertex( X+92, Y+181 );
  curveVertex( X+88, Y+180 );
  curveVertex( X+75, Y+163 );
  curveVertex( X+89, Y+114 );
  curveVertex( X+93, Y+107 );
  curveVertex( X+93, Y+107 );
  curveVertex( X+93, Y+107 );
  curveVertex( X+93, Y+107 );
  curveVertex( X+94, Y+106 );
  curveVertex( X+94, Y+106 );
  curveVertex( X+95, Y+106 );
  curveVertex( X+95, Y+106 );
  curveVertex( X+96, Y+105 );
  curveVertex( X+97, Y+105 );
  curveVertex( X+97, Y+105 );
  curveVertex( X+98, Y+104 );
  curveVertex( X+99, Y+104 );
  curveVertex( X+99, Y+104 );
  curveVertex( X+100, Y+104 );
  curveVertex( X+100, Y+104 );
  curveVertex( X+101, Y+104 );
  curveVertex( X+102, Y+104 );
  curveVertex( X+102, Y+104 );
  curveVertex( X+103, Y+104 );
  curveVertex( X+103, Y+104 );
  curveVertex( X+104, Y+104 );
  curveVertex( X+105, Y+104 );
  curveVertex( X+106, Y+104 );
  curveVertex( X+112, Y+105 );
  curveVertex( X+114, Y+106 );
  curveVertex( X+118, Y+107 );
  curveVertex( X+120, Y+107 );
  curveVertex( X+124, Y+108 );
  curveVertex( X+126, Y+108 );
  curveVertex( X+131, Y+109 );
  curveVertex( X+132, Y+109 );
  curveVertex( X+138, Y+110 );
  curveVertex( X+138, Y+110 );
  curveVertex( X+158, Y+113 );
  curveVertex( X+159, Y+113 );
  curveVertex( X+165, Y+113 );
  curveVertex( X+165, Y+113 );
  curveVertex( X+172, Y+114 );
  curveVertex( X+175, Y+114 );
  curveVertex( X+175, Y+114 );
  curveVertex( X+186, Y+114 );
  curveVertex( X+190, Y+115 );
  curveVertex( X+196, Y+115 );
  curveVertex( X+201, Y+115 );
  curveVertex( X+206, Y+114 );
  curveVertex( X+211, Y+114 );
  curveVertex( X+211, Y+114 );
  curveVertex( X+217, Y+114 );
  curveVertex( X+217, Y+114 );
  curveVertex( X+220, Y+114 );
  curveVertex( X+226, Y+113 );
  curveVertex( X+227, Y+113 );
  curveVertex( X+233, Y+113 );
  curveVertex( X+234, Y+113 );
  curveVertex( X+253, Y+110 );
  curveVertex( X+254, Y+110 );
  curveVertex( X+259, Y+109 );
  curveVertex( X+261, Y+109 );
  curveVertex( X+266, Y+108 );
  curveVertex( X+267, Y+108 );
  curveVertex( X+272, Y+107 );
  curveVertex( X+274, Y+107 );
  curveVertex( X+278, Y+106 );
  curveVertex( X+280, Y+105 );
  curveVertex( X+286, Y+104 );
  curveVertex( X+287, Y+104 );
  curveVertex( X+287, Y+104 );
  curveVertex( X+289, Y+104 );
  curveVertex( X+289, Y+104 );
  curveVertex( X+289, Y+104 );
  curveVertex( X+289, Y+104 );
  endShape(CLOSE);
  popMatrix();       
  //Yeux
  noStroke();
  fill(rCourante, gCourante, bCourante);

  float [] IrisX = { 
    X-108, X-97, X-73, X-74, X-57, X-50, X-47, X-20, X-26, X-30, X-5, X-108, X-97, X-73, X-74, X-57, X-50, X-47, X-20, X-26, X
  };
  float [] IrisY = {
    Y-120, Y-147, Y-155, Y-128, Y-105, Y-158, Y-128, Y-113, Y-130, Y-142, Y-147, Y-120, Y-147, Y-155, Y-128, Y-105, Y-158, Y-128, Y-113, Y-130, Y-136
  };
  float [] TourR = {
    40, 37, 27, 37, 32, 40, 30, 30, 15, 15, 40, 40, 37, 27, 37, 32, 40, 30, 30, 15, 40
  };
  float [] IrisR = {
    30, 26, 18, 26, 21, 30, 20, 20, 10, 10, 30, 30, 26, 18, 26, 21, 30, 20, 20, 10, 30
  };
  float[] PupX = { 
    X-105, X-100, X-77, X-80, X-50, X-58, X-50, X-22, X-22, X-32, X-17, X-105, X-100, X-77, X-88, X-50, X-58, X-50, X-22, X-22, X+2
  };
  float[] PupY = {
    Y-129, Y-147, Y-160, Y-130, Y-110, Y-160, Y-130, Y-120, Y-133, Y-140, Y-155, Y-129, Y-147, Y-160, Y-130, Y-110, Y-160, Y-130, Y-120, Y-133, Y-124
  };
  float [] PupR = {
    15, 12, 7, 15, 12, 15, 15, 10, 5, 5, 12, 15, 12, 7, 15, 12, 15, 15, 10, 5, 12
  }; 


  for (int j=0; j<21; j++) {

    float radians = atan2 ((mouseY-190)-IrisY[j], (mouseX-200)-IrisX[j]);
    float distance = dist ((mouseX-200), (mouseY-190), IrisX[j], IrisY[j]);
    distance = constrain ( distance, 0, (IrisR[j]/2)-(PupR[j]/2));

    // PupX = cos(radians)*distance +IrisX[j];
    // PupY = sin(radians)*distance +IrisY[j];

    fill(rCourante, gCourante, bCourante);
    ellipse (IrisX[j], IrisY[j], TourR[j], TourR[j]);
    fill(255, 255, 255);
    ellipse (IrisX[j], IrisY[j], IrisR[j], IrisR[j]);
    fill(0);
    ellipse (PupX[j]= cos(radians)*distance +IrisX[j], PupY[j]= sin(radians)*distance +IrisY[j], PupR[j], PupR[j]);

    fill(rCourante, gCourante, bCourante);
    ellipse (IrisX[j]+120, IrisY[j], TourR[j], TourR[j]);
    fill(255, 255, 255);
    ellipse (IrisX[j]+120, IrisY[j], IrisR[j], IrisR[j]);
    fill(0);
    ellipse (PupX[j]+120, PupY[j], PupR[j], PupR[j]);
  }
  for (int i=0; i<125 ;i=i+10) {
    fill(255, 255, 255);
    triangle(X-60+i, Y-60, X-65+i, Y-74, X-55+i, Y-74);
  } 
  for (int i=0; i<60 ;i=i+10) {
    triangle(X-25+i, Y-8, X-20+i, Y+7, X-30+i, Y+7);
  }
}

noFill();
noStroke();
rect( rectX , rectY , rectW , rectH );

// dessine les dents de la bouche

 for (int i=0; i<125 ;i=i+10) {
    fill(255, 255, 255);
    triangle(X-60+i, Y-60, X-65+i, Y-74, X-55+i, Y-74);
  } 
  for (int i=0; i<60 ;i=i+10) {
    triangle(X-25+i, Y-8, X-20+i, Y+7, X-30+i, Y+7);
  }
  ellipse(X+43, Y+1, 12, 12);
  triangle(X+35, Y-24, X+30, Y+5, X+43, Y+3);  //Canine
  triangle(X-35, Y-24, X-30, Y+5, X-43, Y+3);  //Canine
  ellipse(X-43, Y+1, 12, 12);

  ellipse(X+70, Y-73, 12, 12);
  ellipse(X-69, Y-73, 12, 12);

  if ( millis() - timeStamp >= interval ) {
    timeStamp = timeStamp + interval;
    rCiblee = random(110, 215);
    gCiblee = random(5, 95);
    bCiblee = random(100, 191);
  }

  Y+=sin(radians(cptBouge*8));
  cptBouge++;
  stopy-=sin(radians(cptBouge*2));
  
  
}

void mousePressed() {

  //assouplissement de la couleur lors du clique de la souris et sur le timer 
  
  rCiblee = random(110, 215);
  gCiblee = random(5, 95);
  bCiblee = random(100, 191);
}

/* mouse detection
 
 void mousePressed() {
 
 println("Clique: x "+(mouseX-200)+" y "+(mouseY-185));
 }
 */
