
float xPos;
float yPos;

void setup(){
 size (500,500);
 xPos =  width/2;
 yPos = height/2;
}
 
 void draw (){
  // background (127);
  smooth ();
  
  float col = random(0, 50);
  float rred = random(0, 255);
  float rgreen = random(0, 255);
  float rblue = random(0, 255);
  float opac= random (50, 255);
  
  float centerX = 150;
  float amplitude = mouseX;
  float period = 0.003;
  
    xPos= centerX + amplitude*sin(millis()*period) ;
    yPos = centerX + amplitude* cos(millis()*period);
    
    fill (rred, rgreen, rblue, opac);
    ellipse (xPos, yPos, 20, 20);
    
   
 }
                
                
