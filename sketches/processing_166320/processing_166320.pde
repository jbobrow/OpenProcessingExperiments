

int pos;
int mov;
int col;

void setup(){
  size(255,255);
}
  
void draw(){
  
  // cambio de color de fondo
 background(255,pos,0);
  stroke(255);
  strokeWeight(4);
  
  line(mouseX+20,mouseY+20,mouseX-20,mouseY-20);
  line(mouseX-20,mouseY+20,mouseX+20,mouseY-20);
 
// cambio color de relleno. Rojo-negro
col = mouseX;
fill(col,0,0);

//esferas rojas

  pos = mouseY;
  ellipse(mouseX,mouseY,pos/2,pos/2);
  ellipse(mouseX-20,mouseY-20,pos/3,pos/3);
    ellipse(mouseX+20,mouseY-20,pos/3,pos/3);
    
    //esferas azules izquierda
 noStroke();
 //cambio de color de relleno. azul - negro
  fill(0,0,col);
 ellipse(mouseX+20,mouseY-20,pos/8,pos/8);
  ellipse(mouseX-20,mouseY-20,pos/8,pos/8);

 
  

  
  
  
}
  


