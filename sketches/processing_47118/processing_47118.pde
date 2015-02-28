
void setup(){
size (500,500);
smooth();
strokeWeight(30);
}  

void draw(){
  background(204);
  stroke (0);
  line(40,0,70,height);
  
  if (mousePressed==true){
    if (mouseButton==LEFT){
      stroke (255);
    }else{
  stroke (255,0,0);
  }
} line (0,70,width,50);
}

