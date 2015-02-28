
void setup(){
  size(1200,1000);
}

void draw(){
  background(255);                           //Achtergrond kleur
  rectMode(CENTER);                          //Vierkant in het midden
  fill(0,0,0);                               //Kleur lichaam  
  rect(mouseX,mouseY, 20, 100);              //Lichaam
  rect(mouseX -30,mouseY, 75, 10);           //Batwing
  rect(mouseX -20,mouseY +5, 45, 10);        //Batwing
  rect(mouseX -10,mouseY +10, 25, 10);       //Batwing
  rect(mouseX +30,mouseY, 75, 10);           //Batwing
  rect(mouseX +20,mouseY +5, 45, 10);        //Batwing
  rect(mouseX +10,mouseY +10, 25, 10);       //Batwing
  rect(mouseX -14,mouseY -78, 15, 10);       //Bathoorn
  rect(mouseX +14,mouseY -78, 15, 10);       //Bathoorn
  fill(255,255,0);                           //Kleur logo
  rect(mouseX,mouseY,10,10);                 //Logo
  fill(0,0,0);                               //Kleur hoofd  
  ellipse(mouseX, mouseY -50, 60, 60);       //Hoofd
  fill(0,0,200);                             //Kleur ogen
  ellipse(mouseX -10, mouseY -50, 16, 16);   //Linker oog
  ellipse(mouseX +10, mouseY -50, 16, 16);   //Rechter oog
  line(mouseX +10, mouseY +50, mouseX +30, mouseY +85);    //Rechter been
  line(mouseX -10, mouseY +50, mouseX -30, mouseY +85);     //Linker been
}
