
int y=0;
int x=0;

void setup() {
  size(640, 360);  
  noStroke(); 
background (255);
    
  
}


  int szamlalo=0;


void draw() { 
    
  if (szamlalo<1000 ){
  haromszog();  
  }
  
  szamlalo++;

}

void haromszog(){
int trianglesize=(int)random(100);
  int x1=(int)random(width);
  int x2=x1;
  int x3=x1+trianglesize;
  int y1=(int)random(height);
  int y2=y1+trianglesize;
  int y3=y1;
  
  int r=(int)random(255);
  int o=(int)random(255);
  fill(r,128,128,o);
  
  triangle(x1,y1,x2,y2,x3,y3);
  
}
  

