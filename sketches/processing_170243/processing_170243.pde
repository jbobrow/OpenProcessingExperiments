
int eSize = 10;

size(400,400); 


colorMode(RGB,400); 


background(400); 


noStroke(); 

smooth();

for(int x = 0; x <= width; x += 20){
  
  if(x == 10 ||x == 300 || x == 360){
   fill(20,20,x);

stroke(255,255,255,150);  

 strokeWeight(3);  

fill(255+x,224,80,50);

ellipse(0,200,x,x); 

 ellipse(400,200,x,x); 
 ellipse(200,400,x,x); 
 ellipse(200,0,x,x); 
 ellipse(200,200,x,x); 

  }else{
fill(46, x,180,20);

  
 ellipse(200,200,x,x); 


  }
  
  ellipse(x,height/2,eSize,eSize);
  println(x);
}
    


