
int counter;

int x=120;
int y=60;
int radio =12;

void setup ()  {   

size (240,120);
ellipseMode(RADIUS); 

} 

void draw () {
  background (200);
  float d= dist(mouseX,mouseY,x,y);
  if(d< radio){
    
    fill(0);
  } else  {
    fill (255);
    }
    ellipse (x,y,radio,radio);
    
    }
