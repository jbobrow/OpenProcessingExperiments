

      int movex, movey, velx,vely;
void setup(){
  size(400,400);
  smooth();
  movex = width/2;
  movey = width/2;
  velx = 3;
  vely = 2;
}
void animate(){
ellipse(movex,movey,60,60);
movex = movex+velx; 
movey = movey+vely;
if(movex+30 >= width || movex-30<= 0){
velx = velx * -1;
}
if(movey+30 >= height || movey-30 <= 0){
  vely = vely * -1;
}
}
void draw(){
  animate();
}          
                
