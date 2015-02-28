
float vx=5,vy=5,x=-45,y=-160,a=152,b=252,c=240,g=97,h=227,i=11;
float o=0,ri=222,bi=7,ci=7,rx=0,ry=310,d=255,e=191,f=13;
PImage img;
PImage img1;//defineixo variables//

void setup(){
  size(400,400);
  img=loadImage("cielo.jpg");
  img1=loadImage("noche.jpg");
}//inserto imatges i tamany de la pantalla//

void draw(){
  image(img,0,0,width,height-90);
  fill(d,e,f);
  rect(rx,ry,width,height);//dibuixo imatge i terra i el pinto//

  if((x<-45)||(x>width-350)){
    vx=-vx;
  }
  
  if((y<-160)||(y>height-ry-90)){
    vy=-vy;
  }//indico que quan toqui la bici a la paret o al terra la velocitat canvii//
  
  pushMatrix();
  translate(x,y);
  bicicleta();
  x=x+vx;
  y=y+vy;
  popMatrix();
}//represento la bici en el dibuix//

void mousePressed() {
  g=random(255);
  h=random(255);
  i=random(255);
  d=random(255);
  e=random(255);
  f=random(255);
  img=img1;
}//quan s'apreti el botó del ratolí els colors canviin aleatoriament i la imatge es canvii per una altre//

void bicicleta(){//dibuix de la bici//
fill(0);
ellipse(100,260,100,100);
ellipse(300,260,100,100);
fill(g,h,i);
ellipse(100,260,90,90);
ellipse(300,260,90,90);
ellipse(100,260,10,10);
ellipse(300,260,30,30);
ellipse(300,260,10,10);
ellipse(200,260,40,40);
stroke(ri,bi,ci);
strokeWeight(3);
line(300,260,260,180);
line(260,180,200,260);
line(200,260,125,180);
line(125,180,100,260);
line(125,180,260,180);
line(300,260,200,260);
line(125,180,128.5,170);
line(260,180,262.5,177);
stroke(0);
line(200,280,300,275);
line(200,240,300,245);
fill(0);
rect(200,227.5,20,5);
stroke(222,7,7);
line(200,260,190,290);
line(200,260,210,230);
stroke(0);
rect(180,287.5,20,5);
ellipse(128.5,170,7,7);
rect(250,172,27,5);
strokeWeight(1);
}






