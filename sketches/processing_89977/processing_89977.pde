
color [] pal = {#FFFFFF,#000000,#FF1A00,#FFF700,#000EFF};
int c;

void setup(){
size(600,500);
smooth();


ellipseMode(CENTER);
}

void draw(){
background(c);
  fill(c);
  noStroke();
  ellipse(0,0,30,30);
  
  fill(pal[1]);
  ellipse(width/5,450,30,30);
  
  fill(pal[2]);
  ellipse(width*2/5,450,30,30);
  
  fill(pal[3]);
  ellipse(width*3/5,450,30,30);
  
  fill(pal[4]);
  ellipse(width*4/5,450,30,30);  
 
 
  
if((dist(width/5,450,mouseX,mouseY) < 30/2 )&& (mousePressed)){
  background(pal[1]);
   fill(pal[1]);
  ellipse(width/5,450,30,30);
  
  fill(pal[2]);
  ellipse(width*2/5,450,30,30);
  
  fill(pal[3]);
  ellipse(width*3/5,450,30,30);
  
  fill(pal[4]);
  ellipse(width*4/5,450,30,30);
} else {
  c = pal[0];
}
if((dist(width*2/5,450,mouseX,mouseY) < 30/2 )&&(mousePressed)){
  background(pal[2]);
   fill(pal[1]);
  ellipse(width/5,450,30,30);
  
  fill(pal[2]);
  ellipse(width*2/5,450,30,30);
  
  fill(pal[3]);
  ellipse(width*3/5,450,30,30);
  
  fill(pal[4]);
  ellipse(width*4/5,450,30,30);
} else {
  c = pal[0];
}
if((dist(width*3/5,450,mouseX,mouseY) < 30/2 )&&(mousePressed)){
  background(pal[3]);
  fill(pal[1]);
  ellipse(width/5,450,30,30);
  
  fill(pal[2]);
  ellipse(width*2/5,450,30,30);
  
  fill(pal[3]);
  ellipse(width*3/5,450,30,30);
  
  fill(pal[4]);
  ellipse(width*4/5,450,30,30);
} else {
  c = pal[0];
}
if((dist(width*4/5,450,mouseX,mouseY) < 30/2 )&&(mousePressed)){
  background(pal[4]);
 fill(pal[1]);
  ellipse(width/5,450,30,30);
  
  fill(pal[2]);
  ellipse(width*2/5,450,30,30);
  
  fill(pal[3]);
  ellipse(width*3/5,450,30,30);
  
  fill(pal[4]);
  ellipse(width*4/5,450,30,30);
} else {
  c = pal[0];
}
}
