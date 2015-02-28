
//víctor Tabares//
//P3
//moviment constant d'una dins el marc establer per la pantalla, en aquest cas 600x600.


int _x;
int _y;
int velX;
int velY;

void setup(){
size(700,600);
background(60);
  _x = width/2;
  _y = height/2;
  velX = 2;
  velY = 9;
}
 
 
void draw(){
  background(0);
  fill(180,220,70);
  //posicions
  _x = _x+velX;
  _y = _y+velY;
   
  //SKETCH
  
//cap
stroke(255,100,3);
fill(255,100,3);
ellipse( _x,_y,300,300); 
//300 170

//cara marró 
stroke(126,49,1);
strokeWeight(2);
fill(126,49,1);
ellipse( _x,_y,160,135);

//elipse carn cara 
stroke(250,205,177);
strokeWeight(2);
fill(250,205,177);
ellipse( _x,_y,105,135);

//ull blanc esquerre
stroke(255);
strokeWeight(2);
fill(255);
ellipse( _x-26,_y+8,51,65);

//ullblanc dret
//stroke(255);
strokeWeight(2);
fill(255);
ellipse( _x+25,_y+8,51,65); 

//pupila esuqerra
stroke(0);
strokeWeight(1);
fill(0);
ellipse(_x+21,_y+10,10,10);
 
//pupila dreta 
stroke(0);
strokeWeight(1);
fill(0);
ellipse( _x-20,_y+10,10,10);

//posicio de la x
  if((_x-150<0)||(_x+150>width)){
    velX = -velX;
  }
    //posicio Y
  if((_y-150<0)||(_y+150>height)){
    velY = -velY;
  }
}






