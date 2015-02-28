
void setup(){
  size(500,500);
  background(179,115,232);
  noStroke();
}

void draw (){
  fill(234,122,102);
  ellipse(250,250,250,250);
  fill(242,64,219);
  ellipse(107,150,150,150);
  fill(240,174,231);
  ellipse(185,88,150,150);
  fill(127,117,227);
  ellipse(285,80,150,150);
  fill(134,221,237);
  ellipse(370,120,150,150);
  fill(5,5,5);
  ellipse(210,230,50,50);
  fill(5,5,5);
  ellipse(305,230,50,50);
  fill(5,5,5);
  triangle(230,300,260,255,280,300);
  fill(252,0,30);
  ellipse(250,340,80,40);
  
  
}
  
  
  
  void mousePressed(){
    
    if(mouseButton==RIGHT){
      save("circulo.png");
    }
      if(mouseButton==LEFT){
        save("circulo.gif");
      }
        if(mouseButton==CENTER){
          save("circulo.jpg");
        }
          
  }
  

