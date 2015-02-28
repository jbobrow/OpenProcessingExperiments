
color cBright;
color cDull;
color cDark;
int rot=0;
float col=0;

void setup(){
  size(192,157);
  colorMode(HSB,100,100,100);
  cBright=color(0,100,100);
  cDull=color(0,40,100);
  cDark=color(0,100,40);
  colorMode(RGB);
  background(50,50,100+cos(rot));
  
}

void draw(){
  
  noStroke();
  int radius=10;
  colorMode(HSB);
  fill(cDark);
  rect(0,height-35,width,35);

  
  pushMatrix();  
  translate(width*.5,height*.5);
  rotate(radians(rot));  
  colorMode(HSB);
  fill(cDull); 
  ellipse(radius,radius,10*radius,10*radius);
  noStroke(); 
  fill(cBright);
  ellipse(radius,-radius,6*radius,6*radius); 
  popMatrix();
  

  rot=rot+1;
  for(int i=0;i<5;i++){
  strokeWeight(i/3);
  fill(cDark);
  rect(0,height-9*i*cos(col*3.5),width,i);
  }
  noStroke();
 
  cBright=color(col,100,100);
  cDull=color(col-5,70,100);
  cDark=color(col-10,100,40);
  col=col+0.02;
}

