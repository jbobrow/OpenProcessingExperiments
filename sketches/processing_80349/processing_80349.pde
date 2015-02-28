
void setup(){
  size (400,200);
  noStroke();
}

void draw(){
  background (0);
  int i = 0;
  
    while (i <= 390){
      if (mousePressed){
        fill (random(255),random(255),random(255));
      }else{
        fill (random(255));
      }
      
      if (keyPressed){
        background (0);
        text("Yo me llamo Ralph!", 200, 100);
        textAlign(CENTER);
        textSize(30);
      }else{
        text("LUIS MAQUINERO!!!", 200, 100);
        textAlign(CENTER);
        textSize(30);
      }
      
      rect (i, 0, mouseX/10, 200);
      i = i + 10;
  }
}

