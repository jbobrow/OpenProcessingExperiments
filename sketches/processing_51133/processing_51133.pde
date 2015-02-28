
size(400, 400);
smooth();

//centre
int xc = 200;
int yc = 200;

//Base de la tête
int xtetebase = (xc + 12);
int ytetebase = (yc - 171);
stroke(0);
fill(0);
strokeWeight(2);
beginShape();
curveVertex(xtetebase, ytetebase);
curveVertex(xtetebase - 11, ytetebase - 10);
curveVertex(xtetebase - 22, ytetebase);
curveVertex(xtetebase - 86, ytetebase + 18);
curveVertex(xtetebase - 130, ytetebase + 45);
curveVertex(xtetebase - 153, ytetebase + 91);
curveVertex(xtetebase - 149, ytetebase + 142);
curveVertex(xtetebase - 90, ytetebase + 178);
curveVertex(xtetebase + 68, ytetebase + 178);
curveVertex(xtetebase + 127,ytetebase + 142);
curveVertex(xtetebase + 131, ytetebase + 91);
curveVertex(xtetebase + 108, ytetebase + 45);
curveVertex(xtetebase + 64, ytetebase + 18);
curveVertex(xtetebase, ytetebase);
curveVertex(xtetebase - 11, ytetebase - 10);
curveVertex(xtetebase - 22, ytetebase);
endShape();

//2e contour de la tête
int xtetecont = xc - 1;
int ytetecont = yc - 161;
noStroke();
fill(240, 202, 162);
beginShape();
curveVertex(xtetecont + 29, ytetecont);
curveVertex(xtetecont, ytetecont - 3);
curveVertex(xtetecont - 24, ytetecont);
curveVertex(xtetecont - 71, ytetecont + 14);
curveVertex(xtetecont - 106, ytetecont + 37);
curveVertex(xtetecont - 131, ytetecont + 81);
curveVertex(xtetecont - 121, ytetecont + 128);
curveVertex(xtetecont - 71, ytetecont + 153);
curveVertex(xtetecont + 71, ytetecont + 153);
curveVertex(xtetecont + 121, ytetecont + 128);
curveVertex(xtetecont + 131, ytetecont + 81);
curveVertex(xtetecont + 106, ytetecont + 37);
curveVertex(xtetecont + 71, ytetecont + 14);
curveVertex(xtetecont + 29, ytetecont);
curveVertex(xtetecont, ytetecont - 2);
curveVertex(xtetecont - 24, ytetecont);
endShape();

//contour gauche de la tete pour pouvoir relier la barbe et les cheveux
int xtetecg = xc - 1;
int ytetecg = yc - 99;
stroke(0);
noFill();
strokeWeight(6);
beginShape();
curveVertex(xtetecg + 5, ytetecg - 65);
curveVertex(xtetecg - 30, ytetecg - 60);
curveVertex(xtetecg - 66, ytetecg - 48);
curveVertex(xtetecg - 104, ytetecg - 25);
curveVertex(xtetecg - 130, ytetecg + 19);
curveVertex(xtetecg - 118, ytetecg + 70);
curveVertex(xtetecg - 66, ytetecg + 91);
curveVertex(xtetecg - 7, ytetecg + 97);
endShape();

//contour droit de la tete pour pouvoir relier la barbe et les cheveux
int xtetecd = xc + 1;
int ytetecd = yc - 99;
stroke(0);
noFill();
strokeWeight(6);
beginShape();
curveVertex(xtetecd - 5, ytetecd - 65);
curveVertex(xtetecd + 30, ytetecd - 60);
curveVertex(xtetecd + 66, ytetecd - 48);
curveVertex(xtetecd + 104, ytetecd - 25);
curveVertex(xtetecd + 130, ytetecd + 19);
curveVertex(xtetecd + 118, ytetecd + 70);
curveVertex(xtetecd + 66, ytetecd + 91);
curveVertex(xtetecd + 7, ytetecd + 97);
endShape();

//petits cheveux du sommet du crane
int xche = xc - 29;
int yche = yc - 164;
strokeWeight(1);
fill(0);
beginShape();
while (xche < (xc + 31)) {
vertex(xche, yche);
vertex(xche + 4, yche + 8);
xche = xche + 8;
}
vertex(xche, yche);
endShape();

