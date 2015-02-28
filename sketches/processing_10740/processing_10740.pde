
color colorRelleno=0;
float fade=3;
float incremento=4.0;
Point[]puntos=new Point[2];
int posX=0, posY=0;
float velRot=1;
void setup(){
  size(350,350);
  smooth();
  noStroke();
  
}

void draw(){
  background(#d9b422,100);
  colorRelleno=#e33dc2;
  incremento=1+random(1);
  translate(width/2,height/2);
  puntos[0]=new Point(mouseX/2+posX-width/2,mouseY/2+posY+height/2);
  puntos[1]=new Point(mouseX/2+posX,mouseY/2+posY+height/2);

  while(puntos[0].x<0){
    fill(colorRelleno);
    colorRelleno+=fade;
    rotate(velRot);
    ellipse(puntos[0].x+=incremento/2,
    puntos[0].y-=incremento/2,
    puntos[1].x-=incremento,
    puntos[1].y-=incremento/2);
    
   
  }
}  


