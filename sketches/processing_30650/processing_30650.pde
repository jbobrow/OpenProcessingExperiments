
int counter;
 
void setup() {  
  size(800, 400);
  background(255);  
  colorMode(HSB);   //cores modo matiz, saturação e brilho
  counter = 0;
}
 
void draw() {  //desenhar loops
  ellipse(mouseX, mouseY, 50,50);//tamanho dos circulos
  fill(random(255),50,0,50);//preenchimento dos circulos (cor)
  
   
  if(mousePressed == true) { // interacçao
    ellipse(mouseX, mouseY, 50, 50);
    fill(255,100,255,random(50));
 
  }
}
 
                
                
