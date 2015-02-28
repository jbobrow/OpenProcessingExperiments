
PFont holes, abecedario ; //= variables pour les polices


void setup()
{
  size(750,450);
 textAlign(CENTER);//bien
 background(255);
 noLoop();
 //importer les polices du dossier data:
 holes = loadFont("18HolesBRK-48.vlw");
 abecedario = loadFont("Abecedario-Bold-48.vlw");
} 
void draw(){
textFont(holes,48);
fill(255,0,0,255);
translate(width/2,height/2);
text("That is Processing");

 int nd = 10;
 float ad=TWO_PI/nd;

for (int i=0; i<nd;i++) {
 rotate(ad);
textFont(abecedario,48);
fill(0,0,255,128);
text("It's amazing!",20,75);
 }
 // if (nd == 10){
   /* textAlign(RIGHT);
  for (int i=0; i<nd;i++) {
 rotate(ad);
textFont(abecedario,48);
fill(0,0,255,128);
text("It's amazing!",20,75); 
// }
  }*/
}

