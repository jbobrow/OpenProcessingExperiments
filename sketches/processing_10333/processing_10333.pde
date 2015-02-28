
// Set integers for rgb values
        int r = 0; int g = 0; int b = 0;
// Set integers for velocity of change values
        int x = 0; int y = 0; int z = 0;
     void setup() {
       size(600, 510);
       stroke(255);

     } 

     void draw() {
//refresh between each frame
       background(230, 200, 209);
//if r value reaches full, set the change value to -5
  if(r >= 255) {
    x=-5;
//if r value gets down to 0, set the change value to 5 to start cycling back up
  }else if(r <= 0) {
    x=5;
}
//alter the r value by the change integer
  r=r+x;  
  
//similar functions for g value and b value, with different change rates
  if(g >= 255) {
    y=-3;
  }else if(g <= 0) {
    y=9;
}
  g=g+y;  
  
  if(b >= 255) {
    z=-10;
  }else if(b <= 0) {
    z=10;
}
  b=b+z;
  
noStroke();

//Set the fill colour to the values of the integers
  fill(r, g, b);
  
//draw a circle in that colour
      ellipse(150, 300, 200, 200);
      
//draw a red rectangle whose height reflects the r value
      fill(255, 0, 0);
       rect(300, 400, 50, -r/1.28);
       
//draw a green rectangle whose height reflects the g value
      fill(0, 255, 0);
       rect(360, 400, 50, -g/1.28);
       
//draw a blue rectangle whose height reflects the b value
      fill(0, 0, 255);
       rect(420, 400, 50, -b/1.28);

     }