//Barbe 
strokeWeight(1);
stroke(0);
int poils = 0;
while (poils<700) {
float xbarb = random ((xc - 117), (xc + 119));
float ybarb = random ((yc - 29), (yc - 8));
line (xbarb, ybarb, xbarb, ybarb+4);
poils = poils+1;
}

//bouche contour 1
int xbouchecont = (xc + 1);
int ybouchecont = (yc - 99);
noStroke();
fill(206, 173, 139);
beginShape();
curveVertex(xbouchecont - 14, ybouchecont + 36);
curveVertex(xbouchecont - 38, ybouchecont + 22);
curveVertex(xbouchecont - 95, ybouchecont + 21);
curveVertex(xbouchecont - 116, ybouchecont + 35);
curveVertex(xbouchecont - 113, ybouchecont + 61);
curveVertex(xbouchecont - 42, ybouchecont + 65);
curveVertex(xbouchecont + 22, ybouchecont + 66);
curveVertex(xbouchecont + 67, ybouchecont + 66);
curveVertex(xbouchecont + 117, ybouchecont + 62);
curveVertex(xbouchecont + 118, ybouchecont + 35);
curveVertex(xbouchecont + 100, ybouchecont + 22);
curveVertex(xbouchecont + 30, ybouchecont + 22);
curveVertex(xbouchecont - 9, ybouchecont + 21);
curveVertex(xbouchecont - 71, ybouchecont + 40);
endShape();

//Contour de la bouche 2 + intérieur
int xbouchecont2 = xc + 1;
int ybouchecont2 = yc - 99;
fill(113,41,8);
beginShape();
curveVertex(xbouchecont2 - 14, ybouchecont2 + 36);
curveVertex(xbouchecont2 - 40, ybouchecont2 + 26);
curveVertex(xbouchecont2 - 91, ybouchecont2 + 26);
curveVertex(xbouchecont2 - 108, ybouchecont2 + 34);
curveVertex(xbouchecont2 - 107, ybouchecont2 + 57);
curveVertex(xbouchecont2 - 39, ybouchecont2 + 60);
curveVertex(xbouchecont2 + 28, ybouchecont2 + 61);
curveVertex(xbouchecont2 + 72, ybouchecont2 + 60);
curveVertex(xbouchecont2 + 111, ybouchecont2 + 57);
curveVertex(xbouchecont2 + 110, ybouchecont2 + 35);
curveVertex(xbouchecont2 + 94, ybouchecont2 + 26);
curveVertex(xbouchecont2 + 28, ybouchecont2 + 26);
curveVertex(xbouchecont2 - 9, ybouchecont2 + 27);
curveVertex(xbouchecont2 - 71, ybouchecont2 + 40);
endShape();

//barbe supérieur
int xbarbesup = xc + 1;
int ybarbesup = yc - 99;
strokeWeight(8);
stroke(0);
noFill();
beginShape();
curveVertex(xbarbesup + 66, ybarbesup + 116);
curveVertex(xbarbesup + 100, ybarbesup + 91);
curveVertex(xbarbesup + 122, ybarbesup + 59);
curveVertex(xbarbesup + 117, ybarbesup + 27);
curveVertex(xbarbesup + 93, ybarbesup + 16);
curveVertex(xbarbesup + 7, ybarbesup + 17);
curveVertex(xbarbesup - 89, ybarbesup + 16);
curveVertex(xbarbesup - 118, ybarbesup + 28);
curveVertex(xbarbesup - 119, ybarbesup + 68);
curveVertex(xbarbesup - 87, ybarbesup + 92);
curveVertex(xbarbesup - 33.07706, ybarbesup + 124.4924);
endShape();

//Nez
int xnez = xc + 1;
int ynez = yc - 99;
strokeWeight(1);
beginShape();
curveVertex(xnez - 14, ynez + 63);
curveVertex(xnez - 20, ynez + 12);
curveVertex(xnez - 14, ynez - 2);
curveVertex(xnez, ynez + 1);
curveVertex(xnez + 14, ynez - 2);
curveVertex(xnez + 20, ynez + 12);
curveVertex(xnez + 20, ynez + 61);
endShape();

