
PImage lobster;
void setup(){
  size(1000,250);
    background(175,235,50);
  lobster=loadImage("baby-lobster copy.png");
}

void draw(){

  noStroke();
  for(int i=0; i<1000; i=i+20){
    for(int j=0; j<1000; j=j+30){
      
    fill(random(200),random(30),random(120));
    rect(i,j,random(20),random(30));
    
    textSize(50);
    fill(200,220,230);
    text("pokemans",i,j);
    tint(255,255,255,10);
    image(lobster,mouseX,mouseY);
    }
  }
}

