
size(200,200);
background(0);
noStroke();
colorMode(HSB,200);  
for (int x = 0; x < 200; x++){
  fill (x*90+10, (x*20)+10,255);
  rect(x*30, 75, 10, 10);
  rect (x*30, 105, 10, 10);
  rect (75,x*30,10,10);
  rect (105,x*30,10,10);
}
