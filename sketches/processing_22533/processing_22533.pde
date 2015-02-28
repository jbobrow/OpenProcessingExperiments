

//using lerpcolor i created a gradient that shows color from blue to red from left to right
void setup()  {
  size(300,300);
}
//the color on the left is blue
//color right is red
color left = color(50,78,190);
color right = color(150,78,50);


void draw(){
  
  for(int v = 0; v< width; v++){
    //space is the amount between the two colors
    float space = norm(v, 0, width);
    
    
    stroke(lerpColor(left, right, space));
    line(v,0,v,height);
  }
}
    
    
    
        


