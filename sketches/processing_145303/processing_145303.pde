

//Mapache:
float x;
float y;
float vx = random(4, 7);
float vy = random(3, 5);

//Fulla
float x1;
float y1;
float vx1= random(0.5,1);
float vy1= random(3,4);

//CastanyaRebot
float x2;
float y2;
float vx2= random(3,5);
float vy2= random(2,4);


 void setup() {
 size(800,800);

  x = random (200,600);
  y = random (200,600);
  
  x1 = random (0,0);
  y1 = random (0,0);
  
  x2 = random (width);
  y2 = random (height);;
}


 void draw() {
  Background();
  Fulla();
  CastanyaRebot();
  Mapache();
  Velocitat();
  ComprovaLimits();
}

  void Background() {
  fill(205,211,211,50); 
  noStroke();
  rect(0,0,width,height);
}
    
  void Fulla(){
  fill(125,165,131);
  noStroke();
  ellipse(x1, y1, 90, 70);
  triangle(x1+21, y1+31, x1+21, y1-31, x1+100,y1 );
  
  noFill();
  noStroke();
  line(x1-45, y1, x1-45, y1);
  line(x1-70, y1, x1-70, y1-25);
  stroke(0, 0, 0);
  bezier(x1-45, y1, x1-45, y1,  x1-70, y1, x1-70, y1-25);
  
  stroke(0);
  strokeWeight(1);
  line(x1-45,y1,x1+95,y1);
  
  line(x1-22.5,y1,x1,y1+35);
  line(x1-22.5,y1,x1,y1-35);
  
  line(x1,y1,x1+21,y1+31);
  line(x1,y1,x1+21,y1-31);
  
  line(x1+22.5,y1,x1+42,y1+22);
  line(x1+22.5,y1,x1+42,y1-22);
  
  line(x1+45,y1,x1+63,y1+14);
  line(x1+45,y1,x1+63,y1-14);
}
  
  void CastanyaRebot(){
  noStroke();
  fill (93,79,62);
  ellipse (x2,y2,80,70);
  triangle (x2-25,y2+27,x2+25,y2+27,x2,y2+45);
  fill (188,154,110);
  ellipse (x2,y2-21.5,50,27);
}

  void Mapache() {
  //Orella exterior (marro)://
  stroke(124,103,94);
  fill(124,103,94);


  ellipse(x-70,y-100,80,80);
  ellipse(x+70,y-100,80,80);

  //Orella interior (carn)://
  fill(227,177,153);
  stroke(227,177,153);
  ellipse(x-70,y-100,45,45);
  ellipse(x+70,y-100,45,45);

  //Orella interior (carn)://
  fill(224,138,97);
  stroke(224,138,97);
  ellipse(x-70,y-100,35,35);
  ellipse(x+70,y-100,35,35);


  fill(124,103,94);
  stroke(124,103,94); 
  //Esfera (marró clar)://
  ellipse(x,y,240,240);
  //Triangle (marró clar)://
  triangle(x-97, y-70, x-147, y, x-97, y+70);
  triangle(x+97, y-70, x+147, y, x+97, y+70);


  fill(100,87,81);
  stroke(100,87,81);
  //Esfera (marró fosc)://
  ellipse(x,y,225,225);
  //Triangle (marró fosc)://
  triangle(x-88, y-70, x-138, y, x-88, y+70);
  triangle(x+88, y-70, x+138, y, x+88, y+70);

  //Cresta (marró fosc)://
  stroke(124,103,94);
  fill(124,103,94);
  triangle(x-20,y-115, x+20, y-115, x, y-20);

  //Esfera morro (marró fosc)://
  stroke(124,103,94);
  fill(124,103,94);
  ellipse(x,y+60,108,108);

  //Esfera morro (blanca)://
  fill(255,255,255);
  stroke(255,255,255);
  ellipse(x,y+60,98,98);

  //Triangle nas (nigga)://
  fill(0,0,0);
  stroke(0,0,0);
  triangle(x,y+60,x-20,y+40,x+20,y+40);

  //Triangle nas (nigga)://
  fill(57,57,57);
  stroke(57,57,57);
  triangle(x,y+45,x-20,y+40,x+20,y+40);

  //Ralla boca (vertical+morrus)://
  line(x,y+60,x,y+70);
  line(x,y+70,x-20,y+75);
  line(x,y+70,x+20,y+75);
 
  //Elipse antifaç (marro clar)://
  stroke(124,103,94);
  fill(124,103,94);
  ellipse(x+75,y,115,55);
  ellipse(x-75,y,115,55);

  //Elipse antifaç (blanc)://
  fill(255,255,255);
  stroke(255,255,255);
  ellipse(x-75,y,100,40);
  ellipse(x+75,y,100,40);

  //Elipse antifaç (negre)://
  fill(0,0,0);
  stroke(0,0,0);
  ellipse(x-65,y,80,30);
  ellipse(x+65,y,80,30);


  //Ulls (blau)://
  fill(245,230,99);
  stroke(245,230,99);
  ellipse(x-35,y,10,10);
  ellipse(x+35,y,10,10);

 //Ulls (blau)://
 fill(x +245, y -230, x -99);
 noStroke();

  if (mousePressed) {
  x = mouseX;
  y = mouseY; 
  fill(random(255), random(255), random(255));
  noStroke();
}
  
  ellipse(x-35,y,x/10,x/10);
  ellipse(x+35,y,x/10,x/10);

  //Ulls (negre)://
  fill(0,0,0);
  stroke(0,0,0);
  ellipse(x-35,y,6.5,6.5);
  ellipse(x+35,y,6.5,6.5);

  //Ulls (reflex blanc)://
  fill(255,255,255);
  stroke(255,255,255);
  ellipse(x-37,y-2,1.9,1.9);
  ellipse(x+37,y-2,1.9,1.9);

  //bigotis (esquerre)://
  stroke(0,0,0);
  line(x+30,y+50,x+70,y+50);
  line(x+30,y+58,x+70,y+70);
  line(x+30,y+66,x+70,y+85);
  
  //bigotis (dreta)://
  stroke(0,0,0);
  line(x-30,y+50,x-70,y+50);
  line(x-30,y+58,x-70,y+70);
  line(x-30,y+66,x-70,y+85);
  
}


  void Velocitat(){
  x = x+vx;
  y = y+vy;
   
  x1=x1+vx1;
  y1=y1+vy1;
   
  x2=x2+vx2;
  y2=y2+vy2;
}
 
  
   
  void ComprovaLimits(){
  if (x+147>width||x-147 <0) {  
  vx=-vx;
  }
  if (y+120>height||y-120 <0) {    
  vy=-vy;
  }
  
  if (x1 < 0) { 
  x1=width;
  }
  if (x1>width) {
  x1=0;
  }
  if (y1 < 0) {
  y1=height;
  }
  if (y1>height) { 
  y1=0;
  }
  
  if (x2+40>width||x2-40 <0) {  
  vx2=-vx2;
  }
  if (y2+45>height||y2-35 <0) {    
  vy2=-vy2;
  }  
}


void mousePressed() {
  vx=random(-3, 4);
  vy=random(-5, 5);
  x=mouseX;
  y=mouseY;
  }








