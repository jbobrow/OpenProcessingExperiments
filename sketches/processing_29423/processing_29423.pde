
boolean button = false;

int x= 100;
int y= 100;
int b= 100;
int a= 100;
int r=255;
int g=255;
int l=255;
void setup(){
  size(300,300);
  
}
void draw(){
  if(mouseX>x && mouseX<x+b && mouseY>y && mouseY<y+a){
    g=0;
    l=0;
  }else{
   g=255;
    l=255;
}
  if(button){
    background (0,255,0);
  }else{
    background(0,0,255);
    
  }
 fill(r,g,l);
  rect(x,y,b,a);

}

void mousePressed(){
  if(mouseX>x && mouseX<x+b && mouseY>y && mouseY<y+a){
    button=!button;
    
}

}

