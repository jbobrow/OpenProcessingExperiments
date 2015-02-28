
int eSize = 3;
 
size(510, 510);
background(0);
stroke(130,100,160);

for(int x = 0 ; x <= width; x+=9) {
 stroke(x, 255, 0, 255); 
 line(x, height, 255, 255);
 
 stroke(x, 255, 0, 255); 
 line(width, x, 255, 255);
 
 stroke(x, 255, 0, 255); 
 line(width/2, height/2, x, 0);
 
  stroke(x, 255, 0, 255); 
 line(width/2, height/2, 0, x);
 
 stroke(x, 255, 0, 255); 
 line(width/2, 255, x, height);
 
 stroke(x, 255, 0, 255); 
 line(width/2, 255, 0, x);
 
 stroke(x, 255, 0, 255); 
 line(255, height/2, x, 0);
 
 stroke(x, 255, 0, 255); 
 line(255, height/2, width, x);

}






