
PImage manchester_united;
 
 
void setup(){
   
  size(480,360);
  manchester_united=loadImage("manchester_united.jpg");
  background(0);
 
 
 
}
 
void draw(){
 
  for (int x=0; x<manchester_united.width; x++){
    for (int y=0; y<manchester_united.height; y++){
      color esteColor;
      esteColor=manchester_united.get(x+int(random(-50,50)),y+int(random(-50+50)));
      set(x,y,esteColor);
    }
  }
   
  if(mousePressed){
  image(manchester_united,0,0);
  }
}


