
//Aquí posarem els booleans
ceniza[] b;
boolean iClicat, dClicat;
 
//En el setup posarem el tamany del sketch 
void setup(){
  
  size(500, 500);
  smooth();
  stroke(240);
  fill(240, 200);
  iClicat = dClicat = false;
 
  b = new ceniza[50];
  for (int i=0; i<50; i++){
    
    b[i] = new ceniza();
    b[i].x = random(0, 500);
    b[i].y = random(0, 500);
    b[i].d = 10;
    b[i].v = 5;
    b[i].c = #7E2121;
    b[i].s = 1;
  }
}
 
//Utilitzarem arrays, importants per fer-ho 
void draw(){
  
 
  background(238,112,53);
  for (int i=0; i<b.length; i++){
    
    b[i].move();
    b[i].show();
    if (iClicat) b[i].s = -1;
    if (dClicat) b[i].s = 1;
  }
}
 
void keyPressed(){
  
  if (key == 'i') iClicat = true;
  if (key == 'I') iClicat = true;
  if (key == 'd') dClicat = true;
  if (key == 'D') dClicat = true;
}
 
void keyReleased(){
  
  if (key == 'i') iClicat = false;
  if (key == 'I') iClicat = false;
  if (key == 'd') dClicat = false;
  if (key == 'D') dClicat = false;
}
 
//Farem classes per el comportament emergent 
class ceniza {
  
  float x, y;
  int d, v, c, s, z;
 
  void show(){
    
    fill(107,75,90);
    rect(x, y, d, d);
  }
 
//I en el move configurarem el limit d'on arriba 
  void move(){
    
    x = x+v*s;
    y = y+v+random(-1,1);
    
    if (x <0){
      
      x = 500;
       
    }
    
    if (x >500){
      
      x = 0;
      
    }
    
    if (y <0) {
      y = 500;
    }
    if (y > 500) {
      y = 0;
    }
  }
}



