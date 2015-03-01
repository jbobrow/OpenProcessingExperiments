
size(400,400);
background(0);





  
//spotlight background from right corner
for(int x=0;x<=width;x+=1){
    noStroke();
    fill(x/2);
    
  ellipse(width-x,x,x,x);


  //circle spotlight under rope
for(int q=0;q<=width;q+=1){
noStroke();
fill(q/2);
  ellipse(100,300,q/2,q/2);
  

  }
  
}



    
    //bottom knot in rope
stroke(10);
fill(79,43,2);
ellipse(130.3,269.5,18,18);


//row of circle from bottom knot to middle knot
stroke(10);
fill(79,43,2);
for(int w=135;w<=225;w+=5){
  ellipse(w,width-w,15,15);
}
//middle knot in rope
stroke(10);
fill(79,43,2);
ellipse(230.5,169.5,18,18);

//row of circles from top knot
stroke(10);
fill(79,43,2);
for(int t=235;t<=300;t+=5){
  ellipse(t,width-t,15,15);
  

//top knot in rope
stroke(10);
fill(79,43,2);
ellipse(305.5,94,18,18);


  
  
  
    //row of circles from top right diagonal
stroke(10);
   fill(79,43,2);
    for(int i=310;i<=width;i+=5){
      ellipse(i,width-i,15,15);
      


    }
    
   
   
   
   
   
   
    
    }
    
    //shadow circle
   noStroke();

   fill(0);
    ellipse(111,288,30,30);


