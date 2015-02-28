
float x,y;
float v = random(2,2);
float vy= random(2,2);
 
 
void setup(){
  size (1000,700);
   x = random(width);
   y = random(height);

  //noCursor();
}
 
void draw(){
 background(0);
   cuerpo();
  cara();
  
    x = x+v;
  y = y + vy;
  limits();
   

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
  fill(0,0,0);
  ellipse(x-30,y-10,10,10);//pupila
   ellipse(x+30,y-10,10,10);//pupila
      
}
 
void cuerpo(){
  fill(20,0,255);
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
     }

    void mousePressed(){
  v = random(-5,5);
  vy = random(-5,5);
  x = mouseX;
  y = mouseY;
 
}
 
void limits(){
    if (x+410/2 > width || x-330/2 < 0) {
    v = -v;
  }
 
  if (y+820/2 > height || y-330/2 < 0) {
    vy = -vy;
  }

   
}

