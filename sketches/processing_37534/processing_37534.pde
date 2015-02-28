
int counter;
int headX =0;
int headY =0;
void setup() {  //setup function called initially, only once
  size(300, 300);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  strokeWeight(3); 
  headX = floor((0.75)*width);
  headY = floor((0.5)*height);
}

void draw() {  //draw function loops
   
    int offset = 20; 
    int bodyLength = 100; 
    counter++;
   if (mousePressed) {
       headX = mouseX;
      headY = mouseY; 
    }
    background(255);  //set background white

    draw_object(bodyLength, offset,headX, headY);
 }

void draw_object(int bodyLength, int offset, int headX, int headY ) {
  
  fill(random(255),100,255,50);
  ellipse(headX-bodyLength/2, headY, bodyLength,offset*2);
  triangle(headX-bodyLength,headY-offset, 
           headX-bodyLength,headY+offset,
           headX-bodyLength-offset,headY); 
  
  point (headX-10, headY-5); 
  
  line (headX, headY, headX +60, headY);  
  line (headX, headY+8, headX + 60, headY + 20); 
  line (headX, headY-8, headX +60, headY - 20);  

}     
                
