
int pocitadlo = 1;

void setup (){
  size (320,240);
  background (100);
stroke(150);
}
void draw(){
  background(0);
  
  pushStyle();

  fill(0,20);

    popStyle();
  
  for (int i = 0;i <width; i += 1){
    line(i, mouseY + noise ( (frameCount-i) / 40.0 ) *height, mouseX + i, height-10) ;
  }
}

void keyPressed(){
  if(key== 'n'){
    pocitadlo += 10;
  }
  
  }

  