//Narine
fill(0);
ellipse(xnez + 11, ynez + 6, 7,7);
ellipse(xnez - 11, ynez + 6, 7,7);

//Yeux
int xyeux = xc - 99;
int yyeux = yc - 99;
fill(113,41,8);
noStroke();
ellipse(xyeux + 23, yyeux, 20, 20);
fill(255);
ellipse(xyeux + 23, yyeux, 15, 15);
fill(0);
ellipse(xyeux + 23, yyeux, 10, 10);

fill(113,41,8);
noStroke();
ellipse(xyeux + 177, yyeux, 20, 20);
fill(255);
ellipse(xyeux + 177, yyeux, 15, 15);
fill(0);
ellipse(xyeux + 177, yyeux, 10, 10);

//sourcil
int xsourcil = xc + 1;
int ysourcil = yc - 99;
stroke(113,41,8);
strokeWeight(3);
line(xsourcil + 77, ysourcil - 10, xsourcil + 77, ysourcil - 15);
line(xsourcil - 77, ysourcil - 10, xsourcil - 77, ysourcil - 15);
line(xsourcil - 84, ysourcil - 7, xsourcil - 87, ysourcil - 13);
line(xsourcil + 84, ysourcil - 7, xsourcil + 87, ysourcil - 13);
line(xsourcil + 67, ysourcil - 13, xsourcil + 70, ysourcil - 7);
line(xsourcil - 67, ysourcil - 13, xsourcil - 70, ysourcil - 7);

//Dents
noStroke();
fill(255);

//dent gauche bas incliné
int xdentsgb = xc - 99;
int ydentsgb = yc - 99;
beginShape();
curveVertex(xdentsgb - 5, ydentsgb + 92);
curveVertex(xdentsgb - 3, ydentsgb + 58);
curveVertex(xdentsgb, ydentsgb + 48);
curveVertex(xdentsgb + 14, ydentsgb + 50);
curveVertex(xdentsgb + 16, ydentsgb + 60);
curveVertex(xdentsgb + 7, ydentsgb + 97);
endShape();

//dent gauche haut incliné
int xdentsgh = xc - 104;
int ydentsgh = yc - 77;
beginShape();
curveVertex(xdentsgh, ydentsgh);
curveVertex(xdentsgh + 2, ydentsgh + 6);
curveVertex(xdentsgh + 5, ydentsgh + 10);
curveVertex(xdentsgh + 19, ydentsgh + 12);
curveVertex(xdentsgh + 21, ydentsgh + 3);
curveVertex(xdentsgh + 12, ydentsgh - 11);
endShape();

//dent droite haut incliné
int xdentsdh = xc + 84;
int ydentsdh = yc - 77;
beginShape();
curveVertex(xdentsdh, ydentsgh);
curveVertex(xdentsdh + 2, ydentsdh + 3);
curveVertex(xdentsdh + 5, ydentsdh + 12);
curveVertex(xdentsdh + 19, ydentsdh + 14);
curveVertex(xdentsdh + 21, ydentsdh + 5);
curveVertex(xdentsdh + 12, ydentsdh - 11);
endShape();


//rangée dents basses
int xdentsbas = xc - 72;
int ydentsbas = yc - 7;
while (xdentsbas < (xc + 100)){
  beginShape();
  curveVertex((xdentsbas - 2), ydentsbas);
  curveVertex(xdentsbas, ydentsbas - 31);
  curveVertex((xdentsbas + int(random(3, 5))), int(random(ydentsbas - 41, ydentsbas - 39)));
  curveVertex((xdentsbas + int(random(13, 16))), int(random(ydentsbas - 43, ydentsbas - 39)));
  curveVertex((xdentsbas + 18), ydentsbas - 31);
  curveVertex((xdentsbas + 10), ydentsbas + 5);
  endShape();
  xdentsbas = xdentsbas + int(random(25, 29));
}

