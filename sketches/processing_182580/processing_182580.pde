
size(400,800);
for(int i=0;i<1000;i=i+40){
  for(int o=0;o<800;o=o+1){
    float b=random(400);
    float w=random(255);
    float q=random(200);
    float r=random(255);
    noStroke();fill(w,q,r,150);ellipse(b,i,w,w);
  }
}

save("pink.jpg");
