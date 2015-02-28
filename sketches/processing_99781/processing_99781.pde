
void setup() {
  size(500,500);
 
}

void draw(){
 background(0,0,0);
  noStroke();
  fill(255,255,255);
  rect(235,30,30,400);

if((mouseY>150)&&(mouseY<350)){
  noStroke();
  fill(255,255,255);
  rect(150,mouseY,200,30);
  }
  if (mouseY>350){
    rect(150,350,200,30);
  }
  
  if (mouseY<150){
    rect(150,150,200,30);
  }

  
  if((mouseY>340)&&(mouseY<360)){
    textSize(30);
    fill(255,000,00);
    text("666",220,370);
        }
}
