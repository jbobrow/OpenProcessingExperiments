
int i = 50;
size(500,500);
background(0);
smooth();
  
  stroke(200,5,500);
 
  for( int y = 0; y <= height; y = y + i ){
      for( int x = 0; x <= width; x = x + i ){
        line(x,y,0,0,45,45);
        fill(800,200,40);
        ellipse(x,y,40,40,20,25);
        
        fill(400,90,30); 
        rect(x,y,10,20,5,8);
        
        }
}   
                
