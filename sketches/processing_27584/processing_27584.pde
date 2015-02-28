
int[] cubex = new int [600];
int[] cubey = new int [600];
int[] cR = new int [600];
int[] cG = new int [600];
int[] cB = new int [600];
int[] cW = new int [600];
float colo;
int colorad = round(colo);
boolean colorado = false;
int colors = -1000;
int squiggle = 0;
int sizex=800;
int sizey=800;
int directx = 1;
float directX;
int directy = 1;
float directY;
int[] dir = new int [600];
float direction = random(100);
void setup() {
  noCursor();
  background(255);
  boolean xtru = true;
  boolean ytru = true;
  size(800,800);
  smooth();
  for (int i=0; i<200; i++) {
    cubey[i] = int(random(1,(sizey-15)));
    cubex[i] = int(random(1,(sizex-15)));
    cR[i] = int(random(100,255));
    cG[i] = int(random(100,255));
    cB[i] = int(random(100,255));
    cW[i] = int(random(150,255));
  }
}
int counter = 0;
void draw() { 
  noStroke();
  for(int i=0; i<200; i++) {
    if (colors < 0 && colorado == false) {
      if (dist(mouseX,mouseY,cubex[i],cubey[i])<100) {
        fill(cR[i],0,0);
      }
      if (dist(mouseX,mouseY,cubex[i],cubey[i])>100
        && dist(mouseX,mouseY,cubex[i],cubey[i])<200) {
        fill(cR[i],cG[i],0);
      }
      if (dist(mouseX,mouseY,cubex[i],cubey[i])>200) {
        fill(0,cG[i],0);
      }
    }
    if (colors > 0 && colors < 1001 && colorado == false) {
      if (dist(mouseX,mouseY,cubex[i],cubey[i])<100) {
        fill(cR[i],cG[i],0);
      }
      if (dist(mouseX,mouseY,cubex[i],cubey[i])>100
        && dist(mouseX,mouseY,cubex[i],cubey[i])<200) {
        fill(0,cG[i],0);
      }
      if (dist(mouseX,mouseY,cubex[i],cubey[i])>200) {
        fill(0,cG[i],cB[i]);
      }
    }
    if (colors < 2001 && colors >1000 && colorado == false) {
      if (dist(mouseX,mouseY,cubex[i],cubey[i])<100) {
        fill(0,cG[i],0);
      }
      if (dist(mouseX,mouseY,cubex[i],cubey[i])>100
        && dist(mouseX,mouseY,cubex[i],cubey[i])<200) {
        fill(0,cG[i],cB[i]);
      }
      if (dist(mouseX,mouseY,cubex[i],cubey[i])>200) {
        fill(0,0,cB[i]);
      }
    }
    if (colors < 3001 && colors >2000 && colorado == false) {
      if (dist(mouseX,mouseY,cubex[i],cubey[i])<100) {
        fill(0,cG[i],cB[i]);
      }
      if (dist(mouseX,mouseY,cubex[i],cubey[i])>100
        && dist(mouseX,mouseY,cubex[i],cubey[i])<200) {
        fill(0,0,cB[i]);
      }
      if (dist(mouseX,mouseY,cubex[i],cubey[i])>200) {
        fill(cR[i],0,cB[i]);
      }
    }
    if (colors >3000 && colors <4001 && colorado == false) {
      if (dist(mouseX,mouseY,cubex[i],cubey[i])<100) {
        fill(0,0,cB[i]);
      }
      if (dist(mouseX,mouseY,cubex[i],cubey[i])>100
        && dist(mouseX,mouseY,cubex[i],cubey[i])<200) {
        fill(cR[i],0,cB[i]);
      }
      if (dist(mouseX,mouseY,cubex[i],cubey[i])>200) {
        fill(cR[i],0,0);
      }
    }
    if (colors>4000&&colors< 5001 && colorado == false) {
      if (dist(mouseX,mouseY,cubex[i],cubey[i])<100) {
        fill(cR[i],0,cB[i]);
      }
      if (dist(mouseX,mouseY,cubex[i],cubey[i])>100
        && dist(mouseX,mouseY,cubex[i],cubey[i])<200) {
        fill(cR[i],0,0);
      }
      if (dist(mouseX,mouseY,cubex[i],cubey[i])>200) {
        fill(cR[i],cG[i],0);
      }
    }
        if (colorado == true) {
          if(cubey[i]>mouseY-100 && cubey[i]<mouseY+100){
            fill(cW[i]);
          }
      if (dist(mouseX,mouseY,cubex[i],cubey[i])<100) {
        fill(cR[i],cG[i],0);
      }
      if (dist(mouseX,mouseY,cubex[i],cubey[i])>100
        && dist(mouseX,mouseY,cubex[i],cubey[i])<200) {
         /*if (dist(mouseX,mouseY,cubex[i],cubey[i])>100
          && cubey[i]<(mouseY+150) && cubey[i]>(mouseY-150)
          && cubex[i]>mouseX+90){
            fill(cW[i]);
          } else {*/
        fill(cR[i],0,0);
      }
        
      if (dist(mouseX,mouseY,cubex[i],cubey[i])>100) {
        if (dist(mouseX,mouseY,cubex[i],cubey[i])>00
          && cubey[i]<(mouseY+50) && cubey[i]>(mouseY-50)
          && dist(mouseX,mouseY,cubex[i],cubey[i])>50 
          && cubex[i]>mouseX){
            fill(cW[i]);
          } else if (dist(mouseX,mouseY,cubex[i],cubey[i])>200 
          && (cubey[i]>mouseY+100 || cubey[i]<mouseY-100)) {
        fill(0,0,cB[i]);
      } else if (dist(mouseX,mouseY,cubex[i],cubey[i])>100 
      && dist(mouseX,mouseY,cubex[i],cubey[i])<200) {
        fill(cR[i],0,0);
      }
    }
        }
    if (colors>5000 && colorado == false) {
      colors = -1000;
    }
    ellipse(cubex[i],cubey[i],30,30);
    float direct = random(-1,1);
    int directx = round(direct);
    int directy = round(direct)*-1;
  }
  for(int j=0; j<200; j++) {
    if (mouseX<(sizex*.75)&&mouseX>(sizex/2+75)) {
      cubex[j]++;
      if (cubex[j]>=sizex+30) {
        cubex[j] =-30;
        cubey[j] = int(random(1,(sizey-15)));
      }
    }
      if (mouseX>(sizex*.75)) {
      cubex[j]+=2;
      if (cubex[j]>=sizex+30) {
        cubex[j] =-30;
        cubey[j] = int(random(1,(sizey-15)));
      }
    }
    if (mouseX>(sizex/4)&&mouseX<(sizex/2-75)) {
      cubex[j]--;
      if (cubex[j]<=-30) {
        cubex[j] = sizex+30;
        cubey[j] = int(random(1,(sizey-15)));
      }
    }
      if (mouseX<(sizex/4)) {
      cubex[j]-=2;
      if (cubex[j]<=-30) {
        cubex[j] = sizex+30;
        cubey[j] = int(random(1,(sizey-15)));
      }
    }
    if (mouseX>=(sizex/2)-75 && mouseX<=(sizex/2)+75){
      if (cubey[j]<=-30){
        cubey[j]=sizey+30;
      }
      if (cubey[j]>=sizey+30){
        cubey[j]=-30;
      }
    }
    if (mouseY>(sizey/2+75)&&mouseY<(sizex*.75)) {
      cubey[j]++;
      if (cubey[j]>=sizey+30) {
        cubey[j] = -30;
        cubex[j] = int(random(1,(sizex-15)));
      }
    }
      if (mouseY>(sizey*.75)) {
      cubey[j]+=2;
      if (cubey[j]>=sizey+30) {
        cubey[j] = -30;
        cubex[j] = int(random(1,(sizex-15)));
      }
      }
    if (mouseY<(sizey/2-75)&&mouseY>(sizey/4)) {
      cubey[j]--;
      if (cubey[j]<=-30) {
        cubey[j] =sizey+30;
        cubex[j] = int(random(1,(sizex-15)));
      }
    }
       if (mouseY<(sizey/4)) {
      cubey[j]-=2;
      if (cubey[j]<=-30) {
        cubey[j] =sizey+30;
        cubex[j] = int(random(1,(sizex-15)));
      }
    }
     if (mouseY>=(sizey/2-75) && mouseY<=(sizey/2+75)){
      if (cubex[j]<=-30){
        cubex[j]=sizex+30;
      }
      if (cubex[j]>=sizex+30){
        cubex[j]=-30;
      }
    }
    if (mouseX>(sizex/2)-75 && mouseX<(sizex/2)+75) {
      cubey[j]+=directy;
      squiggle++;
      if (squiggle>=200) {
        squiggle = 0;
        directy*=-1;
        directx*=-1;
      }
      if (cubey[j]>=sizey+30) {
        cubey[j] = -30;
        cubex[j] = int(random(1,(sizex-15)));
      }
      if (cubey[j]<=-30) {
        cubey[j] =sizey+30;
        cubex[j] = int(random(1,(sizex-15)));
      }
    } 
    if (mouseY>(sizex/2)-75 && mouseY<(sizex/2)+75) {
      cubex[j]+=directx;
      squiggle++;
      directY= random(-1,1);
      directX= random(-1,1);
      directy=round(directY);
      directx=round(directX);
      if (squiggle>=100) {
        squiggle = 0;
        directy*=-1;
        directx*=-1;
      }
      if (cubex[j]>=sizex+30) {
        cubex[j] =-30;
        cubey[j] = int(random(1,(sizey-15)));
      }
      if (cubex[j]<=-30) {
        cubex[j] = sizex+30;
        cubey[j] = int(random(1,(sizey-15)));
      }
    }
    if (mousePressed && (mouseButton == LEFT)) {
      cubey[counter] = int(random(1,(sizey-15)));
      cubex[counter] = int(random(1,(sizex-15)));
      cR[counter] = int(random(100,255));
      cG[counter] = int(random(100,255));
      cB[counter] = int(random(100,255));
      cW[counter] = int(random(150,255));
      colors++;
      colorado = false;
       if (colors>5000 && colorado == false){
        colors = -1000;
       }
      }
    }
    if(mousePressed && (mouseButton == RIGHT)) {
      colorado = true;
      cR[counter] = int(random(225,255));
      cG[counter] = int(random(225,255));
      cB[counter] = int(random(100,255));
      cW[counter] = int(random(150,255));
    }
    counter++;
    if (counter>200) {
      counter=0;
    }
    /*colo = random(1000);
    colorad = round(colo);
    if (colorad == 420){
      colorado = true;
    }*/
  }

                                        
