


PImage poffin;


void setup(){
  
  size(556,372);
  poffin=loadImage("poffin.jpg");
  background(0);



}

void draw(){

  for (int x=0; x<poffin.width; x++){
    for (int y=0; y<poffin.height; y++){
      color esteColor;
      esteColor=poffin.get(x+int(random(-50,50)),y+int(random(-50+50)));
      set(x,y,esteColor);
    }
  }
  
  if(mousePressed){
  image(poffin,0,0);
  }
}


