
//sunrise on the sea

size(800,400);


for(int i=0;i<800;i=i+40){
  for(int o=0;o<800;o=o+1){
    float b=random(800);
    float w=random(900);
    float q=random(200);
    noStroke();fill(0,q,255,150);ellipse(b,i+100,w,w);
  }
}


for(int x=0;x<370;x=x+5){
  
  float l=random(255);
  pushMatrix();
  translate (600,0); rotate(radians(x)); 
  noStroke();
  noStroke();fill(255,220,l,40);rect (0,0,10,1000);
  popMatrix();
}
  
  for( int a=10;a<200;a=a+30){
  float l=random(255);
 fill(255,248,l,20);ellipse(600,0,a,a);
}

  






