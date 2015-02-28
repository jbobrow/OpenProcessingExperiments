
size(500,500);
background(#FFFFFF);

for(int x=10;x<=500;x+=15){
  for(int y=10;y<=500;y+=15){
    if((x )==0){
      strokeWeight(2);
      line(x,y,x-5,y-5);
    }else{
     
     //red rectangle 
     //if I add stroke,pattern in the negative space will appear
     fill(#FF0000); 
     rect(x,y,5,5);
    }}}
    
    //Lines
    for ( int x=10;x<500;x+=10){
    line(x,5,x,500);
    }
    

