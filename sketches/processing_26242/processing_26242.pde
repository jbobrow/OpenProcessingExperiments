
int x;
PFont Calibri;
PFont Geneva;
PImage supdog;

void setup(){
  size(600,520);
  x=0;
  Calibri = loadFont("Calibri-Bold-48.vlw");
  Geneva = loadFont("Geneva-36.vlw");
  supdog = loadImage("Sup_Dog.jpeg");
}

void draw(){

  tint(165,217,227);
  fill(255);
    image(supdog,0,0);
  textFont(Geneva);
  fill(0);
  text("dog",300,450);
  
  fill(255);
  textSize(100);
  textFont(Calibri);
  text("WUT",mouseX,mouseY);
  

}

