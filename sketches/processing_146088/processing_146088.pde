
int sz=20;
//float _x, _y;
//float v = random(2,2);
//float v_y= random(2,2);
int r2d2 = 30;
int i;
float[] posicionesX= new float[r2d2];
float[] posicionesY = new float[r2d2];
float[] velocidadX = new float[r2d2];
float[] velocidadY = new float[r2d2];
color[] colorR2d2 = new color[r2d2];

void setup(){
  size(1000,800);
  //_x = width/2;
  //_y =height/2;
  //noCursor();
    for(int i=0; i<r2d2; i++){
    posicionesX[i] = random(width/2-50, width/2+50);
    posicionesY[i] = random(height/2-50, height/2+50);
   
    velocidadX[i] = random(1,3);
    velocidadY[i] = random(1,3);
    //Color
    colorR2d2[i] = color(random(230), random(0), random(0));
    }
}
void draw(){
  background(250);
  //fill(0,10);
  //noStroke();
  //rect(0,0,width,height);
  
 for(int i = 0; i<r2d2; i++){
 
    posicionesX[i] += random(-6,6);
    posicionesY[i] += random(-6,6);
    colorR2d2[i] = colorR2d2[i]+2;
  
 
    if((posicionesX[i]<0)||(posicionesX[i]>width)){
      velocidadX[i] = -velocidadX[i];
    }
 
    if((posicionesY[i]<0)||(posicionesY[i]>height)){
      velocidadY[i] = -velocidadY[i];
    }
     
//delimitem amb els limits a la finestra
     
    //posX
    if(posicionesX[i]<2*50)
    {
      posicionesX[i] = 50*2;
    }
    if(posicionesX[i]>width-152)
    {
      posicionesX[i] = width-200*2;
    }
     
    //posY
    if(posicionesY[i]<height-657)
    {
      posicionesY[i] = height+15*50;
    }
    if(posicionesY[i]>height-3*50)
    {
      posicionesY[i] = height-3*50;
    }
 
    cara(posicionesX[i], posicionesY[i]);
    e_xtrimitats(posicionesX[i], posicionesY[i]);
    cuerpo(posicionesX[i], posicionesY[i]);
}



//void tot(float _x, float _y){
  //extrimitats();
  //cara();
  //cuerpo();
}
void cara(float _x, float _y){
  fill(145,146,149);//gris
ellipse(_x,_y,95,110);//cara
fill(3,46,160);
rect(_x-17,_y-25,9,14,4.5);//rectangle n3 cara
fill(3,46,160);
rect(_x-48,_y-5,95,5); //barra blaba cara
  rect(_x-10,_y-50,20,20,2);
  fill(82,79,79);
ellipse(_x,_y-40,18,18);//ull cara
fill(3,46,160);
rect(_x-6,_y-25,20,14,7);//rectangle sensor vermell
fill(3,46,160);
rect(_x-40,_y-25,20,14,7);//rectangle 1
rect(_x+30,_y-25,10,14,7);//rectangle 2
fill(colorR2d2 [i]);
ellipse(_x+4,_y-18,12,12);//sensor vermell cara
fill(82,79,79);
ellipse(_x+24,_y-18,15,15);//tub sensor cara
fill(0);
ellipse(_x+26,_y-23,10,10);//sensor negre cara
}
void cuerpo(float _x, float _y){
  fill(255);
  rect(_x-48,_y+5,95,107);//cos
//quad(115,175,145,175,136,203,125,203);
fill(145,146,149);//gris
rect(_x-48,_y+112,95,10);
fill(3,46,160);//blau
stroke(2);
rect(_x-11,_y+40,20,45,5);//rectangle central cos Blau
fill(255);
//quad(125,203,136,203,146,230,115,230);
fill(255);
rect(_x-44,_y+10,14,72,7);//rectangle gran cos esquerra
rect(_x+28,_y+10,14,72,7);//rectangle gran cos dreta
rect(_x-27,_y+35,12,45,6);//rectangle petit cos esquerra
rect(_x+12,_y+35,12,45,6);//rectangle petit cos dreta
fill(3,46,160);
ellipse(_x,_y+100,20,20);// esfera cos abai_x
ellipse(_x+38,_y+100,15,15);//esfera cos dreta
fill(3,46,160);
rect(_x-52/2,_y+10,52,5,2.5);//barra blava cos 1
rect(_x-52/2,_y+18,52,5,2.5);//barra blava cos 2
rect(_x-52/2,_y+26,52,5,2.5);//barra blava cos 3
rect(_x-44,_y+85,12,23,6);//rectangle petit cos esquerra
fill(255);
rect(_x-6,_y+43,10,20,2);//rectangle petit 1 cos central
rect(_x-6,_y+65,10,18,2);//rectangle petit 2 cos central
rect(_x-28,_y+90,14,14,7);//1
rect(_x+13,_y+90,14,14,7);//2
rect(_x-28,_y+82,14,6,2);//1.1
rect(_x+13,_y+82,14,6,2);//1.2
}
void e_xtrimitats(float _x, float _y){
  fill(255);
//triangle(77,140,95,200,105,170);
//triangle(77,140,60,200,95,200);//pota esquerra
//triangle(180,140,170,200,160,160);
//triangle(183,140,170,200,200,200);//pota esquerra
strokeWeight(1);
  rect(_x-65,_y+10,25,53,4);//braç part superior esquerra
  rect(_x+45,_y+10,20,53,4);//braç part superior dreta
rect(_x-60,_y+63,19,33);//braç 2 esquerra
rect(_x+45,_y+63,13,33);//braç 2 dreta
fill(3,46,160);//blau
rect(_x-60,_y+63,5,33);
rect(_x+53,_y+63,5,33);
fill(255);
rect(_x-65,_y+95,25,27,4);
rect(_x+40,_y+95,23,27,4);
fill(3,46,160);
//ellipse(125,203,7,7);//esfera pota principal
//ellipse(136,203,7,7);//esfera pota principal
rect(_x-62,_y+105,7,7,2);//quadrat pota esquerra
rect(_x+53,_y+105,7,7,2);//quadrat pota dreta
fill(57,58,59);
//rect(125,215,10,15);
}
void mousePressed(){
  for(int i = 0; i<r2d2; i++){
   velocidadX[i] = random(3,3);
    velocidadY[i] = random(3,3);
  posicionesX[i] = mouseX;
  posicionesY[i] = mouseY;
   } 
   {
  colorR2d2 [i] = color (mouseX, mouseY, 0);
  }
}



