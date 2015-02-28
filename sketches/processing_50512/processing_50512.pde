
int x;

int directionx;

int y;

int directiony;




void setup(){

size(800,600);

  x = 0;

  directionx = 1;

  y = 0;

  directiony = 1;
 
}




void draw(){

  background(283,8,255);

  x += directionx;

  y += directiony;

  if(x > 800){

    directionx = -1;

  }

  if (x < 0){
 
    directionx = 1;

  }

    if(y > 0){

      directiony = 1;

    

}

  fill(116,118,216);
  rect(pmouseX,pmouseY,pmouseX+15,pmouseY-120);
  fill(102,247,0);
  ellipse(mouseX,mouseY,mouseX+45,mouseY-30);
  fill(250,233,177);
  triangle(mouseX, mouseY, mouseX+5, mouseY-300, mouseX+23, mouseY-32);

  fill(255,136,67);
  ellipse(1,1,mouseX,mouseY);
  
 
    x += directionx;

  y += directiony;
  
}


