
int col;
int tam;
int tam2;
int tam3;
void setup(){
noStroke();
    size(600,600);
    background(255);
   colorMode(HSB);
    col = 0;
tam = 0;
tam2 = 50;
tam3 = 100;
}
void draw(){
fill(0,25);
rect(0,0,width,height);
   col = (col+1) % 256;
         fill(col,255,255,15);
    ellipse( random(mouseX/4, mouseX*4) ,random(mouseY/4,mouseY*4), tam3++ , tam3++ );
      fill(col,255,255,50);
    ellipse( random(mouseX/2, mouseX*2) ,random(mouseY/2,mouseY*2), tam2++ , tam2++ );
    fill(col,255,255,100);
    ellipse( random(mouseX-30, mouseX+30) ,random(mouseY-30,mouseY+30), tam++ , tam++ );
if(tam >= 50){tam = 0;};
if(tam2 >= 100){tam2 = 50;};
if(tam3 >= 150){tam3 = 100;};
}



