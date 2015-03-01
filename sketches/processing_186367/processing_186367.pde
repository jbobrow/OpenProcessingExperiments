
int nc = 10;
int nCercles = 10;
int np = 10;
int nPoints = 10;
boolean zAnim = true;
float zDecal = 100;
boolean dAnim = true;
float dMin = 50;
float dMax = 400;
boolean rdAnim = true;
float rdDecal = 2;
boolean rzAnim = true;
float rzDecal = 2;
boolean seuilAnim = true;
float seuilMin = 100;
float seuilMax = 100;
float seuil,targetSeuil;
boolean actifAnim = true;
int actifMin = 100;
int actifMax = 100;
int actifTotal, targetActifTotal;
float[] z = new float[nCercles];
float[] targetz = new float[nCercles];
float[] d = new float[nCercles];
float[] targetd = new float[nCercles];
float[][] rd = new float[nCercles][nPoints];
float[][] targetrd = new float[nCercles][nPoints];
float[][] rz = new float[nCercles][nPoints];
float[][] targetrz = new float[nCercles][nPoints];
float[] cosa = new float[nPoints];
float[] sina = new float[nPoints];
boolean[][] actif = new boolean[nCercles][nPoints];
boolean RUN = true;
boolean dessinCercles = false;
boolean variWeight = true;
float WEIGHT = 2.0;
int fond = 0;
int couleur = 255;
float vitesse = 0.03;
boolean noir = true;

void setup() {
  size(600, 600, OPENGL);
  background(fond);
  noLights();
  reset();
}

void reset() {
  actifTotal = 0;
  targetActifTotal = round(random(actifMin,nc*np));
  seuil = seuilMin;
  targetSeuil = random(seuilMin,seuilMax);
  for(int i=0;i<nc;i++) {
    z[i] = 0.0;
    targetz[i] = random(-zDecal,zDecal);
    d[i] = 0.0;
    targetd[i] = random(dMin,dMax);
    for(int j=0;j<np;j++) {
      rd[i][j] = 0.0;
      targetrd[i][j] = random(-rdDecal,rdDecal);
      rz[i][j] = 0.0;
      targetrz[i][j] = random(-rzDecal,rzDecal);
      actif[i][j]=false;
    }
  }
  float angle = TWO_PI/np;
  for(int i=0;i<np;i++) {
    cosa[i] = cos(angle*i);
    sina[i] = sin(angle*i);
  }
}

