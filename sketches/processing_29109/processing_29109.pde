
void setup() {
   size(1024, 640);
   background(255);
   smooth();
   noStroke(); 
}

int ScrX = screen.width;
int ScrY = screen.height;
int ColNum = 0;
int LinNum = 0;
int Pix = 32;

int deg = 1;
float mod = 0.1;

void draw() {
  
  int CorX =  constrain(mouseX,0,255);
  int CorY = constrain(mouseY,0,255);
  
  
  deg = deg + 1;
   if(deg > 255) {  
    deg = 1;  
  }
  
  
  mod = mod + 0.1;
   if(mod > 1) {  
    mod = 0.1;  
  }
  
  ColNum = ScrX/Pix;
  LinNum = ScrY/Pix;
  
  int PosX = (mouseX/Pix)*Pix;
  int PosY = (mouseY/Pix)*Pix;
 
 for (int i = 0; i < ScrX; i = i+Pix) {
  for (int j = 0; j < ScrY; j = j+Pix) {
    color AleaCol=color( CorX*mod,int(deg/acos(mod)),CorY*mod,random(50) );
    
    fill(AleaCol);
    rect(i, j, Pix, Pix);
    color AleaCol2=color( CorX,deg,CorY,random(50) );
     fill(AleaCol2);
    rect(PosX, PosY, Pix, Pix);
    
   
  }
}
}

