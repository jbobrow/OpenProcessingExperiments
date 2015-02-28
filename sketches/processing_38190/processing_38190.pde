
size(300,300);
int x=10;

translate(150,150);
float r= (random (255));//random color for the fill every run
float g= (random (255));
float b= (random (255));


/*for (int fil=0; fil<=255; fil++){
fill(fil);
}*/

for (int rad=0; rad<= 300; rad++){ //rad starts at 0, if it is less than 300 then add one until it reaches 300
  fill(r,g,b);
  stroke(r);
rotate(radians(x));
line(0,0,rad,rad);
ellipse(rad,rad,x,x);
}



