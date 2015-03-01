
int n=6;
int count=0;
float climax=1;
float theta=1.4;
float d=800/4;
float p=0.5;
textSize(14);

void setup(){
size (800, 500);
background(0);
frameRate(30);
stroke(255);
smooth();
if (n>6){
climax=1-(n-6)/10;
}
}

void childsDP (int n)
{
  if (n>2){
  //the first child
  pushMatrix();
  rotate(theta);
  line(0,0,0,d);
  translate (0,d);
  rotate(-theta);
  theta=theta*p;
  d=d*0.8;
  childsDP (n-1);
  popMatrix();
  //second child
  pushMatrix();
  rotate(-theta);
  line(0,0,0,d);
  translate(0,d);
  rotate(theta);
  theta=theta*p;
  d=d*0.8;
  childsDP (n-2);
  theta=theta/p;
  d=d/0.8;
  popMatrix();
  ellipse (0,0,30,30); //create the node 3 and up
  fill(0);
  text(n,-4,4);
  if (n<count+1){ //turns red
  fill(255,0,0);
  text(n,-4,4);
  }
  fill(255);
  }
  else{
  ellipse (0,0,30,30); //create the node 1 or 2
  fill(0);
  text(n,-4,4);
  if (n<count+1){ //turns red
  fill(255,0,0);
  text(n,-4,4);
  }
  fill(255);
  theta=theta/p;
  d=d/0.8;
  }
}

void draw(){
translate (400,30);
theta=1.4;
d=800/4;
p=0.5;
scale(climax);
background(0); //erase and draw from the beginning
if (count>0 && count<n+1){
text("calculates F("+count+") with DP",0,380); //What Fib(n) calculates
}
if (count<n+1){
childsDP(n);
}
else{
if (count==n+1){
text("Need "+n+" steps using DP", 30,300); //Total steps needed
}
}
count=count+1;
noLoop();
}

void mousePressed(){ //click the mouse to go on
redraw();
}

void childsNoDP (int n)
{
  if (n>2){
  //the first child
  pushMatrix();
  rotate(theta);
  line(0,0,0,d);
  translate (0,d);
  rotate(-theta);
  theta=theta*p;
  d=d*0.8;
  childsnoDP (n-1);
  popMatrix();
  //second child
  pushMatrix();
  rotate(-theta);
  line(0,0,0,d);
  translate(0,d);
  rotate(theta);
  theta=theta*p;
  d=d*0.8;
  childsnoDP (n-2);
  theta=theta/p;
  d=d/0.8;
  popMatrix();
  ellipse (0,0,30,30); //create the node 3 and up
  fill(0);
  text(n,-4,4);
  fill(255);
  }
  else{
  ellipse (0,0,30,30); //create the node 1 or 2
  fill(0);
  text(n,-4,4);
  fill(255);
  theta=theta/p;
  d=d/0.8;
  }
}
