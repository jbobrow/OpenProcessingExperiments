
PImage bg;
PImage deadEnd;
PImage card;
PImage endstreet;

void setup() {
  size(500,500);
  bg = loadImage("beton.jpg");
  deadEnd = loadImage("sackgasse.jpg");
  endstreet = loadImage("endstreet.jpg");
  card = loadImage("karte.jpg");  
}

void draw(){
  image(bg,0,0,width,height);
  
  image(deadEnd, mouseX, mouseY, mouseX/2, mouseY/2);
  if(mousePressed){
    image(card, width-mouseX, mouseY);
  }
  if(frameCount%10==0){
    image(endstreet, width/2, mouseY);
  }  
}

