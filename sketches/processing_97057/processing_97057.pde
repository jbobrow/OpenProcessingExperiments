
int atomo= 100;
int ull = 20;
int bo = 10;
 
int ullo = 30;
int boc = 15;
int posx = 50;
int posy= 50;
int velx= 8;
int vely = 4;
void setup() {
  size(600,600);
   
}
void draw() {
 if( mousePressed==true) {//el ke pasa quan el mouse es clica
   posx=posx+velx;
   posy=posy+vely;
  //restriccions
  if (posx  > 550) {
   
    velx = -velx;
   
  }
   if (posy <50) {
    vely = -vely;
    
  }
 
 
   
  
  if (posx <50) {
     velx = -velx;
   
  }
    
   if (posy > 550) {
    vely = -vely;
   }
 

  background(255);
strokeWeight(3);
stroke(0);
  fill(posx,posy,15);
    
  ellipse(posx,posy,atomo,atomo);
  fill(0);
   ellipse(posx-ullo,posy-boc,posx/15,ullo);
   ellipse(posx+ullo,posy-boc,posx/15,ullo);
rect(posx-boc, posy,30,15);
 //Quan no es clica
} else {
  
  
  posx=posx+velx;
   posy=posy+vely;
  
  //paredesX
  if (posx  > 350) {
   
    velx = -velx;
   
  }
   if (posy <50) {
    vely = -vely;
    
  }
 
 
   
  //parde-rebote(y)
  if (posx <50) {
     velx = -velx;
   
  }
    
   if (posy > 125) {
    vely = -vely;
   }
 


 

 
   
  background(0);
  fill(255);
   rect(0,0,400,175);
  
   
strokeWeight(3);
stroke(255);
  fill(posx,posy,15);
    
  ellipse(posx,posy,atomo,atomo);
  fill(posx/3);
   ellipse(posx-ull,posy-boc,posx/15,ullo);
   ellipse(posx+ull,posy-boc,posx/15,ullo);
  curve(posx-ull, posy-atomo, posx-ull, posy+boc, posx+ull, posy+boc, posx+ull, posy-atomo);
  line(posx-ull,posy+boc,posx+ull,posy+boc);
  fill(150);
   rect(0,0,15,175);
   rect(45,0,15,175);
   rect(90,0,15,175);
   rect(135,0,15,175);
   rect(180,0,15,175);
   rect(225,0,15,175);
  rect(270,0,15,175);
   rect(315,0,15,175);
    rect(360,0,15,175);

}
}
  
  
 




