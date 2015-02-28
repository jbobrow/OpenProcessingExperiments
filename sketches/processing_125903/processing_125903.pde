
int monsterY;
boolean kleurtje;

int richting;
int teller;
float i=50;

void setup(){
size(500,500);
monsterY=500;
richting=-5;
kleurtje=true;
teller=0;

}
void draw(){
  background(0);
  //teller dat er iets gebeurt wanneer monster Y deze coordinaten raakt
monsterY = monsterY + richting;
  if (monsterY == -100 || monsterY == 600) {
  richting = -richting;
 teller = teller+1;
 println(teller);
  }
  if (teller==10){
    kleurtje= !kleurtje;
    teller = 0;
  }
  //teller linksboven in de hoek
  text(teller, 15, 35);
  textSize(30);
  fill(26);

fill(172,220,95);

//verandering van de kleur
if (kleurtje == false){fill(140,4,113);}
if (kleurtje == true){fill(172,220,95);}

//alle vierkantjes waar het monster uit bestaat
rect(mouseX-50,monsterY-10,10,10);
rect(mouseX-50,monsterY,10,10);
rect(mouseX-50,monsterY+10,10,10);
rect(mouseX-50,monsterY+20,10,10);
rect(mouseX-40,monsterY+10,10,10);
rect(mouseX-40,monsterY+20,10,10);
rect(mouseX-40,monsterY+30,10,10);
rect(mouseX-40,monsterY+50,10,10);
rect(mouseX-30,monsterY-20,10,10);
rect(mouseX-30,monsterY,10,10);
rect(mouseX-30,monsterY+10,10,10);
rect(mouseX-30,monsterY+20,10,10);
rect(mouseX-30,monsterY+30,10,10);
rect(mouseX-30,monsterY+40,10,10);
rect(mouseX-20,monsterY-10,10,10);
rect(mouseX-20,monsterY,10,10);
rect(mouseX-20,monsterY+20,10,10);
rect(mouseX-20,monsterY+30,10,10);
rect(mouseX-10,monsterY,10,10);
rect(mouseX-10,monsterY+10,10,10);
rect(mouseX-10,monsterY+20,10,10);
rect(mouseX-10,monsterY+30,10,10);
rect(mouseX,monsterY,10,10);
rect(mouseX,monsterY+10,10,10);
rect(mouseX,monsterY+20,10,10);
rect(mouseX,monsterY+30,10,10);
rect(mouseX+10,monsterY,10,10);
rect(mouseX+10,monsterY+10,10,10);
rect(mouseX+10,monsterY+20,10,10);
rect(mouseX+10,monsterY+30,10,10);
rect(mouseX+20,monsterY-10,10,10);
rect(mouseX+20,monsterY,10,10);
rect(mouseX+20,monsterY+20,10,10);
rect(mouseX+20,monsterY+30,10,10);
rect(mouseX+30,monsterY-20,10,10);
rect(mouseX+30,monsterY,10,10);
rect(mouseX+30,monsterY+10,10,10);
rect(mouseX+30,monsterY+20,10,10);
rect(mouseX+30,monsterY+30,10,10);
rect(mouseX+30,monsterY+40,10,10);
rect(mouseX+40,monsterY+10,10,10);
rect(mouseX+40,monsterY+20,10,10);
rect(mouseX+40,monsterY+30,10,10);
rect(mouseX+40,monsterY+50,10,10);
rect(mouseX+50,monsterY-10,10,10);
rect(mouseX+50,monsterY,10,10);
rect(mouseX+50,monsterY+10,10,10);
rect(mouseX+50,monsterY+20,10,10);

}