//rangée dents hautes
int xdentshaut = xc - 72;
int ydentshaut = yc - 43;
while (xdentshaut < (xc + 81)){
  beginShape();
  curveVertex((xdentshaut - 2), ydentshaut);
  curveVertex(xdentshaut, ydentshaut - 31);
  curveVertex((xdentshaut + int(random(3, 5))), int(random(ydentshaut - 25, ydentshaut - 21)));
  curveVertex((xdentshaut + int(random(13,16))), int(random(ydentshaut - 23, ydentshaut - 21)));
  curveVertex((xdentshaut + 18), ydentshaut - 31);
  curveVertex((xdentshaut + 10), ydentshaut + 5);
  endShape();
  xdentshaut = xdentshaut + int(random(25, 29));
}

//Rides
int xrides = xc + 1;
int yrides = yc - 99;
strokeWeight(2);
stroke(147, 117, 87);
noFill();
beginShape();
curveVertex(xrides - 94, yrides - 38);
curveVertex(xrides - 37, yrides - 35);
curveVertex(xrides, yrides - 41);
curveVertex(xrides + 32, yrides - 37);
curveVertex(xrides + 64.94733, yrides - 16.64911);
endShape();
beginShape();
curveVertex(xrides - 59, yrides - 37);
curveVertex(xrides + 7, yrides - 32);
curveVertex(xrides + 38, yrides - 29);
curveVertex(xrides + 73, yrides - 35);
curveVertex(xrides + 99.94733, yrides - 15.64911);
endShape();
beginShape();
curveVertex(xrides - 125, yrides - 8);
curveVertex(xrides - 82, yrides - 26);
curveVertex(xrides - 52, yrides - 27);
curveVertex(xrides - 32, yrides - 22);
curveVertex(xrides + 29, yrides - 18);
endShape();
beginShape();
curveVertex(xrides - 64, yrides - 34);
curveVertex(xrides - 15, yrides - 22);
curveVertex(xrides + 12, yrides - 21);
curveVertex(xrides + 36, yrides - 22);
curveVertex(xrides + 103, yrides - 33);
endShape();
beginShape();
curveVertex(xrides - 105, yrides - 36);
curveVertex(xrides - 50, yrides - 32);
curveVertex(xrides - 33, yrides - 29);
curveVertex(xrides - 11, yrides - 29);
curveVertex(xrides + 60, yrides - 28);
endShape();

//Corps
int xcorps = xc + 1;
int ycorps = yc - 99;
strokeWeight(2);
stroke(0);
fill(240, 202, 162);
beginShape();
curveVertex(xcorps - 9, ycorps + 83);
curveVertex(xcorps - 63, ycorps + 109);
curveVertex(xcorps - 98, ycorps + 149);
curveVertex(xcorps - 116, ycorps + 116);
curveVertex(xcorps - 117, ycorps + 101);
curveVertex(xcorps - 122, ycorps + 93);
curveVertex(xcorps - 135, ycorps + 92);
curveVertex(xcorps - 145, ycorps + 100);
curveVertex(xcorps - 142, ycorps + 113);
curveVertex(xcorps - 137, ycorps + 118);
curveVertex(xcorps - 124, ycorps + 150);
curveVertex(xcorps - 111, ycorps + 176);
curveVertex(xcorps - 90, ycorps + 172);
curveVertex(xcorps - 65, ycorps + 143);
curveVertex(xcorps - 54, ycorps + 144);
curveVertex(xcorps - 56, ycorps + 154);
curveVertex(xcorps - 61, ycorps + 181);
curveVertex(xcorps - 64, ycorps + 214);
curveVertex(xcorps - 37, ycorps + 220);
curveVertex(xcorps + 13, ycorps + 219);
curveVertex(xcorps + 45, ycorps + 217);
curveVertex(xcorps + 67, ycorps + 209);
curveVertex(xcorps + 57, ycorps + 162);
curveVertex(xcorps + 54, ycorps + 145);
curveVertex(xcorps + 68, ycorps + 150);
curveVertex(xcorps + 94, ycorps + 188);
curveVertex(xcorps + 107, ycorps + 218);
curveVertex(xcorps + 97, ycorps + 247);
curveVertex(xcorps + 102, ycorps + 254);
curveVertex(xcorps + 119, ycorps + 253);
curveVertex(xcorps + 127, ycorps + 237);
curveVertex(xcorps + 126, ycorps + 212);
curveVertex(xcorps + 108, ycorps + 163);
curveVertex(xcorps + 64, ycorps + 110);
curveVertex(xcorps - 1, ycorps + 68);
endShape();

