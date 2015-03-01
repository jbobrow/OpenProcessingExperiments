
int tamano = 0;
int tam = 0;

void setup() {
  size(600, 600);
}



void draw() {
  background(255);

  for (int i = 0; i<= height; i= i+5) {
    line(mouseX, mouseY, 600, i);
    line(i, 600, mouseX, mouseY);
    line(0,i,mouseX,mouseY);
    line(i,0,mouseX,mouseY);
    }
    if ((mouseX >= height/2)||(mouseY >= width/2)){
      stroke(255,0,0);
    }
    else { stroke(255,180,60);
    }
}
void mouseClicked() {
 stroke(150,34);
}
void mouseDragged(){
stroke(0,0,255);
}