void draw() {
  if(mousePressed) {
    if(mouseButton==LEFT) {
      dMax = mouseX;
      dMax = constrain(dMax,100,400);
      zDecal = mouseY;
      zDecal = constrain(zDecal,100,400);
    } else if(mouseButton==RIGHT) {
      rdDecal = mouseX*0.1;
      rdDecal = constrain(rdDecal,0,100);
      rzDecal = mouseY*0.1;
      rzDecal = constrain(rzDecal,0,100);
    }
  }
  update();
  background(fond);
  camera(250, 400, 700.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
  dessiner();
}

void update() {
  if(np<nPoints) {
    //while(np<nPoints) {
      for(int i=0;i<nc;i++) {
        rd[i] = (float[])append(rd[i],0.0);
        targetrd[i] = (float[])append(targetrd[i],random(-rdDecal,rdDecal));
        rz[i] = (float[])append(rz[i],0.0);
        targetrz[i] = (float[])append(targetrz[i],random(-rzDecal,rzDecal));
        actif[i] = (boolean[])append(actif[i],false);
      }
    //}
    np++;
    cosa = new float[np];
    sina = new float[np];
    float angle = TWO_PI/np;
    for(int i=0;i<np;i++) {
      cosa[i] = cos(angle*i);
      sina[i] = sin(angle*i);
    }
  } else if(np>nPoints) {
    //while(np<nPoints) {
      for(int i=0;i<nc;i++) {
        rd[i] = (float[])subset(rd[i],0,np-1);
        targetrd[i] = (float[])subset(targetrd[i],0,np-1);
        rz[i] = (float[])subset(rz[i],0,np-1);
        targetrz[i] = (float[])subset(targetrz[i],0,np-1);
        if(actif[i][np-1]) {
          actifTotal--;
        }
        actif[i] = (boolean[])subset(actif[i],0,np-1);
      }
    //}
    np--;
    cosa = new float[np];
    sina = new float[np];
    float angle = TWO_PI/np;
    for(int i=0;i<np;i++) {
      cosa[i] = cos(angle*i);
      sina[i] = sin(angle*i);
    }
    targetActifTotal = constrain(targetActifTotal,0,nc*np);
  }
  if(nc<nCercles) {
    //while(nc<nCercles) {
      nc++;
      z = (float[])append(z,0.0);
      targetz = (float[])append(targetz,random(-zDecal,zDecal));
      d = (float[])append(d,0.0);
      targetd = (float[])append(targetd,random(dMin,dMax));
      rd = (float[][])append(rd,new float[np]);
      targetrd = (float[][])append(targetrd,new float[np]);
      rz = (float[][])append(rz,new float[np]);
      targetrz = (float[][])append(targetrz,new float[np]);
      actif = (boolean[][])append(actif,new boolean[np]);
      for(int i=0;i<np;i++) {
          rd[nc-1][i] = 0.0;
          targetrd[nc-1][i] = random(-rdDecal,rdDecal);
          rz[nc-1][i] = 0.0;
          targetrz[nc-1][i] = random(-rzDecal,rzDecal);
          actif[nc-1][i] = false;
      }
    //}
  } else if(nc>nCercles) {
    //while(nc>nCercles) {
      int actifSupr = 0;
      for(int i=0;i<np;i++) {
        if(actif[nc-1][i]) {
          actifSupr++;
        }
      }
      actifTotal -= actifSupr;
      actif = (boolean[][])subset(actif,0,nc-1);
      z = (float[])subset(z,0,nc-1);
      targetz = (float[])subset(targetz,0,nc-1);
      d = (float[])subset(d,0,nc-1);
      targetd = (float[])subset(targetd,0,nc-1);
      rd = (float[][])subset(rd,0,nc-1);
      targetrd = (float[][])subset(targetrd,0,nc-1);
      rz = (float[][])subset(rz,0,nc-1);
      targetrz = (float[][])subset(targetrz,0,nc-1);
      nc--;
      targetActifTotal = constrain(targetActifTotal,0,nc*np);
    //}
  }
  if(RUN) {
    if(actifAnim) {
      if(actifTotal>targetActifTotal) {
        boolean trouve = false;
        int stepMax = 100;
        int step = 0;
        while(step<stepMax && !trouve) {
          int i = round(random(nc-1));
          int j = round(random(np-1));
          if(actif[i][j]) {
            actif[i][j] = false;
            actifTotal--;
            trouve = true;
          }
          step++;
        }
      } else if(actifTotal<targetActifTotal) {
        boolean trouve = false;
        int stepMax = 100;
        int step = 0;
        while(step<stepMax && !trouve) {
          int i = round(random(nc-1));
          int j = round(random(np-1));
          if(!actif[i][j]) {
            actif[i][j] = true;
            actifTotal++;
            trouve = true;
          }
          step++;
        }
      } else {
        targetActifTotal = round(random(round(nc*np*actifMin/100),round(nc*np*actifMax/100)));
      }
    }
    if(seuilAnim) {
      seuil = seuil+(targetSeuil-seuil)*vitesse;
      if(abs(targetSeuil-seuil)<0.1) {
        targetSeuil = random(seuilMin,seuilMax);
      }
    }
    for(int i=0;i<nc;i++) {
      if(zAnim) {
        z[i] = z[i]+(targetz[i]-z[i])*vitesse;
        if(abs(targetz[i]-z[i])<0.1) {
          targetz[i] = random(-zDecal,zDecal);
        }
      }
      if(dAnim) {
        d[i] = d[i]+(targetd[i]-d[i])*vitesse;
        if(abs(targetd[i]-d[i])<0.1) {
          targetd[i] = random(dMin,dMax);
        }
      }
      if(rdAnim || rzAnim) {
        for(int j=0;j<np;j++) {
          if(rdAnim) {
            rd[i][j] = rd[i][j]+(targetrd[i][j]-rd[i][j])*vitesse;
            if(abs(targetrd[i][j]-rd[i][j])<0.1) {
              targetrd[i][j] = random(-rdDecal,rdDecal);
            }
          }
          if(rzAnim) {
            rz[i][j] = rz[i][j]+(targetrz[i][j]-rz[i][j])*vitesse;
            if(abs(targetrz[i][j]-rz[i][j])<0.1) {
              targetrz[i][j] = random(-rzDecal,rzDecal);
            }
          }
        }
      }
    }
  }
}
  
void dessiner() {
  strokeJoin(ROUND);
  stroke(couleur);
  strokeWeight(WEIGHT);
  noFill();
  float seuilSq = seuil*seuil;
  float decal = (rdDecal>rzDecal)? rdDecal : rzDecal;
  float seuilSq2 = (seuil+decal)*(seuil+decal);
  for(int i=0;i<nc;i++) {
    if(dessinCercles) {
      for(int j=0;j<np-1;j++) {
        if(!actif[i][j]) {
          continue;
        }
        for(int k=j+1;k<np;k++) {
          if(!actif[i][k]) {
            continue;
          }
          float dx = cosa[k]*(d[i]+rd[i][k])-cosa[j]*(d[i]+rd[i][j]);
          float dy = sina[k]*(d[i]+rd[i][k])-sina[j]*(d[i]+rd[i][j]);
          float dz = z[i]+rz[i][k]-z[i]+rz[i][j];
          float distance = dx*dx+dy*dy+dz*dz;
          if(distance<seuilSq) {
            if(variWeight) {
              int w = round(map(sqrt(distance),0,seuil,255,0));
              stroke(couleur,w);
            }
            line(cosa[j]*(d[i]+rd[i][j]),sina[j]*(d[i]+rd[i][j]),z[i]+rz[i][j],
                 cosa[k]*(d[i]+rd[i][k]),sina[k]*(d[i]+rd[i][k]),z[i]+rz[i][k]);
          }
        }
      }
    }
    for(int j=i+1;j<nc;j++) {
      if((z[j]-z[i])*(z[j]-z[i])+(d[j]-d[i])*(d[j]-d[i])>seuilSq2) {
        continue;
      }
      for(int k=0;k<np;k++) {
        if(!actif[i][k]) {
          continue;
        }
        for(int l=0;l<np;l++) {
          if(!actif[j][l]) {
            continue;
          }
          float dx = cosa[k]*(d[i]+rd[i][k])-cosa[l]*(d[j]+rd[j][l]);
          float dy = sina[k]*(d[i]+rd[i][k])-sina[l]*(d[j]+rd[j][l]);
          float dz = z[i]+rz[i][k]-z[j]+rz[j][l];
          float distance = dx*dx+dy*dy+dz*dz;
          if(distance<seuilSq) {
            if(variWeight) {
              int w = round(map(sqrt(distance),0,seuil,255,0));
              stroke(couleur,w);
            }
            line(cosa[k]*(d[i]+rd[i][k]),sina[k]*(d[i]+rd[i][k]),z[i]+rz[i][k],
                 cosa[l]*(d[j]+rd[j][l]),sina[l]*(d[j]+rd[j][l]),z[j]+rz[j][l]);
          }
        }
      }
    }
  }
}

void keyPressed() {
  switch (key) {
    case ' ':
    reset();
    break;
  }
  if(keyCode==LEFT) {
    if(nPoints>1) {
      nPoints--;
    }
  } else if(keyCode==RIGHT) {
    if(nPoints<15) {
      nPoints++;
    }
  } else if(keyCode==DOWN) {
    if(nCercles>2) {
      nCercles--;
    }
  } else if(keyCode==UP) {
    if(nCercles<15) {
      nCercles++;
    }
  }
}


