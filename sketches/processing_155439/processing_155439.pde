
int counter;
float easing = 0.05;
int angle=0;
void setup() {  //setup function called initially, only once
  size(500, 500);
  frameRate(60);

  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(0);
  background(255);
  
    ellipse(mouseX, mouseY, 20, 20);
  
        
        angle++;
        
        if(angle>=360){
        angle=0;
        }
        
        float x=(cos(radians(angle))*30)+mouseX;
        float y=(sin(radians(angle))*30)+mouseY;
        ellipse(x,y, 20, 20);
        
        float x2=(cos(radians(angle+180))*30)+mouseX;
        float y2=(sin(radians(angle+180))*30)+mouseY;
        ellipse(x2,y2, 20, 20);
  
}
