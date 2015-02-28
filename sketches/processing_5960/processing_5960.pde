
int x;
int y;

void setup(){
  size(600,600);
}

void draw(){
  background(0);

    y = 0;
while(y < 600){ 
 x = 0; 
while (x < 600){
  fill(mouseX ,225,0);
  rect(x,y,50,25);
  fill(0,0,255); 
   rect(x+15,y,10,35); 
  y = 0;
while(y < 600){ 
 x = 0; 
while (x < 600){
  fill(mouseX ,225,0);
 beginShape(TRIANGLE_STRIP);
vertex(x, y);
vertex(40, 20);
vertex(50, 75);
vertex(90, 20);
vertex(x, y);
vertex(80, 20);
vertex(x, y);
endShape();
fill(255,x,1250,400);
  ellipse(x,y,12,12);
  fill(25,x,500);
  rect(x,y,50,40);
  
  

  x = x + 50;
}
y = y + 30;
}

}
}
}

