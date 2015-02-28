
float r;
float g;
float b;
float mark;
float diam;
float x;
float y;
int number;

void setup(){
  size(600,600);
 background (255,g,b);
  smooth();
}
void draw(){
  r=random(255);
  g=random(255);
  b=random(255);
  mark=random(255);
  diam= random(x);
  x=random(width);
  y=random(height);
  fill(r,g,b,mark);
  ellipse(x,y,diam,diam);
  diam= diam*20;
  println("alpha =" +mark);
  
  
}

void keyPressed(){
  
  if(key== 's'){
  println(" Saving your file bro...");
  String s= "screen" + nf(number,4) + ".jpg";
  save(s);
  number++;
  println("Done Saving.");
  }
}
  

  
  


