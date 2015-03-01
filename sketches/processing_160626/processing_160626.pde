
PImage yyy;
float speed = 1.0;
float move;
void setup() {  //setup function called initially, only once
  size(600, 449);
  yyy=loadImage("http://previewcf.turbosquid.com/Preview/2014/05/25__23_00_00/Rechin3.JPGb6dd5bf7-11d0-4277-b4c5-f5195e68cb9aLarger.jpg");
        
}
    
void draw() {  //draw function loops
  move=move+speed;
      
  image(yyy,move,10);
  if (move>500){
  move=0
  }
    
  }

