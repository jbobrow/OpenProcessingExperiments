
float posX, posY, dirX, dirY;
int tam;


void setup() {
  size(600, 600);  
  posX=width/2;
  posY=height/2;
  tam=20;
  dirX=2;
  dirY=1;

}

void draw() {
  background(0);

  noFill();
  stroke(100, 0, 0);
  rect(width/4, height/4, width/2, height/2);


  posX=posX+dirX;
  posY=posY+dirY;
  
 

  if ((posX<=width/4+tam) || (posX>=width/4*3-tam)) {
    dirX=-dirX;
  }
  
  
  

  if ((posY<height/4+tam) || (posY>=height/4*3-tam)) {
    dirY=-dirY;
  }

  if (posX>=width/2) {

    fill(255);
    noStroke();
    ellipse(posX, posY, tam*2, tam*2);
  }
  else {


    fill(255);
    noStroke();
    rect(posX-tam, posY-tam, tam*2, tam*2);
  }
}



