
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
 fill(mouseX ,x,40);
  rect(x,y,15,225);
  fill(38,300,250);
  ellipse(x+40,y+20,455,25);
  fill(225,x,50);
  ellipse(x+20,y+400,35,49);
  fill(200,x,0);
  ellipse(x+40,y+200,20,20);
  
  
  x = x + 20;
}
y = y + 100;
}
}


