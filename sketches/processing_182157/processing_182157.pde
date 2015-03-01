
size(1000,300);

for(int i=0;i<1000;i=i+4){
  for(int x=0;x<600;x=x+6){
  float r=random(300);
  float m=random(255);
  float n=random(255);
  float l=random(255);
  fill(x,x,x);noStroke();rect(i,r,x,10);
  }

}

for(int b=0;b<1100;b=b+25){

  
  float a=random(400);
  float m=random(40);
  
    fill(a,a,a);rect(b,a,65,300);
}
  
