
float lastX;
float lastY;
float r;
float g;
float b;
float lal;
float alpha;

int number;

void setup(){
  size(1200,1200);
background(lal,r,298);

frameRate(666);

  
}

void draw(){
  
 strokeWeight(alpha);

strokeJoin(MITER);
beginShape();
vertex(b, lastX);
vertex(lal, lastY);
vertex(b, lal);
vertex(alpha,g);
 alpha=random(mouseX);
  r=random(lastX);
  g= random(lastX);
  b=random(456);
  lal=random(600);
  lastX=random(lal);
  lastY=random(600);
  fill(r,0,lal,0);
  rect(lal,r,lal,g);
  fill(lal,r,alpha);
  smooth();

  

  ellipse(300,200,300,lastX);
    ellipse(600,400,600,lastX);
      ellipse(900,200,300,lastX);

  line(300,200,300,g);
  if(g>600);
  g= alpha;
  
  println("alpha=" +lal);
  
  
  
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
  
  



