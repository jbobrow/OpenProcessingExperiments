
int r=255;
int g=0;
int b=0;

int dim=30;

int fade=20;

star[] starArray=new star[30];


void setup() {

  size(800, 800);
  
  for(int i=0; i<starArray.length; i++){
int x=int(random(width));
int y=int(random(height));
int leng=int(random(50,200));

starArray[i]=new star(x,y,leng);

}
  
}


void draw() {


  fill(0, fade);

  rect(0, 0, width, height);

  noStroke();
  fill(r, g, b);
  ellipse(mouseX, mouseY, dim, dim);


  dim=abs(pmouseX-mouseX)*2;
  dim=abs(pmouseY-mouseY)*2;
  fade=pmouseX-mouseX;
  fade=pmouseY-mouseY;


  if (r>255) {
    r=0;
  }

  if (g>255) {
    g=0;
  }

  if (b>255) {
    b=0;
  }
}

void mouseDragged() {

  r+=int(random(10));
  g+=int(random(10));
  b+=int(random(10));
}

void mouseMoved() {
  
  for(int i=0; i<starArray.length; i++){

 
starArray[i].updatePosition();

starArray[i].drawStar();


}
}


