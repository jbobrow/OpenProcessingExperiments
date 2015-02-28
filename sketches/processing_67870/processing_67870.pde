
void setup()
{

size(530,400);
}

void draw()
{
 background(255);
 strokeWeight(10);
 noFill();
 smooth();


//Rojo
 float x = 180;
 float y = 90;
 float x1= random(300,400);
 float y1=random(200,150);

if((x1!=x) && (y1!=y)){
  stroke(255,0,0);
  ellipse(x1,y1,100,100);
  
}else if((x1==x)&&(y1==y) ){
  stroke(255,0,0);
  ellipse(x,y,100,100);
  noLoop();
}


//Azul
stroke(10,10,200);
ellipse(150,200,100,100);

//Negro
stroke(10);
ellipse(270,200,100,100);

//Amarillo
stroke(255,255,0);
ellipse(210,250,100,100);

//Verde
stroke(0,255,90);
ellipse(330,250,100,100);

}

