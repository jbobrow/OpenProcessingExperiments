
void setup(){
  size(300,300);
  background(150);
  smooth();
}
  
int a=(100);
int a2=(280);
int b=(75);
int b2=(225);
int c=(225);
int c2=(145);
int d=(250);
int d2=(200);


void draw(){
 
  background(155);
quad(d,d2,d,mouseY,c,mouseY-55,c,c2); 
quad(a,a2,b,b2,c,c2,d,d2);

fill(mouseX);
quad(a,a2,b,b2,c,mouseY-55,d,mouseY);

quad(a,mouseY+80,b,mouseY+25,c,mouseY-55,d,mouseY);
quad(a,a2,a,mouseY+80,b,mouseY+25,b,b2);
}

void mouseClicked(){
  ellipse(c--*50,c2--*50,20,20);
}

void mouseDragged(){
  ellipse(c++,c2++,20,20);
}





