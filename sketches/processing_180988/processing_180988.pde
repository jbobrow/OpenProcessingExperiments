

Yess[] b;

void setup(){

  size(1000,900);
  //CONFIGUREM L'ARRAY
  b = new Yess[150];
  for(int i=0; i<150; i++)
  {
    
    b[i] = new Yess();
    b[i].y = random(-height,height*3);
    b[i].x = random(-width,width*2);
    
 
  }
}

class Yess{

  //creem la classe i asignem el valor dels rectangles amb les respectives variables
  float x, y;
  float a,g,p,o;
 
  void show(){
  
    fill(random(123,255));
    stroke(g,p,o, a--);
    rect(x--,y, a,a);
  }
 }

void draw(){
  //background random amb la funcio show assignada
  background(random(255),random(130),random(255));
  for(int i=0; i<b.length; i++)
  {
    
    b[i].show();
     
 
}
}


