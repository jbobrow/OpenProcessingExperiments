
int w = 400;
int h = 400;
int posX = w/2;
int posY = h/2-60;
int fond_rouge = 0;
int fond_vert = 0;
int fond_bleu = 0;
int in_blur = 20;
int out_blur = 20;
int epaisseur = 3;
int color_red = 61;
int color_green = 135;
int color_blue = 191;
int opacite = 100;
int nbInterieur = 60;
int nbRepetEtoile = 30;
int [][] arrayContour = new int [][] {
  { 
    posX-(posX-146), posY+(205-posY), 
    posX+(333-posX), posY+(200-posY), 
    posX+(308-posX), posY-(posY-120), 
    posX+(228-posX), posY-(posY-55), 
    posX-(posX-158), posY-(posY-55), 
    posX-(posX-91), posY-(posY-115), 
    posX-(posX-56), posY+(200-posY), 
    posX-(posX-146), posY+(205-posY), 
    posX+(333-posX), posY+(200-posY), 
    posX+(308-posX), posY-(posY-120)
    }
  };
int [][] cEtoile = new int [][] {
  {
    posX-(posX-186), posY-(posY-131), 
    posX-(posX-189), posY-(posY-126), 
    posX+(201-posX), posY-(posY-127), 
    posX+(201-posX), posY-(posY-135), 
    posX+(208-posX), posY-(posY-129), 
    posX+(211-posX), posY-(posY-138), 
    posX+(200-posX), posY-(posY-138), 
    posX+(206-posX), posY+(148-posY), 
    posX-(posX-199), posY+(148-posY), 
    posX-(posX-195), posY+(140-posY), 
    posX-(posX-190), posY+(148-posY), 
    posX-(posX-181), posY+(144-posY), 
    posX-(posX-195), posY-(posY-138), 
    posX-(posX-178), posY-(posY-137), 
    posX-(posX-181), posY-(posY-131), 
    posX-(posX-191), posY-(posY-134), 
    posX-(posX-189), posY-(posY-129), 
    posX-(posX-189), posY-(posY-127)
    }
  };
  int[][] tableauInBlur = new int[in_blur][arrayContour[0].length];
int[][] tableauOutBlur = new int[out_blur][arrayContour[0].length];
int[][] tableauInterieur = new int[nbInterieur][arrayContour[0].length];
int[][] tableauEtoile = new int[nbRepetEtoile][cEtoile[0].length];
PShape s;
PShape e;



void setup() {
  noLoop();
  size(w, h, P2D);
  background(fond_rouge, fond_vert, fond_bleu);
  smooth();
  frameRate(30);
  for (int j=0;j<in_blur;j++) {
    for (int c=0;c<tableauInBlur[0].length;c++) {
      if (c%2==0) {
        if (arrayContour[0][c]<posX) {
          tableauInBlur[j][c] = int(arrayContour[0][c]+j);
        }
        else {
          tableauInBlur[j][c] = int(arrayContour[0][c]-j);
        }
      }
      else {
        if (arrayContour[0][c]<posY) {
          tableauInBlur[j][c] = int(arrayContour[0][c]+j);
        }
        else {
          tableauInBlur[j][c] = int(arrayContour[0][c]-j);
        }
      }
    }
  }
  for (int j=0;j<out_blur;j++) {
    for (int c=0;c<tableauOutBlur[0].length;c++) {
      if (c%2==0) {
        if (arrayContour[0][c]<posX) {
          tableauOutBlur[j][c] = int(arrayContour[0][c]-j);
        }
        else {
          tableauOutBlur[j][c] = int(arrayContour[0][c]+j);
        }
      }        
      else {
        if (arrayContour[0][c]<posY) {
          tableauOutBlur[j][c] = int(arrayContour[0][c]-j);
        }
        else {
          tableauOutBlur[j][c] = int(arrayContour[0][c]+j);
        }
      }
    }
  }
  for (int j=0;j<nbInterieur;j++) {
    for (int c=0;c<tableauInterieur[0].length;c++) {
      if (c%2==0) {
        if (arrayContour[0][c]<posX) {
          tableauInterieur[j][c] = int(arrayContour[0][c]+j);
        }
        else {
          tableauInterieur[j][c] = int(arrayContour[0][c]-j);
        }
      }
      else {
        if (arrayContour[0][c]<posY) {
          tableauInterieur[j][c] = int(arrayContour[0][c]+j);
        }
        else {
          tableauInterieur[j][c] = int(arrayContour[0][c]-j);
        }
      }
    }
  }
  for (int j=0;j<nbRepetEtoile;j++) {
    for (int c=0;c<tableauEtoile[0].length;c++) {
      if (c%2==0) {
        if (cEtoile[0][c]<posX) {
          tableauEtoile[j][c] = int(cEtoile[0][c])-j;
        }
        else {
          tableauEtoile[j][c] = int(cEtoile[0][c]+j);
        }
      }
      else {
        if (cEtoile[0][c]<posY) {
          tableauEtoile[j][c] = int(cEtoile[0][c])-j;
        }
        else {
          tableauEtoile[j][c] = int(cEtoile[0][c]+j);
        }
      }
    }
  }
}





