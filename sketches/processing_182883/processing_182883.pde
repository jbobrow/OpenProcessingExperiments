
size(800,500);
background(0);
stroke(255);
for(int x=0;x<800;x=x+5){
  for(int y=300;y<500;y=y+5){
    float r = random(250);
    float t = random(800);
    line(x,r,t,y);
  }
}
noStroke();
for(int i=250;i>80;i=i-15){
    float g = random(390,410);
    float h = random(240,260);
    ellipse(g,h,i,i);
    fill(222,0,0,6000/i);
}
