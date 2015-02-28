
void setup() {
  size(600,600);
}

void draw(){
  background(255);
  
  for(int i=-10; i<600; i = i+20){
    for(int j=-10; j<600; j = j+20) {   

    textSize(30);
    fill(j,i,mouseY,mouseX);
    text("O",i,j);
    
    
    rect(50,j,50,j);
    rect(j,50,j,50);
    rect(150,j,50,j);
    rect(250,j,50,j);
    rect(350,j,50,j);
    rect(450,j,50,j);
    rect(550,j,50,j);
    rect(j,150,j,50);
    rect(j,250,j,50);
    rect(j,350,j,50);
    rect(j,450,j,50);
    rect(j,550,j,50);
    
    
  }
}
}

