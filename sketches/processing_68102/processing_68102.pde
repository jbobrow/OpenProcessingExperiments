

void setup(){
  size(425,400);
  noFill();
  smooth();
  strokeWeight(6.0);
  background(255);
}

void draw(){
  background(255);
  //aro azul
  stroke(0,0,255);
  arc(100,200,100,100,0,2*PI);
  
  //aro amarillo  
  stroke(255,255,0);
  arc(160,250,100,100,0,2*PI);
  
  //aro negro
  stroke(0,0,0);
  arc(220,200,100,100,0,2*PI);

  //aro verde
  stroke(0,255,0);
  arc(280,250,100,100,0,2*PI);

  //aro rojo  
  stroke(255,0,0);
  arc(mouseX,mouseY,100,100,0,2*PI);
  
}

