
int colores;
void setup(){
  
size(400,400);
background (0);
colores = 50;
}

void draw(){
 colores= colores + 5;

strokeWeight(2);

 rectMode(CENTER);
       fill (mouseY,mouseY,mouseX );
          rect(200,200,200, 200);
                fill (mouseY,mouseX,mouseY );
 ;        rect(200,200,180, 180);
        fill (mouseX,mouseY,mouseY );
        rect(200,200,160, 160);
                         fill (mouseX,mouseX,mouseY );
       rect(200,200,140, 140);
               fill (mouseX,mouseY,mouseX );
      rect(200,200,120, 120);
                               fill (mouseY,mouseX,mouseX );
     rect(200,200,100, 100);
       fill (mouseY,mouseY,mouseX );
    rect(200,200,80, 80);
                fill (mouseY,mouseX,mouseY );
   rect(200,200,60, 60);
        fill (mouseX,mouseY,mouseY );
 rect(200,200,40, 40);
}

