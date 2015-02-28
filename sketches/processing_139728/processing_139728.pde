
int x = 0;
int y = 0;

int A;
int B;
int C;
int D;
int E;
int F;
int G;
int H;
 
void setup(){
  size(800,800);
  background(100);
  noCursor();
  A = int(random(0,800));
  B = int(random(0,800));
  C = int(random(0,800));
  D = int(random(0,800));
  E = int(random(0,800));
  F = int(random(0,800));
  G = int(random(0,800));
  H = int(random(0,800));

}

void draw(){
  
  noFill();


  if(mousePressed)
  {
    
  background(random(0,255),random(0,255),random(0,100));

  }
  
  bezier(width, mouseY%A, mouseX%B, mouseY%C, mouseX%D, mouseY%E, mouseX%F, 0);
 // bezier(0, mouseY%A, mouseX%B, mouseY%C, mouseX%D, mouseY%E, mouseX%F, height);
  
  bezier(width, 0, mouseX%B, mouseY%C, mouseX%D, mouseY%E, mouseX%F, height);


  
  
  //bezier(0, 600-mouseY, 100+mouseX, 300+mouseY, 500+mouseX, 600-mouseY, 800+mouseX, 0);
}
 
void mouseClicked()
{
  
A = int(random(0,800));
B = int(random(0,800));
C = int(random(0,800));
D = int(random(0,800));
E = int(random(0,800));
F = int(random(0,800));
G = int(random(0,800));
H = int(random(0,800));
}


