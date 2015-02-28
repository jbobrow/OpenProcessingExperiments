
size (400,400);
background(0);
 
 
   
  for(int i=0; i<=width; i+=10){
    for(int j=height/2-50; j<=height; j+=10){
      stroke(255,0+i,0);
     line(i,0, i,height);//linee verticali
      line (width/2-50,j,height,j);}}//com'è che non prendono la sfumatura?
      
  for(int i=0; i<=width; i+=10){
 for(int j=0; j<=height; j+=10){
       
          if(i<=width/2-50){
            if(j<=height/2-50){
                stroke(255,0+i,0);
                line (0,j,height/2-50,j);
      stroke (0,197,255);
      point(i-5,j-5);}}
   
  }}

