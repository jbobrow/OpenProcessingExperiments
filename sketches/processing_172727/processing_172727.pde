
int ell = 1;
int el = 1;
int aa = 1;
void setup(){
  size(500,500);
 background(random(255));
stroke(1); 
}


void drawIt(){
  ell = mouseX;
  el = mouseY;
  for(int i=0 ;i < 10; i++){
    ellipse(mouseX,mouseY,ell,el);
    el /= 2;
    ell /= 2;
  }
}

int swag(){
   while(aa < 10){
     triangle(mouseX,mouseY,mouseX/2,mouseY/2,mouseX*3,mouseY*2);
     aa++;
   }
   aa = 1;
   return int(random(11));
}


void keyPressed(){
 drawIt(); 
}

void draw(){
  swag();
  
}
