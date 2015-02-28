
 int eSize = 20; 
 size(510,510);
 background(15,15,15); 
 stroke(100,100,100); 
 strokeWeight(8);  
   

 noStroke();
 int box_size =10;
 for(int i = box_size;i < 510 - box_size;i += box_size*2) {
 for(int j = box_size;j < 510- box_size; j += box_size*2) {
  fill(227,34,16);
  rect(i,j,box_size,box_size);
  }
}
  for (int x = 0; x<=width; x ++){ 
  stroke(510,x,60,10);  
  line( width, 0, x, height);  
  stroke(310,x,60,10); 
  line( width, 190, x, height);  
  stroke(310,x,60,10);  
  line( width, -190, x, height);  
  
  stroke(310,x,60,10); 
  line(0,100,x,height); 
  stroke(310,x,40,10); 
  line(0,200,x,height); 
  stroke(510,x,60,10); 
  line(0,300,x,height); 
 
 }



