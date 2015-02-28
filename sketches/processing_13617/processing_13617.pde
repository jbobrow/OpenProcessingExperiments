
void setup(){
  size(200,200);
background(0);
smooth();
}

void draw(){
  int i=0;
  for(int a=0; a<200; a=a+5){
  for(int b=0; b<200; b=b+5){
  float d= dist(a,b,100,100);
  float c=(sin(radians(d*150+i)+1))*200;
  float e=(cos(radians(d*150+i)+1))*200;
  stroke(0,random(c),random(255));
  
  
  fill(0);
  float x=random(40);
  ellipse(e,c,x,x);
  ellipse(200-e,200-c,x,x);
  stroke(200,random(e),0);
  ellipse(e,200-c,x,x);
  ellipse(200-e,c,x,x);
  }
  }
i=i+5;

  
}
                
                                                
