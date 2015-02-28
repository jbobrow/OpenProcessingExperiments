
PImage corazon;
float ample = 300;
float alt = 270;
int comptador = 0 ;
PFont font;

void setup(){
  size(400,400);
  corazon = loadImage("img.png");
  font = createFont("04B03REV", 45);
  textFont(font);
}

void draw(){
  imageMode(CENTER);
  background(0);
  if((comptador%50) < 25){
    ample = 300;
    alt = 270;
  }else if(comptador%50 > 25){
    ample = 320;
    alt = 290;
  }
  comptador += 1;  
  image(corazon,width/2,height/2,ample,alt);
  text("T'ESTIMO",width/2-92,height/2-10);
}



