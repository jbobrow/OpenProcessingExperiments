

int txtsize = 100;
size (600,600);
background (214,2,2);
smooth();

for (int i=0; i<500; i+=100){
  for (int j=0; j<500; j+=100){
    fill(0);
    noStroke();
    ellipse (i,j,100,100);
    rect (i,j,50,50);
    
   
    
  }
}

for (int i=0; i<500; i+=100){
  for (int j=0; j<500; j+=100){
    fill(255);
    ellipse (i,j,70,70);
    
  }
}


for (int i=0; i<500; i+=100){
  for (int j=0; j<500; j+=100){
    fill(0);
    noStroke();
    ellipse (i,j,20,20);  
  }
}



