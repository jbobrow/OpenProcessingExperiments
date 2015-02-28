
void setup(){
  size(800,800);
  background(255);
  smooth();
  
}

boolean triangle=false;
boolean ellipse=false;
int weight=1;
int colorPos=0;
color[] colorCollection = { color(204, 153, 0), 
                            color(234, 2, 4),
                            color(111, 0, 190),
                            color(23, 234, 2),
                            color(90, 25, 190),
                            color(250, 0, 90),
                            color(1, 0, 210),
                                
                            };



void draw() {
  strokeWeight(weight);
  stroke(colorCollection[colorPos]);
  if(mousePressed){
    //drawKreuz(mouseX,mouseX);
    drawPoint(mouseX,mouseY);
  }
}
  
void drawKreuz(int x,int y){
    line(x,y-5,x,y+5);
    line(x-5,y,x+5,y);
  }
  
  
void drawPoint(int x, int y){
  if( (triangle==false & ellipse==false) || (triangle==true & ellipse==true) ) {
  line(x,y,pmouseX,pmouseY);
  }
  else if(triangle==true){
  triangle(x, y, x-20, y-20, x+20, y-20);
  }
  else if(ellipse==true){
    ellipse(x, y, 20, 20);
  }
}

 void keyPressed() {
   print(keyCode);
   if(keyCode==67){ //c for color
      nextColor();
   }
   else if(keyCode==66){ //b for bogger
     weight++;
   }
   else if(keyCode==83){ //s for smaller
     if(weight==1){
       weight=1;
     }
     else{
       weight--;
     }
    }
    else if(keyCode==84){ //t for triangle
      triangle=!triangle;
    }
    else if(keyCode==69){
      ellipse=!ellipse;
    }
 }
 
 void nextColor(){
  if(colorPos==colorCollection.length-1){
    colorPos=0;
  }
  else{
    colorPos++;
  }
}


