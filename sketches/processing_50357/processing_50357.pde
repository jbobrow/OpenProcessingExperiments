
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

  background(mouseX);

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

 

  rect(mouseX,mouseY,mouseX+20,mouseY-120);

  fill(255,136,67);
 
    x += directionx;

  y += directiony;
  
}


