
void setup(){
  size (1000,1000);
  noCursor();
}

void draw(){
 background(0);
   cuerpo();
  cara();
}



void cara(){
    //blau
  fill(20,0,255);
  ellipse(mouseX,mouseY,220,220);//caputxa
  //carn
  fill(245,177,89);
  
  ellipse(mouseX,mouseY,200,200);//cara
  //vermell
  fill(255,0,0);
  triangle(mouseX-100,mouseY-60,mouseX,mouseY-140,mouseX+100,mouseY-60);//gorro

  //blanc
  fill(255,255,255);
  ellipse(mouseX-35,mouseY-10,60,60);//ull
  ellipse(mouseX+35,mouseY-10,60,60);//ull
  ellipse(mouseX,mouseY-150,30,30);//boletagorro
  noStroke();
  ellipse(mouseX,mouseY+40,60,15);//boca
  //marró
  fill(152,96,40);
  ellipse(mouseX-31,mouseY-10,14,14);
  ellipse(mouseX+31,mouseY-10,14,14);

  //negre
  fill(0,0,0);
  ellipse(mouseX-30,mouseY-10,10,10);//pupila
   ellipse(mouseX+30,mouseY-10,10,10);//pupila
     
}

void cuerpo(){
  fill(20,0,255);
  ellipse(mouseX,mouseY+190,330,400);//ellipsecos
  fill(0);
  rect(mouseX-1,mouseY+110,2,200);//cremallera
  rect(mouseX-200,mouseY+210,90,180);//bras
    rect(mouseX+110,mouseY+210,90,180);//bras
   
   fill(255,0,0);
    stroke(0);
    strokeWeight(2);
    rect(mouseX-109,mouseY+320,219,70);//pantalons
   
    fill(0);
    ellipse(mouseX,mouseY+390,20,70);//huecopantalons
    fill(255,255,255);
    ellipse(mouseX-60,mouseY+390,100,50);//peu
    ellipse(mouseX+60,mouseY+390,100,50);//peu
    
   
  
}
  
