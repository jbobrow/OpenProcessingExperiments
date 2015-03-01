



int eSize = 10;


size(400,400);
smooth();




for(int y =0; y<=400; y+=10){
for(int x=0; x<=400; x+=10){
  
  stroke(y,x,y,0);
  
  fill(28,y,x,255);
  
  rect(x, y, eSize, eSize);
  
  stroke(#F9FF67,100);
  strokeWeight(3);
  line(0 ,height, x, y);

   } 
}




for(int y=50; y<height; y+=20){
  for(int x=0; x<width; x+=70){

  if(y > 100 && y< 300){
    
          fill(255,10);  
  }
    
    
    else{  
      fill(#FFD700);  
      
      
    }
    ellipse(x, y, eSize, eSize);
    println("x=" + x + ", y=" + y);  
  }
}
  

  fill(#15FFD6,100);
  ellipse(0,20,60,60);

  fill(#5586FF,100);
  ellipse(70,20,60,60);
  
  fill(#FF55E9,100);
  ellipse(140,20,60,60);
  
  fill(#FF1F57,100);
  ellipse(210,20,60,60);
  
  fill(#A41FFF,100);
  ellipse(280,20,60,60); 

  fill(#1FFF55,100);
  ellipse(350,20,60,60); 
  

   fill(#15FFD6,100);
  ellipse(90,200,60,60);

  fill(#5586FF,100);
  ellipse(200,55,60,60);
  
  fill(#FF55E9,100);
  ellipse(30,80,60,60);
  
  fill(#FF1F57,100);
  ellipse(100,210,60,60);
  
  fill(#A41FFF,100);
  ellipse(150,280,60,60); 

  fill(#1FFF55,100);
  ellipse(350,100,60,60); 
  
  
  


