
float s;
float space=30;
float distance = 0.0;
 
void setup() {
  size(400, 400);
  background(255);
  smooth();
}
 
void draw() {
   
  background(255);
   
  stroke (50, 100);
   
  // ilim and jlim represent "how many squares will fit?"
  float ilim = width / space;
  float jlim = height / space;
   
  float x = 0;
  float y = 0;
   
  // here we have a loop inside a loop!
  // the "j" loop draws a column or squares down
  // the the "i" loop moves to the right, so the next column is drawn further over
  
  for(int i = 0; i < ilim; i++)
  {  
      for(int j = 0; j < jlim; j++)
      {
         
          x = i * space;
          y = j * space;
           
          // some math magic to find this square's distance from the mouse
          // ...please feel free to ignore this...
          distance = (x - mouseX) * (x - mouseX) + (y - mouseY) * (y - mouseY);
          distance = sqrt(distance);
          if(distance < space+30){
          s=60-distance;
          }else{
          s=0;
        }
           
          // use distance for the color of this square
          noStroke();
          fill(distance*5,255-distance,255-distance*10,100);
          ellipse(x, y, s, s);
      }
  }
   
}



