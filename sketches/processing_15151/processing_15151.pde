

size(600,800);
smooth();
background(255);
noFill();
rectMode(CENTER);
 
int ANZX=12+2;//Mit Abstand
int ANZY=20+2;//Mit Abstand
int rand=0;//Anfangs-Zufall
int rndStep=90/ANZY;//Winkel-Änderung
int w=width/ANZX;//Breite Würfewl
int h=height/ANZY;//Höhe Würfel
for (int j=2;j<ANZY;j++){
      rand+=rndStep;//Zufal vergrößern
  for (int i=2;i<ANZX;i++) {
    pushMatrix();
    float zufall=random(-rand/2,rand/2);
    translate(i*w-w/2+zufall/3,j*h-h/2+zufall/3);
    rotate(radians(zufall));
    rect(0,0,w,h);
    popMatrix();
  }
}

