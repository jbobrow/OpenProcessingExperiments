
int arribaizquierda = 0;
int abajoizquierda= 0;
int arribaderecha= 0;
int abajoderecha= 0;

void setup (){
size (800,600);


}

void draw (){
 
 background (255);
 strokeWeight(5);
stroke(0);
line (0, 300, 800, 300);
line (400, 0, 400, 600);

  if (mouseX>400&&mouseY>300)
  {
  fill (0, 0, 255);
  rect (400, 300, 400, 300);
  }
  
 if (mouseX>400&&mouseY<300)
 {
 fill (255, 0, 0);
  rect (400, 0 , 400, 300);
 }
 
if (mouseX<400&&mouseY>300)
{
fill (0, 255, 0);
  rect (0, 300, 400, 300);
}
  
  
  if (mouseX<400&&mouseY<300) 
  {
  fill (255,255,0);
  rect (0,0, 400, 300);
}


rectangulos();
}

void rectangulos(){
  frameRate (10); 
for(int i=0; i<height; i+=10) {
for (int a= 0; a<width; a+=10){
fill(0,random(255));
rect (a, i, 10, 10);

}
}
}
 
void mousePressed(){
background (0);
stroke (255, 100);
strokeWeight (5);
smooth();


stroke (255, 0, 0, 255);
noFill();
ellipseMode (CENTER);
ellipse (400, 300, 30, 30);
ellipse (400, 300, 100, 100);
stroke (255, 0, 0, 200);
ellipse (400, 300, 200, 200);
stroke (255, 0, 0, 150);
ellipse (400, 300, 300, 300);
stroke (255, 0, 0, 100);
ellipse (400, 300, 400, 400);
stroke (255, 0, 0, 50);
ellipse (400, 300, 500, 500);
stroke (255, 0, 0, 30);
ellipse (400, 300, 600, 600);
stroke (255, 0, 0, 20);
ellipse (400, 300, 700, 700);
stroke (255, 0, 0, 10);
ellipse (400, 300, 800, 800);


}



