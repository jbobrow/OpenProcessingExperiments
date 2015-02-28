
int monsterX=212;
int monsterY=212;
int richting=5;
int teller=0;
int backgroundR=20;
int Rchange=1;
int backgroundG=160;
int Gchange=1;
int backgroundB=180;
int Bchange=1;
boolean test=false;

void setup () {
  size(500, 500);
}

void draw () { 
  background(backgroundR,backgroundG,backgroundB);
    monsterX = monsterX + richting;
    backgroundR = backgroundR + Rchange;
    backgroundG = backgroundG + Gchange;
    backgroundB = backgroundB - Bchange;
    if(backgroundB==0){
      backgroundR=20;
      backgroundG=160;
      backgroundB=180;
      Gchange=Gchange + 10; }
    
  
   if(monsterX>500 || monsterX<0){
     richting = -richting;
     teller = teller +1;
     println(teller);
     println(test); }
   
   if(teller>9){
    teller = 0;
    test = !test; } 
    
  if(test==false){fill(#E8781C);}
  if(test==true){fill(#FF1C1C);}
  rect(monsterX-75, monsterY-145, 200, 250);
  fill(#76A2C6);
  rect(monsterX-50, monsterY-120, 50, 80);
  rect(monsterX+50, monsterY-120, 50, 80);
  fill(0);
  rect(monsterX-15, monsterY-90, 15, 50);
  rect(monsterX+50, monsterY-90, 15, 50);
  fill(#E84F1C);
  rect(monsterX+12, monsterY-30, 25, 50);
  rect(monsterX, monsterY, 12, 20);      // 100, 170
  rect(monsterX+37, monsterY, 12, 20);
  fill(#9D918D);
  rect(monsterX-50, monsterY+40, 150, 40);
  if(test==false){fill(#E8781C);}
  if(test==true){fill(#FF1C1C); 
  triangle(monsterX-45,monsterY-145,monsterX-75,monsterY-183,monsterX-75,monsterY-145); 
  triangle(monsterX+95,monsterY-145,monsterX+125,monsterY-183,monsterX+125,monsterY-145); }
  rect(monsterX+15, monsterY+105, 30, 80);
  rect(monsterX-5, monsterY+200, 20, 60);
  rect(monsterX+45, monsterY+200, 20, 60);
  rect(monsterX-5, monsterY+180, 70, 20);
  rect(monsterX-45, monsterY+130, 150, 20); 
  for(int i = 0; i < 255; i = i + 1){
    backgroundR = backgroundR - i; }
}

