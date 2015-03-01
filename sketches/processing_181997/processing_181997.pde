
void setup(){
  size(500,500);
  smooth();
 background(255);
  
}
float a, b, c;
void draw(){
 
  fill(255,0,0);
  noStroke();
  ellipse(width/2,height/2,100,100);
 if (mousePressed){
    ellipse(width/4,height/4,50,50);
  ellipse(width/2+125,height/2-125,50,50);
  ellipse(width/4,height/4+250,50,50);
  ellipse(width/4+250,height/4+250,50,50);
}

}
void keyPressed(){
  key=ENTER;
   ellipse(sin(a)*tan(c)*(250),sin(a)*tan(b)*(250),50, 50);
 
  a = a + 0.95;
  b = b + 0.95;
  c = c + 0.15;
}
