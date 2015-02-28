

int _x;
int _y;
int velX;
int velY;

void setup(){
size(700,700);
_x= width/2;
_y= height/2;
velX = 5;
velY = 5;

}

void draw(){
  //Color del fons
background(29,219,242);

//Posició
_x= _x+velX;
_y= _y+velY;

strokeWeight(4);
stroke(0,0,0);
fill(250,126,223);

//orelles del porc
triangle(_x-100,_y-100,_x-170,_y+70,_x-180,_y-200);
triangle(_x+100,_y-100,_x+170,_y+70,_x+180,_y-200);

strokeWeight(4);
stroke(0,0,0);
fill(247,182,233);

// cap del porc
ellipse(_x,_y,width*0.7,height*0.5);

strokeWeight(4);
stroke(0,0,0);
fill(255,255,255);

//Ulls
ellipse(_x-100,_y-55,width*0.09,height*0.15);
ellipse(_x+100,_y-55,width*0.09,height*0.15);

strokeWeight(2);
stroke(0,0,0);
fill(0,0,0);

//pupiles porc
ellipse(_x+100,_y-40,width*0.04,height*0.08);
ellipse(_x-100,_y-40,width*0.04,height*0.08);

strokeWeight(4);
stroke(0,0,0);
fill(247,162,229);

//nas del porc
ellipse(_x,_y+100,width*0.4,height*0.2);

strokeWeight(2);
stroke(0,0,0);
fill(0,0,0);

//forats del nas
ellipse(_x-60,_y+100,width*0.05,height*0.1);
ellipse(_x+60,_y+100,width*0.05,height*0.1);

//Limits posició X
if((_x-240<0)||(_x+240>width)){
 velX= -velX;
}

//Limitis posició Y
if((_y-210<0)||(_y+180>height)){
 velY= -velY;
}
}
void mousePressed (){
   
//Per clicar el porc i que torni a la seva posició inicial
  
  _x=width/2;
  _y=height/2;
  
//Al clicar canvia el color dels ulls i del cap del porc
strokeWeight(2);
stroke(0,0,0);
fill(29,219,24,242);
ellipse(_x+100,_y-40,width*0.04,height*0.08);
ellipse(_x-100,_y-40,width*0.04,height*0.08);

strokeWeight(4);
fill(245,22,22);
ellipse(_x,_y,width*0.7,height*0.5);
 }

