
float maVariable;
void setup(){
  maVariable=5;
  size (1680,800);
  int nombrelignes;
  size(800,600);background(0);
}
void draw (){
  maVariable=maVariable+1;
  println (random(255));
  fill (random (90),21,0,00);
  line (mouseX,mouseY,maVariable,maVariable);
   stroke(random(255),random(25),random(55),random(110));
   line(mouseX,mouseX,maVariable,maVariable);
  println(random(100));
   fill(random(25),25,25,25);
   ellipse (mouseX, mouseY,maVariable,maVariable);
    fill (random (10),10,1,1);
  ellipse (mouseX,mouseY,maVariable,maVariable);
   stroke(random(255),random(25),random(255),random(110));
   ellipse(mouseX,mouseX,maVariable,maVariable);
  println(random(100));
   fill(random(25),25,25,25);
   ellipse (mouseX, mouseY,maVariable,maVariable);
}

  

void mouseClicked (){
  maVariable=0;
}

