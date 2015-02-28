
color[] colores={#E3B137,#86A1A9,#6F1222,#26404D,#F2E4CA};

void setup(){
  frameRate(10); 
 size(600,600);
 noStroke();
}
float x=3;
void draw(){
  background(255);
  dibujarCirculo(mouseX,mouseY);
  
 
}
void mousePressed() {
    noLoop();
}

void mouseReleased() {
  loop(); 
 
}
 void dibujarCirculo(int dx, int dy){
   fill(colores[int(random(5))]);
   ellipse(dx,dy,100,100);
     background(0);
  float w=width/10;
  if(mouseX>0&&mouseX<w){
  x=w/10;
  }else if(mouseX>w&&mouseX<w*2){
  x=w/9;  
  }else if(mouseX>w*2&&mouseX<w*3){
  x=w/8;  
  }else if(mouseX>w*3&&mouseX<w*4){
  x=w/7;  
  }else if(mouseX>w*4&&mouseX<w*5){
  x=w/6;  
  }else if(mouseX>w*5&&mouseX<w*6){
  x=w/5;  
  }else if(mouseX>w*6&&mouseX<w*7){
  x=w/4;  
  }else if(mouseX>w*7&&mouseX<w*8){
  x=w/3;  
  }else if(mouseX>w*8&&mouseX<w*9){
  x=w/2;  
  }else if(mouseX>w*9&&mouseX<w*10){
  x=w;  
  }
  
  rectMode(CENTER);
for(int i=1;i<=9;i++)
{
  fill(colores[int(random(5))]);
  //puntos horizontal
      stroke(colores[int(random(5))]);
      strokeWeight(random(.5,2));
      rect(i*w, w, x,x);
    
    for(int j=1;j<=9;j++)
    {
      fill(colores[int(random(5))]);
      //puntos vertical
      stroke(colores[int(random(3))]);
      strokeWeight(random(.5,2));
      rect(i*w,j*w, x,x);
    }
}
   
 }
  