//Slip
int xslip = xc + 1;
int yslip = yc + 101;
fill(#DE1704);
beginShape();
curveVertex(xslip - 62, yslip - 8);
curveVertex(xslip - 61, yslip - 21);
curveVertex(xslip - 74, yslip - 13);
curveVertex(xslip - 71, yslip - 2);
curveVertex(xslip - 74, yslip + 8);
curveVertex(xslip - 71, yslip + 16);
curveVertex(xslip - 74, yslip + 26);
curveVertex(xslip - 67, yslip + 35);
curveVertex(xslip - 48, yslip + 38);
curveVertex(xslip + 3, yslip + 38);
curveVertex(xslip + 48, yslip + 38);
curveVertex(xslip + 65, yslip + 36);
curveVertex(xslip + 72, yslip + 30);
curveVertex(xslip + 69, yslip + 22);
curveVertex(xslip + 73, yslip + 13);
curveVertex(xslip + 69, yslip + 3);
curveVertex(xslip + 73, yslip - 10);
curveVertex(xslip + 62, yslip - 22);
curveVertex(xslip + 64, yslip - 11);
curveVertex(xslip + 45, yslip - 11);
curveVertex(xslip + 1, yslip - 11);
curveVertex(xslip - 42, yslip - 10);
curveVertex(xslip - 60, yslip - 11);
curveVertex(xslip - 65, yslip - 14);
curveVertex(xslip - 61, yslip - 19);
endShape();

//sous slip
fill(255);
beginShape();
curveVertex(xslip + 2, yslip - 24);
curveVertex(xslip - 1, yslip + 2);
curveVertex(xslip - 14, yslip + 10);
curveVertex(xslip - 29, yslip + 15);
curveVertex(xslip - 44, yslip + 18);
curveVertex(xslip - 63, yslip + 21);
curveVertex(xslip - 74, yslip + 26);
curveVertex(xslip - 67, yslip + 35);
curveVertex(xslip - 48, yslip + 38);
curveVertex(xslip + 3, yslip + 38);
curveVertex(xslip + 48, yslip + 38);
curveVertex(xslip + 65, yslip + 36);
curveVertex(xslip + 72, yslip + 28);
curveVertex(xslip + 59, yslip + 21);
curveVertex(xslip + 26, yslip + 13);
curveVertex(xslip - 1, yslip + 2);
curveVertex(xslip - 9, yslip - 24);
endShape();

//Pieds
int xpied = xc - 99;
int ypied = yc + 101;
fill(240, 202, 162);
beginShape();
curveVertex(xpied + 47.0, ypied - 9);
curveVertex(xpied + 61.0, ypied + 40.0);
curveVertex(xpied + 62.0, ypied + 49.0);
curveVertex(xpied + 59.0, ypied + 59.0);
curveVertex(xpied + 53.0, ypied + 65.0);
curveVertex(xpied + 45.0, ypied + 69.0);
curveVertex(xpied + 45.0, ypied + 79.0);
curveVertex(xpied + 71.0, ypied + 80.0);
curveVertex(xpied + 86.0, ypied + 78.0);
curveVertex(xpied + 87.0, ypied + 67.0);
curveVertex(xpied + 83.0, ypied + 58.0);
curveVertex(xpied + 81.0, ypied + 40.0);
curveVertex(xpied + 87.0, ypied - 7);
endShape();

int xpied2 = xc + 101;
beginShape();
curveVertex(xpied2 - 47.0, ypied - 9);
curveVertex(xpied2 - 61.0, ypied + 40.0);
curveVertex(xpied2 - 62.0, ypied + 49.0);
curveVertex(xpied2 - 59.0, ypied + 59.0);
curveVertex(xpied2 - 53.0, ypied + 65.0);
curveVertex(xpied2 - 45.0, ypied + 69.0);
curveVertex(xpied2 - 45.0, ypied + 79.0);
curveVertex(xpied2 - 71.0, ypied + 80.0);
curveVertex(xpied2 - 86.0, ypied + 78.0);
curveVertex(xpied2 - 87.0, ypied + 67.0);
curveVertex(xpied2 - 83.0, ypied + 58.0);
curveVertex(xpied2 - 81.0, ypied + 40.0);
curveVertex(xpied2 - 87.0, ypied - 7);
endShape();

//poils nombril
strokeWeight(1);
stroke(0);
float xpoilsnomb = float(xc + 3);
float ypoilsnomb = float(yc);
float taillenomb = 45.0;
float phauteur = 87;
float plargeur = 10;
while (taillenomb >= 1) {
  int poils2 = 0;
  while (poils2 < 10) {    
    float xpn = random ((xpoilsnomb - (plargeur*log(taillenomb))), (xpoilsnomb + (plargeur*log(taillenomb))));
    line (xpn, (ypoilsnomb + phauteur), xpn, (ypoilsnomb + phauteur + random(2, 4)));
    poils2 = poils2 + 1;
  }
  taillenomb = taillenomb - 2;
  phauteur = phauteur - 1;
}

//tetons
int xtetons = xc;
int ytetons = yc;
stroke(147, 117, 87);
strokeWeight(1);
ellipse(xtetons + 35, ytetons + 43, 6, 4);
ellipse(xtetons - 35, ytetons + 43, 6, 4);

//pectoraux
int xpect = (xc - 100);
int ypect = yc;
noFill();
stroke(0);
beginShape();
curveVertex(xpect + 45, ypect + 17);
curveVertex(xpect + 52, ypect + 40);
curveVertex(xpect + 62, ypect + 49);
curveVertex(xpect + 81, ypect + 49);
curveVertex(xpect + 97, ypect + 43);
curveVertex(xpect + 130, ypect + 22);
endShape();

int xpect2 = (xc + 100);
beginShape();
curveVertex(xpect2 - 45, ypect + 17);
curveVertex(xpect2 - 52, ypect + 40);
curveVertex(xpect2 - 62, ypect + 49);
curveVertex(xpect2 - 81, ypect + 49);
curveVertex(xpect2 - 97, ypect + 43);
curveVertex(xpect2 - 130, ypect + 22);
endShape();

//poils sous menton
strokeWeight(1);
stroke(0);
float xpoilmenton = float(xc + 2);
float ypoilmenton = float(yc+15);
float taillementon = 40;
float phauteur2 = 6;
float plargeur2 = 20.5;
while (taillementon >= 1) {
  int poils3 = 0;
  while (poils3 < 18) {    
    float xpm = random ((xpoilmenton - (plargeur2*log(taillementon))), (xpoilmenton + (plargeur2*log(taillementon))));
    line (xpm, (ypoilmenton + phauteur2), xpm, (ypoilmenton + phauteur2 + random(2, 4)));
    poils3 = poils3 + 1;
  }
  taillementon = taillementon - 2;
  phauteur2 = phauteur2 - 1;
}

//plis slip
int xplisslip = xc - 100;
int yplisslip = yc;
stroke(0);
strokeWeight(1);
beginShape();
curveVertex(xplisslip + 43, yplisslip + 87);
curveVertex(xplisslip + 31, yplisslip + 99);
curveVertex(xplisslip + 35, yplisslip + 110);
curveVertex(xplisslip + 98, yplisslip + 96);
curveVertex(xplisslip + 177, yplisslip + 51);
endShape();

int xplisslip2 = xc + 100;
beginShape();
curveVertex(xplisslip2 - 43, yplisslip + 90);
curveVertex(xplisslip2 - 31, yplisslip + 102);
curveVertex(xplisslip2 - 35, yplisslip + 113);
curveVertex(xplisslip2 - 98, yplisslip + 96);
curveVertex(xplisslip2 - 177, yplisslip + 51);
endShape();

beginShape();
curveVertex(xplisslip + 42, yplisslip + 109);
curveVertex(xplisslip + 29, yplisslip + 122);
curveVertex(xplisslip + 35, yplisslip + 132);
//curveVertex(xplisslip + 62, yplisslip + 129);
curveVertex(xplisslip + 99, yplisslip + 106);
curveVertex(xplisslip + 141, yplisslip  + 28);
endShape();

int yplisslip2 = yc + 22;
beginShape();
curveVertex(xplisslip2 - 42, yplisslip + 109);
curveVertex(xplisslip2 - 31, yplisslip + 122);
curveVertex(xplisslip2 - 35, yplisslip + 132);
//curveVertex(xplisslip + 62, yplisslip + 129);
curveVertex(xplisslip2 - 99, yplisslip + 106);
curveVertex(xplisslip2 - 141, yplisslip  + 28);
endShape();

beginShape();
curveVertex(xplisslip - 1, yplisslip + 137);
curveVertex(xplisslip + 43, yplisslip + 139);
curveVertex(xplisslip + 62, yplisslip + 138);
curveVertex(xplisslip + 84, yplisslip + 129);
curveVertex(xplisslip + 101, yplisslip + 105);
curveVertex(xplisslip + 93, yplisslip + 76);
endShape();

beginShape();
curveVertex(xplisslip2 + 1, yplisslip + 137);
curveVertex(xplisslip2 - 43, yplisslip + 139);
curveVertex(xplisslip2 - 62, yplisslip + 138);
curveVertex(xplisslip2 - 84, yplisslip + 129);
curveVertex(xplisslip2 - 100, yplisslip + 105);
curveVertex(xplisslip2 - 93, yplisslip + 76);
endShape();

//Noeud slip
strokeWeight(2);
fill(#DE1704);

int xslipnoeud = xc - 100;
int yslipnoeud = yc;
beginShape();
curveVertex(xslipnoeud + 96, yslipnoeud + 74);
curveVertex(xslipnoeud + 91, yslipnoeud + 96);
curveVertex(xslipnoeud + 88, yslipnoeud + 125);
curveVertex(xslipnoeud + 97, yslipnoeud + 132);
curveVertex(xslipnoeud + 98, yslipnoeud + 120);
curveVertex(xslipnoeud + 99, yslipnoeud + 103);
curveVertex(xslipnoeud + 106, yslipnoeud + 83);
endShape();

int xslipnoeud2 = xc + 102;
beginShape();
curveVertex(xslipnoeud2 - 120, yslipnoeud + 74);
curveVertex(xslipnoeud2 - 95, yslipnoeud + 91);
curveVertex(xslipnoeud2 - 88, yslipnoeud + 125);
curveVertex(xslipnoeud2 - 97, yslipnoeud + 132);
curveVertex(xslipnoeud2 - 98, yslipnoeud + 120);
curveVertex(xslipnoeud2 - 99, yslipnoeud + 105);
curveVertex(xslipnoeud2 - 106, yslipnoeud + 83);
endShape();

int xslipnoeud3 = xc + 3;
beginShape();
curveVertex(xslipnoeud3 - 2, yslipnoeud + 69);
curveVertex(xslipnoeud3 - 8, yslipnoeud + 88);
curveVertex(xslipnoeud3 - 11, yslipnoeud + 94);
curveVertex(xslipnoeud3 - 8, yslipnoeud + 102);
curveVertex(xslipnoeud3 - 6, yslipnoeud + 105);
curveVertex(xslipnoeud3, yslipnoeud + 105);
curveVertex(xslipnoeud3, yslipnoeud  + 102);
curveVertex(xslipnoeud3 + 2, yslipnoeud + 99);
curveVertex(xslipnoeud3 + 5, yslipnoeud + 87);
curveVertex(xslipnoeud3 - 1, yslipnoeud + 91);
curveVertex(xslipnoeud3 - 2, yslipnoeud + 90);
curveVertex(xslipnoeud3 - 8, yslipnoeud + 88);
curveVertex(xslipnoeud3 - 31, yslipnoeud + 76);
endShape();

strokeWeight (1);
beginShape();
curveVertex(xslipnoeud + 111, yslipnoeud + 76);
curveVertex(xslipnoeud + 102, yslipnoeud + 90);
curveVertex(xslipnoeud + 99, yslipnoeud + 99);
curveVertex(xslipnoeud + 107, yslipnoeud + 116);
endShape();




