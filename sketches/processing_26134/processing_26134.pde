
int topX = 25;
int topY = 0;
int leftX = 0;
int leftY = 41;
int rightX = 50;
int rightY = 41;

int btopX = 0;
int btopY = 42;
int bleftX = -25;
int bleftY = 83;
int brightX = 25;
int brightY = 83;

int strech = 84;

void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  noStroke();
  fill (255, 10);
  rect (0, 0, width, height);
  
  
  for(int j = 0; j < 6; j++) {
    for(int i = 0; i < 10; i ++) {
      fill (mouseX+i*27, mouseY-j*35, 6, 15);
      triangle(topX+i*50, topY+j*strech, leftX+i*50, leftY+j*strech, 
      rightX+i*50, rightY+j*strech);
      
  

}
  }
  for(int j = 0; j < 6; j++) {
    for(int i = 0; i < 11; i ++) {
      fill (mouseX+i*30, mouseY-j*35, 6, 15);
      triangle(btopX+i*50, btopY+j*strech, bleftX+i*50, bleftY+j*strech, 
      brightX+i*50, brightY+j*strech);
    }
  }
}
