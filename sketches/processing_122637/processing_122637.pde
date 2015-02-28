
if (mousePressed){
background(111, 240, 79);
size(400,400);
fill(245, 111, 8);
ellipse(224, 210, 255, 255);
  
fill(0,0,0);
    textSize(71);
    text("BASKET-", 1, 62);
    textSize(57);
    text("F", 1,113);
    text("O", 1,163);
    text("R", 1,213);
    text("C", 1,263);
    text("E", 1,313);
}

var pantalla1; 
var x,y;
var velocidady , velocidadx;
var gravedad;
var radius ;
var recta =100;
size(400,400);
 
void setup()
{
 
 
  x = 28;
  y = 375;
  velocidadx = 0;
  velocidady = 0;
  gravedad = .0;
  radius = 0;
   
}
 
void draw()
{
 background(96, 128, 209);
  fill(82, 81, 75);
  rect(250,310,130,20);
if (y >= 340 && y < 346 && x >= 150 && x <= 20) {
        velocidady = -velocidady;
    }
if (mousePressed){

  x = 28;
  y = 375;
  velocidadx = 12;
  velocidady = 8;
  gravedad = .04;
  radius = 7;
}
else{
  velocidady += gravedad ;
  x += velocidadx;
  y += velocidady ;
   }
    
  if(y>(height-radius))
  {
    y = height-radius;
    velocidady  *= -1;
  }
  if(y<radius)
  {
    y = radius;
    velocidady  *= -1;
  }
  if(x<radius)
  {
    x=radius;
    velocidadx *= -1;
  }
  if(x>(width-radius))
  {
    x = width-radius;
    velocidadx *= -1;
  }
  ball(x, y);
}
 
     
void ball(float x, float y)
{
  
  translate(x,y);
   
   fill(245,111,8);
  ellipse(0,0,40,40);
   
}

fill(82, 81, 75);

rect(390,325,270,310);



 
