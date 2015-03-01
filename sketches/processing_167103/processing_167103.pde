
void setup(){
size(500, 500);
background(0);
} 

void draw(){
  stroke(171, 249, 252);                //change line's color
  strokeWeight(3);                      // change line's weight
  for(int b=30; b<height; b+=30){       //for loop to repeat lines
    line(0, 0, width,b);                //x2=width, to draw lines until the border. y2=b, to change height of the lines.  
}
  for(int b=30; b<height; b+=30){      
    stroke(23, 191, 186);
    line(0, width, b, b);
}
}


