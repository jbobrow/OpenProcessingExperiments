
size(300,300);
colorMode(RGB,100);
background(75);


for(int x = 0; x < width; x+=37){
  if(x % 2 <= 0){
  rectMode(CENTER);
  fill(100,0,0);
  rect(x,height/2,25,25);
}else{
  fill(0,100,0);
  ellipse(x,height/2,25,25);
}
}



