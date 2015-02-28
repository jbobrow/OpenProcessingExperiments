
int x;
 
void setup(){
  size(250, 250);
  background(255);
  stroke(#FF0505);
  frameRate(105);
  fill(0, 10);
  smooth(); 
  x = 0;
}
  
void draw(){
  x = x - 2;
  rect(-5, -5, width +5 , height +5); 
  translate(width / 2, height / 2);
  rotate(radians(x));
  line(125, -height, 125, height); //corner rotating line
  line(120, -height, 120, height); //first inner rotating line

//line(-height, 125, height, 125); //second corner rotating line
//line(-width, -width, width, width); // middle rotating line
}


