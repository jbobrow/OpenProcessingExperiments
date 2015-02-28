
//http://jorgecardoso.eu/processing/Screensaver/
float[] lines = new float[1280];
float[] lines2 = new float[1280];
float x;
float j;
int t;
void setup(){
 size(1280,720);
 frameRate(45);
 for(int i = 0; i < (width-2); i += 1){
   lines[i] = random(height);
   lines2[i] = lines[i];
 }
 x = 0;
 j = 7;
 t = 1;
 smooth();
}
void draw(){
  background(255);
  stroke(0,0,255);
  for(int i= 0; i < width; i++){
    lines2[i] = lines[i];
  }
  for(int i = 0; i < width; i++){
    //Adjusting the value to the left of i
    if( i >= 1){
      if( lines[i] > lines[i-1]){
        //1/10 of difference
        lines[i] -= (((lines2[i]-lines2[i-1])/j) + t);
        lines[i-1] += (((lines2[i]-lines2[i-1])/j) + t);
      }
    }
    //Adjusting the value to the right of i
    if( i <= (width-2)){
      if( lines[i] > lines[i+1]){
        //1/10 of difference0
        lines[i] -= (((lines2[i]-lines2[i+1])/j) + t);
        lines[i+1] += (((lines2[i]-lines2[i+1])/j) + t);
      }
    }
    x += (lines[i]);
    //drawing the line at i to the height of lines[i]
    //line(i, height, i, lines[i]);
    
    if(lines[i] > height){
      lines[i] = height;
    }
    if(lines[i] < 0){
      lines[i] = 0;
    }
    strokeWeight(2);
    point(i, lines[i]);
  }
  stroke(255,0,0);
  //line(0,x/1920,width,x/1920);
  //println(x/width);
  x=0;
  //println(lines[250]);
}
void keyPressed(){
 if(key == 32){
   j = -7;
   t = 0;
 }
  if(key == 114){
    setup();
    draw();
  } 
}
void keyReleased(){
  if(key == 32){
     j = 7;
     t = 1;
  }
}
/*void mousePressed(){
  if(mouseButton == LEFT) {
    lines[mouseX] += 5;
  }
  if(mouseButton == RIGHT){
    lines[mouseX] -= 5;
  }
}
*/