void draw() {
  background(fond_rouge, fond_vert, fond_bleu);
  creerTentacule();
  creerEtoile();
  creerInterieur();
  creerContour();
  creerEffets();
}






void creerTentacule() {
  for (int i=0;i<200;i+=5) {
    int unRandom = int(random(-20, 40)); 
    noFill();
    stroke(150, random(50, 100));
    strokeWeight(random(1, 3));
    beginShape();
    curveVertex(posX-(posX-100)+unRandom+i, 210);
    curveVertex(posX-(posX-85)+unRandom+i, 210);
    curveVertex(posX-(posX-85)+unRandom+i, 244+unRandom);
    curveVertex(posX-(posX-102)+unRandom+i, 280+unRandom);
    curveVertex(posX-(posX-78)+unRandom+i, 346+unRandom);
    endShape();
  }
}

void creerEtoile() {
  for (int u=0;u<nbRepetEtoile;u++) {
    noFill();
    strokeWeight(random(1, 2));
    stroke(199, 223, 242, random(10, 30));
    e = createShape();
    for (int d=0;d<cEtoile[0].length;d++) {
      e.curveVertex(tableauEtoile[u][d], tableauEtoile[u][d+=1]);
    }
    e.end();
    for (int m = 0; m < e.getVertexCount(); m++) {
      PVector v = e.getVertex(m);
      v.x += 1;
      v.y += 1;
      e.setVertex(m, v);
    }
    shape(e);
  }
}

void creerInterieur() {
  for (int u=0;u<nbInterieur;u++) {
    noFill();
    strokeWeight(random(1, 2));
    stroke(59, 140, 132, random(10, 20));
    s = createShape();
    for (int d=0;d<arrayContour[0].length-7;d++) {
      s.curveVertex(tableauInterieur[u][d], tableauInterieur[u][d+=1]);
    }
    s.end();
    int count = 4;
    while (count>0) {
      for (int m = 0; m < s.getVertexCount(); m++) {
        PVector v = s.getVertex(m);
        v.x += random(-4, 4);
        v.y += random(-4, 4);
        s.setVertex(m, v);
      }
      shape(s);
      count--;
    }
  }
}

void creerContour() {
  noFill();
  strokeWeight(epaisseur);
  for (int u=0;u<in_blur;u++) {
    stroke(color_red, color_green, color_blue, map(u, 0, in_blur, opacite, 0));
    beginShape();
    for (int d=0;d<tableauInBlur[0].length;d++) {
      curveVertex(tableauInBlur[u][d], tableauInBlur[u][d+=1]);
    }
    endShape(CLOSE);
  }
  for (int t=0;t<out_blur;t++) {
    stroke(color_red, color_green, color_blue, map(t, 0, out_blur, opacite, 0));
    beginShape();
    for (int r=0;r<tableauOutBlur[0].length;r++) {
      curveVertex(tableauOutBlur[t][r], tableauOutBlur[t][r+=1]);
    }
    endShape(CLOSE);
  }
}

void creerEffets() {
  for (int i = 0;i<75;i++) {
    fill(199, 223, 242, map(i, 0, 100, 10, 0));
    ellipse(posX-5, posY, 20+i, 20+i);
  }
  int nbParticules = 150;
  for (int i=0;i<nbParticules;i++) {
    noStroke();
    int unRandom = int(random(1, 4));
    fill(118, 255, 247, random(10, 180));
    ellipse(random(posX-70, posX+70), random(posY-60, posY+60), unRandom, unRandom);
  }
  for (int i = 0;i<75;i++) {
    fill(199, 223, 242, map(i, 0, 50, 10, 0));
    ellipse(posX-5, posY, 20+i, 20+i);
  }
}
