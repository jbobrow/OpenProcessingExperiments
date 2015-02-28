
int px;
void setup() {
size(600,300);

px=0;
}

void draw() {
 //céu noite
background(21,25,116);

//Lua

fill(230);
ellipse(60,40,60,60);
 
   //Prédio
 
fill (255);
stroke(255);
rect(400,20,190,220);
 
{{
 fill(245,235,30);
int x;
int y;
for (y=60; y<240; y=y+15)
for (x=410; x<580; x=x+15)
rect(x,y,10,10);}


if(mousePressed) {
//céu dia
  background(102,125,252);

 //sol
  fill(255,235,46);
  ellipse(60,40,60,60);
   
    //Prédio
fill (255);
stroke(255);
rect(400,20,190,220);

 fill(50);
int x;
int y;
for (y=60; y<240; y=y+15)
for (x=410; x<580; x=x+15)
rect(x,y,10,10);
//prédio

}
}

  //Prédio

fill(255);
rect(400,135,190,25);

//Rua
px++;
stroke(0);
fill(20);
rect(0,240,600,60);
fill(245,235,30);
for(int x=0; x<600; x=x+80)
rect(x,270,40,5);
//Carro

fill(100,100,100);
stroke(100,100,100);
px++;
ellipse (px+30,230,60,40);
fill(200);
stroke(0);
ellipse (px+30,230,50,30);
line(px+30,215,px+30,250);
fill(100,100,100);
stroke(100,100,100);
ellipse (px+60,245,50,30);
ellipse (px,245,30,30);
fill(0);
ellipse (px+10,260,20,20);
ellipse (px+50,260,20,20);
fill(100,100,100);
ellipse (px+10,260,10,10);
ellipse (px+50,260,10,10);
rect (px,230,60,30);


}
