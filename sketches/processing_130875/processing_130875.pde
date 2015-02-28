
float angle = 0.0;
int lum = 255;
int blum = 51;
Boolean paused = true;

void setup() {
  size(1000,1000);
  noStroke();
  fill(255);
  rectMode(CENTER);
}

void draw() {
  if(paused){
    background(#aaaaaa);
    textSize(48);
    fill(#000000);
    text("Flickering Square Demo",200,400);
    textSize(32);
    text("Seizure warning! Contains flashing images.",150,800);
    text("Click within window and press P to start/pause.",130,870);
  }else{
    background(blum);
    if(millis()%(mouseX+1)>mouseX/2){
      noStroke();
      fill(lum);
      translate(500,500);
      rect(0, 0, mouseY, mouseY);
      fill(#FF0000);
      ellipse(0,0,5,5);
    }else{
      translate(500,500);
      fill(#FF0000);
      ellipse(0,0,5,5);
    }
  }
}

void keyPressed(){
  if(key==CODED){
    if(keyCode==UP && lum<245){
      lum = lum+10;
    }
    if(keyCode==DOWN && lum>10){
      lum = lum-10;
    }
    if(keyCode==LEFT && blum>10){
      blum = blum-10;
    }
    if(keyCode==RIGHT && blum<245){
      blum = blum+10;
    }
  }
  if(key=='p'){
    paused=!paused;
  }
}


