
size(300,300);
for(int x=30;x<300;x+=30){
if((x/2)%2==0){
  fill(0,255,0);
  ellipse(x,height/2,25,25);
}
else{
  fill(255,0,0);
  rectMode(CENTER);
  rect(x,height/2,25,25);
}
println(x);
}

