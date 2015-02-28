

size(600,600);
smooth();
background(255);

for(int i=0;i<width; i+=10){
  for(int j=0;j<height;j+=10){
    if(i%20==0 && j%20==0){
      fill(255,0,0,100);
    }else{
        noFill();
      }
    ellipse(i,j,1,1);
   }
}

for (int i=25; i<600; i+=100){
  for (int j=25; j<600; j+=100){
    fill(0);
    noStroke();
    line (i,j,100,100);
    rect (i,j,50,50);
     fill(255);
    ellipse(300,300,100,100); 
   
    
     
  }
}
 

