
/*@pjs preload="apple_black.png,apple_white.png";*/

PImage img,img2;

void setup(){
img=loadImage("apple_black.png");
img2=loadImage("apple_white.png");
size(450, 450); 
}

int mx=-1,my=0;
void draw(){
int x=0,y=0;
while(y<height){ 
x=0;
while(x<width){
image(img,x,y);
x+=img.width; 
}
y+=img.height;
}
if(mx>=0){
image(img2,(int)(mx/img2.width)*img2.width, (int)(my/img2.height)*img2.height);
}
}

void mouseMoved(){
mx=mouseX;
my=mouseY;
}

void mousePressed(){ 
  background(mouseX, 0, mouseY);
}

  


