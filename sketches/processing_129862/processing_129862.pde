
float angle = 0.0;
int lum = 255;
int blum = 51;

void setup() {
  size(1000,1000);
  noStroke();
  fill(255);
  rectMode(CENTER);
}

void draw() {
  if(mousePressed){
    angle = angle-.2*(mouseX/10.);
  }else{
    angle = angle+.2*(mouseX/10.);
  }
  background(blum);
  noStroke();
  fill(lum);
  translate(angle%1000,500);
  rect(0, 0, mouseY, mouseY);   
  fill(#FF0000);
  ellipse(0,0,5,5);
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
}
    


