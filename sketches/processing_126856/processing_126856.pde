
int monsterX;
int monsterY;
int teller;
int kleur;
int richting;
boolean test;
int stop;
int spatie;
int breedte;
int hoogte;
 
void setup() {
  size(300, 300);
  monsterX=55;
  monsterY=100;
  kleur = 125;
  richting=10;
  spatie = 60;
  stop = 300;
  breedte = 10;
  hoogte = 10;
  teller = 5;
}
 
void draw() {
       background(0);
fill(150, 150, 1);
for(int i=0; i < 15; i ++){
rect(random(0,300),random(0,300),10,30);
}
 
  for(int i = 0; i < 5; i++) {
    kleur = kleur + i;
  }
  if(kleur >= 255) {
    kleur = 0;
  }
 
 
  
  
     if(test == true) {
  fill(0);
  } else {
  fill(100, 300, 15);
  }
   //*body*//
   
   rect(monsterX +50, monsterY +50, 20, 6, 5);  //rechteram 100, 100
   rect(monsterX, monsterY, 50, 60, 100);  //body// x75 y70
   
   //*face*//
   
   line(monsterX +12, monsterY+50, monsterX+40, monsterY+50); //mond//75,15 //115, 135
  
 ellipseMode(CENTER);
  
     if(test == true) {
  fill(0);
  } else {
  fill(300, 1, 1);
  }
  line(monsterX +15, monsterY, monsterX+10, monsterY -25);//antenne 110, 70, 110, 50
    
  ellipse(monsterX +10, monsterY -25, 8, 8);//antennebol 110, 50
 
 
    if(test == true) {
  fill(0);
  } else {
  fill(300, 1, 1);
  }
  
  //*body*//
  
  rect(monsterX +4, monsterY +69, 20, 12, 2);//linkerbeen 29 149
  rect(monsterX +26, monsterY +69, 20, 12, 2);//rechterbeen 61 149
 
    if(test == true) {
  fill(0);
  } else {
  fill(100, 300, 15);
  }
  rect(monsterX -20, monsterY +50, 20, 6, 5);//linkerarm 55, 100
  
  //*face*//
 
  fill(300, 1, 1);
 
  ellipse(monsterX +15, monsterY+25, 15, 15);//oog links
  ellipse(monsterX +37, monsterY+25, 15, 15);//oog rechts
  
   
   if(test == true) {
  fill(0);
  } else {
  fill(100, 300, 15);
  }
  
  fill(100, 300, 15);
  
  ellipse(monsterX +15, monsterY+25, 8, 8);//oog midden links
  ellipse(monsterX +37, monsterY+25, 8, 8);//oog midden rechts
   
    
  monsterX = monsterX + richting;
  if(monsterX > 270 || monsterX < 0){
    richting = -richting;
    teller++;
  }
    
  if(teller == 10) {
    teller = 0;
    test = !test;
 
 
}
}
