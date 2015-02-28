
size(500,500);

background(255,243,62);

stroke(255);
for(int x = -16; x < 500; x +=10){
  line(x, 0, x+15, 500);
 
  
}

strokeWeight(1);
for(int x= 0; x < 500; x+= 10){
  line(x, 500, x+15, 100);
 
  
}

stroke(255,250);
for ( float x = 0; x < 500; x +=10){
  line(0, 0, x, 500);
  
  
  
}

strokeWeight(2);
stroke(125);
for(int x= 0; x < 500; x+= 10){
  line(x, 0, x+0, 500);
 
}
stroke(255,243,62,210);
for (int x = 0; x< 500; x+=20){
  line( 0, 0, 500, x);
}
stroke(255,250);
for ( float x = 0; x < 500; x +=10){
  line(0, 0, x, 500);
  
  
  
}

