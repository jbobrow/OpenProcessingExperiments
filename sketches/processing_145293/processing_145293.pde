
//Josep Rimbau. Grup 3. Informatica-practica 3
int _x;
int _y;
int velX;
int velY;

void setup(){
  size(600,600);
  _y=width/2;
  _x=height/2;
  velX=4;
  velY=4;

}

void draw(){
  background(_y,250,_x);
  fill(245,207,15);
  //posicio
  _x = _x+velX;
  _y = _y+velY;

  //orellas
strokeWeight(1);
stroke(0,0,0);
  ellipse(_x+width/6,_y+width/60,width/12,height/10);
  ellipse(_x-width/6,_y+width/60,width/12,height/10);
    //ORELLASINTERIOR
    
 strokeWeight(2);
  ellipse(_x-width/6,_y+width/60,width/24,height/20);
  ellipse(_x+width/6,_y+width/60,width/24,height/20);
 
  //CABELLS
  fill(_y,250,_x);
  stroke(110,110,110);
  ellipse(_x,_y-height/4,width/8,height/10);
  ellipse(_x,_y-height/4,width/12,height/14);
  strokeWeight(1);
  
  //CARA
  stroke(0,0,0);
  fill(245,207,15);
  rectMode(CENTER);
  rect(_x,_y,width/3,height/2,width/2);
  if(mousePressed){
  fill(255,21,21);
}
  //NAS
  ellipse(_x,_y,width/25,height/25);
  //ULLS
  fill(250,250,250);
  ellipse(_x+width/15,_y-width/12,width/8,height/8);
  ellipse(_x-width/15,_y-width/12,width/8,height/8);
  fill(0,0,0);
  ellipse(_x+width/15,_y-width/12,width/30,height/30);
  ellipse(_x-width/15,_y-width/12,width/30,height/30);
  fill(250,250,250);
  ellipse(_x+width/13.5,_y-width/12,width/80,height/80);
  ellipse(_x-width/17,_y-width/12,width/80,height/80);
  //BOCA
  fill(180,120,40);
  ellipse(_x,_y+width/7.5,width/4,height/5);
   fill(0,0,0);
  ellipse(_x,_y+width/7.5,width/16,height/16);
strokeWeight(2);
stroke(110,110,110);
 //cabells lateral esquerra
 line(_x-width/6,_y-width/10,_x-(width/60)*9,_y-width/30);
  line(_x-(width/60)*9,_y-width/30,_x-width/7.5,_y-width/10);
  line(_x-width/6,_y-width/10,_x-(width/60)*11,_y-width/30);
  line(_x-(width/60)*11,_y-width/10,_x-(width/60)*11,_y-width/30);
   //cabells lateral dreta
  line(_x+width/6,_y-width/10,_x+(width/60)*9,_y-width/30);
  line(_x+(width/60)*9,_y-width/30,_x+width/7.5,_y-width/10);
  line(_x+width/6,_y-width/10,_x+(width/60)*11,_y-width/30);
  line(_x+(width/60)*11,_y-width/10,_x+(width/60)*11,_y-width/30);
   //posicio X
  if((_x-width/5<0)||(_x+width/5>width)){
    velX = -velX;
  }
    //posicio Y
  if((_y-width/3.5<0)||(_y+width/4>height)){
    velY = -velY;
  }
}
// el personatge reapareix on apretis amb el ratoli
void mousePressed(){
  
 _x=mouseX;
 _y=mouseY;

}


