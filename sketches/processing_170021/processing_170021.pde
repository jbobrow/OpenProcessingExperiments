
int posX, posY, dirX, dirY;
int posXd,posYd,dirXd,dirYd;

void setup() {
  size(500, 500);
  posX=width/2;
  posY=height/2;
  dirX=1;
  dirY=5;
  posXd=(width/2)-30;
  posYd=(height/2)-30;
  dirXd=4;
  dirYd=2;
}

void draw() {
  background(0);


 

  posX=posX+dirX;
  posY=posY+dirY; 
 
  if ((posX>width/4*3) || (posX<width/4)) {
    dirX=dirX*-1;
  }

  if ((posY>height/4*3) || (posY<height/4)) {
    dirY=dirY*-1;
  }

noStroke();
fill(255);
rect(width/4,height/4, width/4*2,height/4*2);



  for (int i= 0; i<550; i +=50) {
    stroke(0);
    strokeWeight(0.5);
    line(i, height-height, posX, posY);
    line(width-width, i, posX, posY);
    line(width, i, posX, posY);
    line(i, height, posX, posY);
  }
  
   posXd=posXd+dirXd;
  posYd=posYd+dirYd; 
 
  if ((posXd>width/4*3) || (posXd<width/4)) {
    dirXd=dirXd*-1;
  }

  if ((posYd>height/4*3) || (posYd<height/4)) {
    dirYd=dirYd*-1;
  }
  for (int j= 0; j<550; j +=50) {
    stroke(0);
    strokeWeight(0.5);
    line(j, height-height, posXd, posYd);
    line(width-width, j, posXd, posYd);
    line(width, j, posXd, posYd);
    line(j, height, posXd, posYd);
  }
}



