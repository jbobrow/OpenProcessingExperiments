

size (500,500);
background(0);
translate(250,250);
for(float i=0;i<500;i++){
  

 rotate(0.050);
 smooth();

 
strokeWeight(6);
stroke(random(255),random(255),random(255),random(50));
line(i,0,0,0);
 


stroke(16,68,255);
fill (255,011,145);
 rect(i,0,50,50);
 
stroke(4,43,181);
fill(127,003,071,100);
 rect(i,0,70,70);
 
stroke(1,23,102);
fill(063,003,071,100);
 rect(i,0,90,90);


}
