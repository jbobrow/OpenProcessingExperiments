
// Joan Vilalta 
// grup 4
// Practica 3b
float posx = 200;
float velx = 5;

float posy = 200;
float vely = 3;


void setup(){
   
  size(800,700);
background(30,140,20);
   
}
 
void draw(){
 
  if (posx > width/2){   fill(255);}
  rect(-10,-10,810,810);
  fill(255,0,0);
triangle(posx-110,posy-80,posx-80,posy-110,posx-80,posy-50);  triangle(posx-70,posy-80,posx-100,posy-110,posx-100,posy-50);
stroke(0,0,255);
  
line(posx-80,posy-90,posx-30,posy-90);
line(posx-80,posy-70,posx+130,posy-70);
 
 line(posx-30,posy-90,posx-30,posy+30);
 
stroke(255,0,255);
fill(34,54,56);
ellipse(posx-70,posy+30,80,50);
  
strokeWeight(3);
  
fill(32,posx,255);
triangle(posx+130,posy+130,posx+130,posy-70,posx-70,posy+130);
  
fill(30,posy,255);
triangle(posx+125,posy+125,posx+125,posy-30,posx-30,posy+125);
  
fill(32,posx,255);
triangle(posx+120,posy+120,posx+120,posy+10,posx+10,posy+120);
  
fill(posx,30,255);
triangle(posx+115,posy+115,posx+115,posy+50,posx+50,posy+115);
 
 
  posx = posx + velx;
      posy = posy + vely;
      
      
      
      if ((posx + 130 >= width)||(posx - 110 <= 0)){
      velx = -velx;
    
  }
  
  if ((posy + 120 >= height)||(posy - 110 <= 0)){
      vely = -vely;
    
      
}

}

void mousePressed() {
 
  posx = mouseX;
  posy = mouseY;
   
if (velx == 30){
  velx = 5;
} else {
velx = 30;
}
if (vely == 25){
  vely = 3;
} else {
vely = 25;
}


}




