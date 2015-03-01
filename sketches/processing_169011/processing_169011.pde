
size(400, 400);
background(0);
smooth();
  
fill(0);
  
  for(int x=200; x<=400; x +=5){
  
stroke(510,x,60,200);
  line(400,400-x,200,200);
   
  stroke(400,x,60,200);
  line(0,400-x,200,200);  
  
 stroke(300,x,60,200);
  line(400,150+x,200,200);
 
stroke(400,x,60,200);
   line(0,150+x,200,200);
 
stroke(200,x,60,200);
    line(400,250-x,200,200);
 
stroke(200,x,60,200);
    line(0,250-x,200,200); 
  
 stroke(20,x,60,200);
  line(400,0+x,200,200); 
   
  stroke(20,x,60,200);
 line(0,0+x,200,200);
  
stroke(20,x,60,50);
  line(400,100+x,200,200);
   
stroke(20,x,60,50);
  line(0,100+x,200,200);
 
stroke(20,x,60,50);
  line(350,400+x,200,200);
   
stroke(20,x,60,50);
  line(50,400+x,200,200);
}


