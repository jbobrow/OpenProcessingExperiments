
int mida=400;
int x;
int y;
int v=30;
  
  
void setup(){
  size (1000,700);
   x = width/2;
   y = height/2;
 
  //noCursor();
}
  
void draw(){
 background(0);
   cuerpo();
  cara();
   
 //   x = x+v;
  //y = y + vy;
 // limits();
    
 
}
  
  
  
void cara(){
    //blau
  fill(20,0,255);
  ellipse(x,y,220,220);//caputxa
  //carn
  fill(245,177,89);
    
  ellipse(x,y,200,200);//cara
  //vermell
  fill(255,0,0);
  triangle(x-100,y-60,x,y-140,x+100,y-60);//gorro
  
  //blanc
  fill(255,255,255);
  ellipse(x-35,y-10,60,60);//ull
  ellipse(x+35,y-10,60,60);//ull
  ellipse(x,y-150,30,30);//boletagorro
  noStroke();
  ellipse(x,y+40,60,15);//boca
  //marró
  fill(152,96,40);
  ellipse(x-31,y-10,14,14);
  ellipse(x+31,y-10,14,14);
  
  //negre
  fill(mouseY,mouseY,0);
  ellipse(x-30,y-10,10,10);//pupila
   ellipse(x+30,y-10,10,10);//pupila
       
}
  
void cuerpo(){
  fill(0,mouseY,mouseX);
  ellipse(x,y+190,330,400);//ellipsecos
  fill(0);
  rect(x-1,y+110,2,200);//cremallera
  rect(x-200,y+210,90,180);//bras
    rect(x+110,y+210,90,180);//bras
     
   fill(255,0,0);
    stroke(0);
    strokeWeight(2);
    rect(x-109,y+320,219,70);//pantalons
     
    fill(0);
    ellipse(x,y+390,20,70);//huecopantalons
    fill(255,255,255);
    ellipse(x-60,y+390,100,50);//peu
    ellipse(x+60,y+390,100,50);//peu
     
     float r = random(60);
 
if (r <15) {
    //cap amunt
    y = y - v;
  }
  else if (r < 30) {
    //cap avall
    y = y + v;
  }
  else if (r <35) {
    //dreta
    x = x + v;
  }
  else if (r <40)  {
    //esquerra
    x = x - v;
  }

 
  comprovaLimits();
   
 
}
 
void comprovaLimits() {
  if (x-mida/2<0) {
    x =mida/2;
  }
  if (x+mida/2>width) {
    x=width-mida/2;
  }
  if (y-mida/2<0) {
    y =mida/2;
  }
  if (y+mida/2>height) {
    y=height-mida/2;
  }
 
}
 
void mousePressed(){
  x=mouseX;
  y=mouseY;
}

 

