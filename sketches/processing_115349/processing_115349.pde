
int shapes = 300; 
int[] y_values = new int[shapes];

void setup(){
  size(600,600);

  for(int y = 0; y< y_values.length; y++){
   y_values[y] = int( random(width) );
}
}

void draw(){
  background (0);
  
//-------------------------------------------//upper blue/red plane COLOR CHECKED
   for(int y = 0; y<y_values.length; y++){ 
    
    stroke(245,109,94);//red
    line(mouseX,y,0,0);
   
    stroke(34,39,227);//blue
    line(mouseX,y,600,0);
    line(y,600,mouseX,300);
}

////-------------------------------------------//base triangles COLOR CHECKED
  for(int i = 0; i <= 600 ; i+=6){  
    
   strokeWeight(1);//red
   stroke(232,103,98);
   
    line(600,0+i,mouseX,300);
    line(600,0+i,300,300);
  
    stroke(98,151,255);//blue
    line(0,0+i,mouseX,300);
    line(0,0+i,300,300);
   
    stroke(150,243,252);//turquoise 
    line(i, 0, 300,300);
    line(i, 600, 300,300);   
}
}
