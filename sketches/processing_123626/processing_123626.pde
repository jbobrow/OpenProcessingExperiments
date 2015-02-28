
void setup(){
size(700, 500);
}

void draw(){
  if(mouseY<width/2){
    background(#87CEFA);
  }
  else {
    background(#1C1C1C);
  }

  if(mouseY<width/2){
    fill(#006400);
    ellipse(100,420,450,400);
    ellipse(320,400,450,400);
    ellipse(520,420,450,400);
    ellipse(720,400,450,400);
  }
  else {
    fill(#003300);
    ellipse(100,420,450,400);
    ellipse(320,400,450,400);
    ellipse(520,420,450,400);
    ellipse(720,400,450,400);
  }
  

    if(mouseY<width/2){
      fill(235);
      stroke(230);
    }
    else{
      fill(30);
      stroke(20);
    }
    rect(316,140,68,85);
    if(mouseY<width/2){
      fill(225);
      stroke(220);
    }
    else{
      fill(40);
      stroke(35);
    }
    rect(332.5,70,35,70);
    //Criação do topo da torre 1
    
    
    translate(300, 225); 
    if(mouseY<width/2){
      fill(245);
      stroke(240);
    }
    else{
      fill(20);
      stroke(15);
    }
    rect(0,0,100,160);
    //Criação da base da torre 1
    
    if(mouseY<width/2){
      fill(0);
    }
    else{
      fill(#FFFF00);
    }
    stroke(#000000);
    rect(37,110,26,50);
    
    if(mouseY<width/2){
      fill(0);
    }
    else{
      fill(#FFFF00);
    }
    stroke(#000000);
    rect(40,-50,20,32);
    
    pushMatrix();
    for (int i=0; i<19; i++) {
      translate(-10,5); 
      if(mouseY<width/2){
        fill(245-i*5);
        stroke(240-i*5);
      }
      else{
        fill(20+i*5);
        stroke(25+i*5);
      }
      rect(0,0,10,152-(i*5));
      //Criação das paredes em escada da esquerda
    }
    popMatrix();
    
    pushMatrix();
    for (int i=0; i<19; i++) {
      if(i==0){
        translate(100,5);
      }
      else {
        translate(10,5); 
      }
      if(mouseY<width/2){
        fill(245-i*5);
        stroke(240-i*5);
      }
      else{
        fill(20+i*5);
        stroke(25+i*5);
      }
      rect(0,0,10,152-(i*5));
      //Criação das paredes em escada da esquerda
    }
    popMatrix();
        
    if(mouseY<width/2){
      fill(#009900);
    }
    else{
      fill(#006400);
    }
    noStroke();
    rect(-300,158,800,800);
    
    
}


