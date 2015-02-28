
void setup() {
  size(500, 500);
  smooth();
}

int monstergroesse = 20;
int umfang = 10;
float fressenX = random(10, 490);
float fressenY = random(10, 490);
int augengroesse = 5;
int pupillengroesse = 1;
int augenabstand = 4;
int mundverschiebung = 5;
int mundbreite = 5;
int mundhohe = 0;
int hohe = 3;


void draw() {

  noCursor();
  background(0);
  noStroke();
  //Körper  
  ellipse(mouseX, mouseY, monstergroesse, monstergroesse);
  //Fressen
  ellipse(fressenX, fressenY, 10, 10);
  stroke(1);
  //Augen
  ellipse(mouseX-augenabstand, mouseY-3, augengroesse, augengroesse);
  ellipse(mouseX+augenabstand, mouseY-3, augengroesse, augengroesse);
  //Pupillen
  fill(0);
  ellipse(mouseX-augenabstand, mouseY-3, pupillengroesse, pupillengroesse);
  ellipse(mouseX+augenabstand, mouseY-3, pupillengroesse, pupillengroesse);
  fill(255);
  //Mund
  ellipse(mouseX, mouseY+mundverschiebung, mundbreite, mundhohe);


  if (mouseX > fressenX-umfang  &&  mouseX < fressenX+umfang  &&  mouseY > fressenY-umfang  &&  mouseY < fressenY+umfang) {

    fressenX = random(10, 490);
    fressenY = random(10, 490);
    monstergroesse = monstergroesse+10;
    umfang = umfang+3;
    augengroesse = augengroesse+4;
    pupillengroesse = pupillengroesse+2;
    augenabstand = augenabstand+2;
    mundverschiebung = mundverschiebung+3;
    mundbreite = mundbreite+3;
    hohe = hohe+3;
    mundhohe = 0;
}

else{
mundhohe = 0;

}

if(monstergroesse < 250){
  if (mouseX > fressenX-umfang-40  &&  mouseX < fressenX+umfang+40  &&  mouseY > fressenY-umfang-40  &&  mouseY < fressenY+umfang+40) {
  mundhohe = mundhohe+hohe;
PFont font;
font = loadFont("ArialMT-48.vlw"); 
fill(255);
textFont(font,20); 
text("GIMME MORE!",180,25);
}}



 
 
  
  
  if(monstergroesse == 250){
   
    PFont font;
font = loadFont("ArialMT-48.vlw"); 
fill(255);
textFont(font,20); 
text("PLEASE, NO MORE!",180,25);
    
    
    augengroesse = 110;
    pupillengroesse = 75;
    noStroke();
    fill(255);
    rect(mouseX-40,mouseY+60,80,30);
    strokeWeight(1);
    stroke(0);
    noFill();
    bezier(mouseX-40,mouseY+60,mouseX,mouseY+70,mouseX,mouseY+70,mouseX+40,mouseY+90); 
   bezier(mouseX+40,mouseY+60,mouseX,mouseY+70,mouseX,mouseY+70,mouseX-40,mouseY+90); 
  fill(255);
}
  
  
   if(monstergroesse == 250){
  if (mouseX > fressenX-umfang-60  &&  mouseX < fressenX+umfang+60  &&  mouseY > fressenY-umfang-60  &&  mouseY < fressenY+umfang+60) {
  
  ellipse(mouseX,mouseY+75,120,50);
}}
  
  if (monstergroesse == 260) {
    monstergroesse = 20;
    umfang = 10;
    pupillengroesse = 1;
    augenabstand = 4;
    augengroesse = 5;
    mundverschiebung = 5;
    mundbreite = 5;
    hohe = 3;
    mundhohe = 0;
}


println(monstergroesse);
}


