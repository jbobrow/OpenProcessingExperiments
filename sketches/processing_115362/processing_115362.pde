
int lineA = 100; 
int lineB = 600;
int[] x_values = new int[lineA]; 
int[] y_values = new int[lineB];

void setup(){
  size(600,600);
  
  for(int x = 0; x < x_values.length; x++){
    x_values[x] = int( random(width) );
 }
  for(int y = 0; y< y_values.length; y++){
   y_values[y] = int( random(width) );
}
}
void draw(){
  background (26,4,88);

 
 for(int y = 0; y<y_values.length; y++){
  stroke(237,28,17);
  line(random(width),random(height),300,300);//blue
  
 
  noStroke();
  fill(255);
  ellipse(random(width),random(height),2,2);//white
  
  fill(8,255,220);
  ellipse(random(width),random(height),4,4);//turq
  
  stroke(245,109,94);
  ellipse(random(width),random(height),3,3);//medium pink
 

    
  
}

 for(int x=0; x<x_values.length;x++){
   stroke(252,118,97);
   line(random(width),random(height),300,300);//light blue
 
  }
}
