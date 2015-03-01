
/*
i love me a good pancake
                        -plato
*/

//click for thing to draw thing yes yes

void setup(){
  background(255);
  size(500,500);
}

void draw(){
  if (mousePressed==true){
  thing(mouseX, mouseY);
  }
}

void thing(int x, int y){
  fill(0);
  ellipse(x,y,100,100);
  ellipse(x+30,y+30,60,60);
  ellipse(x+30,y-30,60,60);
  ellipse(x-30,y-30,60,60);
  ellipse(x-30,y+30,60,60);
  ellipse(x+40,y,60,60);
  ellipse(x-40,y,60,60);
  ellipse(x,y+40,60,60);
  ellipse(x,y-40,60,60);
 
  line(x,y,x+80,y+80);
  line(x,y,x-80,y+80);
  line(x,y,x+70,y+80);
  line(x,y,x-70,y+80);
  line(x,y,x+60,y+80);
  line(x,y,x-60,y+80);
  fill(255);
  ellipse(x+20,y-20,10,10);
  ellipse(x-20,y-20,10,10);
  ellipse(x,y+10,20,10);
  fill(0);
  ellipse(x+20,y-20,3,3);
  ellipse(x-20,y-20,3,3);
}

void keyPressed(){
  if (key== ' '){
    background(255);
  }
}

