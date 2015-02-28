
PFont cli;
PFont clo;
float angulo=0.0;

void setup(){
  size(1024,768);
smooth();
background(255);
cli = loadFont("Clarendon-Light-72.vlw");
clo = loadFont("Clarendon-Bold-72.vlw");
textFont(cli);
}

void draw(){
if(mousePressed){
  smooth();
fill (random(50,150),random(50),0,random(255));
translate(mouseX,mouseY);
rotate(angulo);
textFont(clo);
textSize(random(20,100));
text ("Café",0,0);
fill (255,255,255,random(255));
textFont(cli);
textSize(random(72));
text ("Café",0,0);
angulo=random(360);
}
else
{
   if(keyPressed) {
    if (key == ' ') {
     background(255);
    }
   }
}


}


