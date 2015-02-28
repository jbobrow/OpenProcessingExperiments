
float w;   //2D space width
float h;   //2D space height
float dx;  //increment x this amount per pixel
float dy;  //increment y this amount per pixel
int dt;    //increment time 
int da;    // 

void setup(){
size(400,400);
frameRate(10);
loadPixels();  
 w = 120.0f;         //2D space width 
 h = 120.0f;         //2D space height
 dx = w / width;   //increment x this amount per pixel
 dy = h / height;  //increment y this amount per pixel
 dt = 0;
 da = 0;

}    

  float x1 = 0;
  float x2 = 0;
  float y1 = 0;      
  float y2 = 0;
  
void draw(){
  
  x1 = -w/2 - mouseX/10;  //start x at -1 * width / 2
  x2 = -w/2 + mouseX/10;  
   
 
for (int i = 0; i < width; i++) {
  
 y1 = -h/2 - mouseY/10;  //start y at -1 * height / 2
 y2 = -h/2 + mouseY/10;

  for (int j = 0; j < height; j++) {
    float r1 = sqrt((x1*x1) + (y1*y1));    //convert cartesian to polar
    float r2 = sqrt((x2*x2) + (y2*y2));    //convert cartesian to polar
    
    //float theta = atan2(y,x);         //convert cartesian to polar
    float val1 = cos(r1 - TWO_PI*dt/10);               //calculate a value between -1 and 1
    float val2 = cos(r2 - TWO_PI*dt/10 + PI*da);
    pixels[i+j*width] = color((val1 + val2  +2.0f) * (255.0/4));   //scale that value to 0 and 255
    y1 += dy;    //increment y
    y2 += dy;    
  }
  x1 += dx;  //increment x
  x2 += dx;
} 
  dt += 1; //increment time
  updatePixels();
}

void mousePressed(){
  if(mouseButton == LEFT){    
    da = 1;
  }
  
  if(mouseButton == RIGHT){
    da = 0;
  }
}
  




