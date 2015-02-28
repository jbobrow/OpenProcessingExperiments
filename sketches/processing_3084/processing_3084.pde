

int space=10;
int kareW=10;
int kareH=10;
int kareX=0;
int kareY=0;

void setup(){
  size(200,200);
  background(255);
}


// draw space
void kareBosluk(){
  if(kareX == 200){
    kareX = 0;
    kareY = kareY+space;
    
    constrain(kareY,0,200);
  }

if(kareY == 200){
  kareX=0;
  kareY=0;
  }

}
//draw space end


//draw rectangle, fill it with random rgb value according to mouse position
void kareCiz(){
int r = int (random (1,255));
if (mouseX > 100){
  r = 0;
}
int g = int (random (1,255));
if (mouseX > 100){
  g = 100;
}

int b = int (random (1,255));
if (mouseY < 100){
  b = 255;
}

  
  noStroke();
  fill(r,g,b);
  rect(kareX,kareY,kareW,kareH);
  kareX=kareX+space;
}

//draw rectange end

void draw(){

  kareBosluk();
  kareCiz();
  
}

