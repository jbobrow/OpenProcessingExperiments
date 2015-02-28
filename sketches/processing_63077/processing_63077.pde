

size(600, 600);
background(255);
smooth();
noFill();
stroke(155,50);

for (int i = 10; i<= 600 ; i=i+20){
  for (int j = 10; j<= 600 ; j=j+20){
  line(i,j,590,590);
  line(i/2,j/2,i*2,j*2);
  
  
  //ellipse(width/2,height/2,i*10,i);
    //ellipse(width/2,height/5,i*5,i/2);
  }
}



