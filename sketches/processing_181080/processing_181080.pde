
//lauraknox
int headX = 95;
int headY = 80;
//eyes
int leyeX = 80;
int leyeY=80;
int reyeX=110;
int reyeY=80;
//legs
int llegXa=105;
int llegXb=115;
int llegYa=160;
int llegYb=170;
int rlegXa=85;
int rlegXb=75;
int rlegYa=160;
int rlegYb=170;
//body
int rectA=85;
int rectB= 90;
int rectC = 20;
int rectD = 70;
void setup(){
    size(500,500);
    background(#EAA4FA);
    fill(150);
    //body
    rect(rectA,rectB,rectC,rectD);
    //head
    fill(255);
    ellipse(headX,headY,50,50);
    //leftleg
    line(llegXa,llegYa,llegXb,llegYb);
    //rightleg
    line(rlegXa,rlegYa,rlegXb,rlegYb);
    fill(0);
    //left eye
    ellipse(leyeX,leyeY,10,30);
    //right eye
    ellipse(reyeX,reyeY,10,30);
    fill(255);
    
}

void draw(){
  background(#EAA4FA);
  
  
  
   fill(150);
    //body
    rect(rectA,rectB,rectC,rectD);
    //head
    fill(255);
    ellipse(headX,headY,50,50);
    //leftleg
    line(llegXa,llegYa,llegXb,llegYb);
    //rightleg
    line(rlegXa,rlegYa,rlegXb,rlegYb);
    fill(0);
    //left eye
    ellipse(leyeX,leyeY,10,30);
    //right eye
    ellipse(reyeX,reyeY,10,30);
    fill(255);

    
   if (mousePressed==true)
      {println("clicked");
   
    
headX=headX+1;
headY=headY+1;
leyeX=leyeX+1;
leyeY=leyeY+1;
reyeX=reyeX+1;
reyeY=reyeY+1;
llegXa=llegXa+1;
llegXb=llegXb+1;
llegYa=llegYa+1;
llegYb=llegYb+1;
rlegXa=rlegXa+1;
rlegXb=rlegXb+1;
rlegYa=rlegYa+1;
rlegYb=rlegYb+1;
rectA=rectA+1;
rectB=rectB+1;
rectC=rectC;
rectD=rectD;
}}

