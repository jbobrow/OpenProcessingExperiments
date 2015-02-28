
//Júlia Fort Muñoz
//P2_b)Dibuix que es mou amb el ratolí
int _x;
int _y;
int velX;
int velY;

//_x i _y (500,500)--> el centre del quadrat
void setup(){
  size (1000, 1000);
   _y=width/2;
  _x=height/2;
  velX=4;
  velY=4;
 
}
 
void draw(){
   //posicio
  _x = _x+velX;
  _y = _y+velY;

  //fons
  background(94,240,231);
   
  //cos principal
  noStroke();
  fill(255,247,8);
  ellipse(_x, _y+250, 600, 800);
   
  //orelles
  noStroke();
  fill(255,247,8);
  ellipse(_x-47, _y-220, 100, 200);
  ellipse(_x-47+94, _y-220, 100, 200);
  rect(_x-50, _y-200, 100,100);
   
  //eliminacio de mig cos
  fill(94,240,231);
  rect(_x-500, _y+250, 1000, 400);
  fill(255,247,8);
   
  //cames
  stroke(0);
  strokeWeight(5);
  line(_x-100, _y+260, _x-100, _y+600);
  line(_x+100, _y+260, _x+100, _y+600);
   
  //dits
  line(_x-100, _y+550, _x-80, _y+600);
  line(_x+100, _y+550, _x+120, _y+600);
  line(_x-100, _y+550, _x-120, _y+600);
  line(_x+100, _y+550, _x+80, _y+600);
   
  //la meitat del cos
  noStroke();
  ellipse(_x, _y+260, 600,430);
   
  //les circumferencies mes grans dels ulls
  stroke(0);
  strokeWeight(10);
  fill(197,197,197);
  stroke(20);
  ellipse(_x+167, _y, 200, 200);
  ellipse(_x-167, _y, 200, 200);
    
  //les ellipses de dins els ulls NEGRES
  ellipse(_x-167, _y+20, 15, 80);
  ellipse(_x+167, _y+20, 15, 80);
   
  //les ellipses de dins els ulls BLANQUES
  fill(255);
  noStroke();
  ellipse(_x-167, _y+20, 20, 80);
  ellipse(_x+167, _y+20, 20, 80);
   
  //la rodona del nas BLANCA
  stroke(0);
  strokeWeight(4);
  fill(255);
  if (mousePressed){
   fill (252,157,31);
  }
  ellipse(_x-1, _y+250, 200, 300);
   
  //per fer el pic amb 2 rodones GROGUES
  noStroke();
  fill(255, 247, 8);
  ellipse(_x-90, _y+250, 200, 200);
  ellipse(_x+90, _y+250, 200, 200);
   
  // per eliminar la meitat del nas
  rect(_x-80, _y+220, 200, 200);
   
  //les lineeas de dins el nas
  stroke(0);
  line(_x, _y+201, _x, _y+100);
  triangle(_x-10, _y+180, _x-10, _y+120, _x-10-10, _y+120 );
  triangle(_x+10, _y+180, _x+10, _y+120, _x-10+30, _y+120 );

   //posicioX
  if((_x-width/3.4<0)||(_x+width/3.4>width)){
    velX = -velX;
  }
  //posicioY
  if((_y-width/3.3<0)||(_y+width/1.7>height)){
    velY = -velY;
  }
}
void mousePressed(){
   
 _x=mouseX;
 _y=mouseY;
 
}





