
int p=500;
int a=0;

void setup(){
  background (250,60,10);
size(500,200);
PFont font;
font = loadFont("ARDECODE-40.vlw"); 
textFont(font); 
textAlign (CENTER);
}

void draw(){
  String s = " Pierino è un bambino coraggioso che ha degli amici animali: un'anatra, un uccellino ed un gatto.";
  fill(0);
  rect(0,60,500,50);
  p=p-1;
    fill(255);
  text(s, 20, p,400,200);

}

