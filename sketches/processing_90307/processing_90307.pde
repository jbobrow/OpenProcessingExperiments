

int posX;
int posY;

int posX2;
int posY2;



int incX;

int incY;
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::


void setup(){

size (500,500);

//background (255,100,100,1 );

rectMode(CENTER);



posX = 100;
posY = 100;

posX2 = 200;
posY2 = 200;


incX = 1;

incY = 1;
}



void draw (){

  

stroke(1);

fill ( 100,100,100, 20);
rect (width/2,height/2, width,height);

    fill (255,6,8,5);

  rect (pmouseX,pmouseY,100,100);
  fill (3,6,8);
noStroke();

  ellipse (posX,75,100,100);

 ellipse (425,posY,100,100);

 
 stroke (3);
 line (posX,75,mouseX,mouseY);

line (425,posY,mouseX,mouseY);


//posX = posX % width;


// posX++;
 // posY++;
  
println(posX);
  
  posX = posX + incX;
  
  posY = posY + incY;

  
  //  estas son condicionantes para que la pelota se regrese, MUCHA ATENCION¡¡
  if(posX < 0) {
  incX   =  incX * -1  ;
   }
  
 if(posX > width){
     incX = incX * -1;
 }
 
 if( posY < 0) { 
incY = incY *-1;

 }
 if (posY > height) {
   incY = incY * -1; 
}

}


