
//programa de Queralt Trepat.
//moviment d'un personatge dins de la pantalla


int _x;
int _y;
int velX;
int velY;

void setup(){
 size(400,400);
  _x = width/2;
  _y = height/2;
  velX = 3;
  velY = 3;
 background(255);

}

void draw(){
  background(255);

//posicions
  _x = _x+velX;
  _y = _y+velY;


//personatge
  //cara
  stroke(0);
  strokeWeight(4); 
  fill(255,255,255);
  ellipse(_x,_y-25,160,120);
  
  //nas
  strokeWeight(3); 
  fill(255,255,0);
  ellipse(_x,_y,15,10);
  
  //ull esquerre
  strokeWeight(2); 
  fill(0);
  ellipse(_x-42,_y-12,10,15);
  
  //ull dret
  ellipse(_x+42,_y-12,10,15);
  
  //bigoti
   stroke(0);
  strokeWeight(4); 
  line(_x+70,_y-20,_x+98,_y-18);
  line(_x+69,_y-9,_x+93,_y-5);
  line(_x+62,_y+2,_x+85,_y+8);
  
  line(_x-70,_y-20,_x-98,_y-18);
  line(_x-69,_y-9,_x-93,_y-5);
  line(_x-62,_y+2,_x-85,_y+8);
  
  //orelles
  fill(255);
  arc(_x-15, _y-75, 100, 80, PI*0.9,PI*1.2); 
  arc(_x+15, _y-75, 100, 80,PI*-0.2,PI*0.1); 
  noFill();
  arc(_x-175, _y-75, 300, 80,PI*-0.2,-0.15); 
  arc(_x+175, _y-75, 300, 80,PI*0.9,PI*1.2);
  
  //llaç
  strokeWeight(3); 
  fill(255,0,0);
  ellipse(_x+32,_y-80,40,40);
  ellipse(_x+52,_y-60,40,40);
  ellipse(_x+32,_y-80,15,15);
  ellipse(_x+52,_y-60,15,15);
  ellipse(_x+42,_y-70,30,30);
  
  
 
  //posicio X
  if((_x-100<0)||(_x+100>width)){
    velX = -velX;
  }
    //posicio Y
  if((_y-100<0)||(_y+37>height)){
    velY = -velY;
  }
  
}



