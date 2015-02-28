
// parámetros posición-velocidad


float posx, posy, velx, vely;
int value =255;
void setup(){
  size (600,600);
  noCursor();
  
posx= width/2;
posy=height/2;
velx=   random(1,2);
vely=  random(1,2);

}

void draw(){
background(250);
 
//actualización de posiciones
posx = posx+ velx;
posy = posy+ vely;
personatge(posx,posy);

}

void personatge(float _x,float _y)

{

//cara, orejas
fill(242,194-posx/6,149-posx/6);
stroke(0);
strokeWeight(6);

ellipse(posx+width/6,posy+height/250,width/12,height/12);
ellipse(posx-width/6,posy+height/250,width/12,height/12);

fill(242,194,149);
ellipse(posx,posy,width/3,height/3);



//rayas frente
noFill();
stroke(0);
strokeWeight(6);
line(posx-width/20,posy-height/8,posx+width/20,posy-height/8);
line(posx-width/15,posy-height/9.5,posx+width/15,posy-height/9.5);
line(posx-width/11.8,posy-height/11,posx+width/11.8,posy-height/11);


//gafas

noFill();
stroke(0);
strokeWeight(5);
line(posx+width/6,posy-height/25,posx-width/6,posy-height/25);
fill(219,255,248);
stroke(0);
strokeWeight(6);
ellipse(posx+width/15,posy-height/32,width/12,width/12);
ellipse(posx-width/15,posy-height/32,width/12,width/12);

//ojos
fill(255);
ellipse(posx+width/15,posy-height/32,width/22,width/22);
ellipse(posx-width/15,posy-height/32,width/22,width/22);
fill(0);
ellipse(posx+width/15,posy-height/32,width/120,width/120);
ellipse(posx-width/15,posy-height/32,width/120,width/120);

//boca
fill(226,16,20);
ellipse(posx,posy+height/12,width/12,height/16);

//bigote
fill(value);
ellipse(posx,posy+height/15,width/8,height/18.5);


//nariz
fill(242,194,149);
stroke(0);
strokeWeight(6);
ellipse(posx,posy+height/45,width/22,height/22);

//límites eje x - eje y

if ((posx  > width-5*width/24) || (posx  < 5*width/24)){

velx=-velx;
}

if ((posy  > height-height/6) || (posy<height/6)){

 vely = -vely;
  }
}

void mousePressed(){

  posx=width/2;
  posy=height/2;
  velx=random(1,5);
  vely=random(1,5);

//cambio de color del bigote a negro
 if (value == 255) { 
    value = 0;
  } else {
    value = 255;
  }
}



