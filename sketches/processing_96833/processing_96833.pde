
int mida=100;
int x=300;
int y=500;
int velX=4;
int vely=4;
int sz=300;
int value=1;


void setup() {
  size(600, 600);
  background(0);
  velX = 4;
  vely = 4;
  frameRate(60);
  
   
}
  
void draw() {
  background(172,237,240);
  fill(252,255,93);
  x = x+velX;
  y= y+vely;
   
  //cara
 fill(map(x,0,width,0,255),map(y,0,height,0,255),78);
  ellipse(x,y-50,270,120);
  ellipse(x,y,300,mida);
  ellipse(x,y-70,260,120);
  ellipse(x+90,y-50,mida,mida);
  ellipse(x-90,y-50,mida,mida);
   
  ellipse(x-100,y-27,120,120);
  ellipse(x+100,y-27,120,120);
   
  ellipse(x-105,y-40,mida,mida);
  ellipse(x+105,y-40,mida,mida);
   
  ellipse(x-100,y-60,80,80);
  ellipse(x+100,y-60,80,80);
  noStroke();
   
  //ulls
  fill(255,255,255);
  ellipse(x-80,y-60,30,50);
  ellipse(x+80,y-60,30,50);
   
  fill(0);
  ellipse(x-80,y-60,x*0.09,y*0.09);
  ellipse(x+80,y-60,x*0.09,y*0.09);
   
  //boca
  fill(255,255,255);
  ellipse(x,y+10,x*0.09,y*0.09);
  
   if((x<sz/2)||(x>width-sz/2)){
    velX = -velX;
   }
    if((y<sz/2)||(y>height-sz/6)){
    vely = -vely;
if((mouseX > 0) || (mouseY <0)){
background(255,98,98,98);

}
    }
}
void mousePressed() {
  x = mouseX;
  y= mouseY;
  velX =4;
  vely =4;
  if (value == 1){
  fill(0);
  ellipse(width/2,height/2,100,100);
  }
}

    



