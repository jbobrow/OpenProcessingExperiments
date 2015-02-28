
float x;
float y;
int amarillo;
int azul;
int verde;
int rojo;
int negro;

void setup(){
   size(700,500);
amarillo=0;
azul=0;
verde=0;
rojo=0;
negro=0;

}

void draw(){

    background(255);
  smooth();
  noFill();
  strokeWeight(15);
  
x=int (random(800));
y=int (random(500));


  //blue ring
if ((x!=175) && (y!=200) && (azul!=1)){
      stroke(0,0,200);
  ellipse(x,y,200,200);
}

else{
      stroke(0,0,200);
   ellipse(175,200,200,200);
  azul=1;
}

  //black ring
if ((x!=350) && (y!=200) && (negro!=1)){
      stroke(0);
  ellipse(x,y,200,200);
}

else{
      stroke(0);
   ellipse(350,200,200,200);
  negro=1;
}

  //red ring
if ((x!=525) && (y!=200) && (rojo!=1)){
      stroke(200,0,0);
  ellipse(x,y,200,200);
}

else{
      stroke(200,0,0);
   ellipse(525,200,200,200);
  rojo=1;
}

//yellow ring
if ((x!=440) && (y!=300) && (amarillo!=1)){
      stroke(200,200,0);
  ellipse(x,y,200,200);
}

else{
      stroke(220,200,0);
   ellipse(440,300,200,200);
amarillo=1;

  }
  
    //green ring
if ((x!=262) && (y!=300) && (verde!=1)){
      stroke(0,200,200);
  ellipse(x,y,200,200);
}

else{
      stroke(0,200,0);
   ellipse(262,300,200,200);
  verde=1;
}

}

