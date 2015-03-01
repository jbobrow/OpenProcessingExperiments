
int lineA = 100;
int lineB = 600;
int[] x_values = new int[lineA];
int[] y_values = new int[lineB];

 
void setup(){
  size(600,600);
 colorMode(HSB);
  for(int x = 0; x < x_values.length; x++){
    x_values[x] = int( random(width) );
 }
  for(int y = 0; y< y_values.length; y++){
   y_values[y] = int( random(width) );
}
}
void draw(){
  background (26,4,88);

  
 for(float y = 0.1; y<y_values.length; y++){
stroke(random(y),118,97);
  rect(width,height,300,300);
  
  fill(random(y),176,225);
  ellipse(random(width),random(height),30,30);
   if (mousePressed && (mouseButton == LEFT)) {
  fill(y,y,220);
  ellipse(random(width),random(height),50,50);
  
 }
  else if (mousePressed && (mouseButton == RIGHT)) {fill(y/3,y,210);
  ellipse(random(width),random(height),30,30);}  
   
}

 for(float x=0.01; x<x_values.length;x++){

   rect(random(width),random(height),5,3);
 }
  
}

