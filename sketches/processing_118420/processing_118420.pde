
  int  i;
size(510,510);
background(255);

for (i = 0; i < 40; i++){
  noStroke();
  fill(4,163,255,255 / 10 * i);
  rect(0, height / 10 * i, 50, 50);

  fill(i,255,255,255 / 10 * i);
  rect(60, height / 10 * i, 50, 50);
  
  fill(i,200,255,255 / 10 * i);
  rect(120, height / 10 * i, 50, 50);
  
  fill(i,255,255,255 / 10 * i);
  rect(180, height / 10 * i, 50, 50);
  
  
    fill(4,163,255,255 / 10 * i);
  rect(240, height / 10 * i, 50, 50);

  fill(i,255,255,255 / 10 * i);
  rect(300, height / 10 * i, 50, 50);
  
  fill(i,200,255,255 / 10 * i);
  rect(360, height / 10 * i, 50, 50);
  
  fill(i,255,255,255 / 10 * i);
  rect(420, height / 10 * i, 50, 50);
  
   fill(i,255,255,255 / 10 * i);
  rect(480, height / 10 * i, 50, 50);

}





int eSize = 3;


 for(int x = 0; x <=width; x ++){
   
   stroke(10,250,x,100);
   line(0,0,510,300-x);
   
    stroke(200,200,x,200);
   line(320,0,0,x);
   
    stroke(200,210,x,200);
   line(0,200,x,510);
  
   stroke(200,200,x,200);
   line(220,510,510,x);
   
 }
  
 


