
void setup(){
  size(600, 600);
  background(209, 15, 15, 10);
 
}

void draw(){
  
  println(mouseX);
  println(mouseY);
  smooth();
  stroke(2);
 int x=0;
 int y=0;
  float chaos=map(x, y,  mouseX, 0, 300);
  
//draw lines
if (mouseX<300){
//limit
      for(int i=0; i<width; i+=10){
        stroke(255);
            line (i, 0, i, width);
      }
          for(int b=0; b<width; b+=10){
            line(0, b, width, b);
          }
}else{

   for(int i=0; i<width; i+=10){
  line(random(i), 0, random(i), width);
   }
 for(int b=0; b<width; b+=10){  
  line(0, random(b), width, random(b));
  
 }

}

}


