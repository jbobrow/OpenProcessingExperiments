
PImage imagen;
void setup(){
  size(1000,1000);
  imagen=loadImage("/Users/juanpabloriquelmedehoyos/Desktop/tumblr_lp93flWG3o1qji737o1_1280.png");
image(imagen,0,0);
}
 
void draw(){
  for(int x=0;x<imagen.width;x++){
    for(int y=0;y<imagen.height;y++){
    color este;
      este=imagen.get(x+int(random(-50,10)),y+int(random(-50,10)));
      set(x+450,y,este);
    }
  }
}
