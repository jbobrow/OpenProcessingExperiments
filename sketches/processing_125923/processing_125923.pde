
int monsterY;
int monsterX;

int richting;
int teller;
boolean test;

void setup() {
  size(200, 200);
  monsterY = 100;
  monsterX= 50;
  richting=3;
  teller=0;
  test= true;
}

void draw() {
  background(255);

 
  monsterX= mouseX;
 
  stroke(0);
  ellipseMode(CENTER); 
    if (test==true){fill(61,165,60);}
  if (test==false){
    fill(255,0,0);}
  ellipse(monsterX, monsterY-30, 100, 70);
  fill(255);
  ellipse(monsterX-20,monsterY-65,40,40);
  ellipse(monsterX+20, monsterY-65,40,40);
  fill(0);
  ellipse (monsterX-10, monsterY-60, 10,10);
  ellipse (monsterX+10, monsterY-60, 10,10);
  fill (240,189,235);
  stroke(240,189,235);
   ellipse (monsterX-35, monsterY-30, 12,12);
   ellipse (monsterX+35, monsterY-30,12,12);
  fill (0);
  stroke(0);
  ellipse( monsterX, monsterY-15,40,20);
 
 monsterY=monsterY+richting;
  if(monsterY>200||monsterY<0){
   
    richting=-richting;
    teller=teller+1;
  }
 if(teller==10){
   teller=0;
   test=!test;
 }

 println (teller);
 println (test);
}
