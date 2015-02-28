
void setup(){
  size(500,500);
  noStroke();
}
 
void draw(){
  background(255,250,205);
  if(mouseX>150 && mouseX<350 && mouseY>150 && mouseY<350){
    fill(0,0,255);
  }
  else{
    fill(250,100,5);
  }
  rectMode(CENTER);
  rect(250,250,200,200);
}
