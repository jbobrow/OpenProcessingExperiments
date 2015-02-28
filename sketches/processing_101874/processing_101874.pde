
int counter;
int INTERVAL= 50;
int colors[] = {#000000, #FF0000, #00FF00,#0000FF,#FFFFFF, #FF00FF, #00FFFF, #FFFF00};
int NUM_SIN_LINES = 3;
SinLine []lines;

void setup() {  //setup function called initially, only once
  size(512, 512);
  background(#01CAFE);
  strokeWeight(2); 
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  
  counter = 0;
  lines = new SinLine[NUM_SIN_LINES];
  for(int i=0; i<lines.length; i++){
    lines[i] = new SinLine();
  }
}

void draw() {  //draw function loops 
   background(#01CAFE);

  if(counter > INTERVAL){
      counter = 0;
      for(int i=0; i<lines.length; i++){
          lines[i].randomizeLine();
      }
  }
  counter++;

  for(int i=0; i<lines.length; i++){
      lines[i].draw();
  }
}

class SinLine{
    private int lineX0, lineY0, lineXf, lineYf;
    private int lineColor;
    private float speed;

    SinLine(){
        randomizeLine();
    }

    void draw(){
        pushMatrix();
        translate(lineX0, lineY0);
        stroke(lineColor);
        rotate(getSlope());
        for(float x = 0; x<getLength() ; x = x+0.5){
            //y = f(x) = Amplitude * sin(x + offset)
            float ampS = map(x, 0, getLength(), 0, PI); //x*(2/getLength())
            float amplitude = sin(ampS)*getLength()/10;
            float offset = (speed*frameCount);
            //point(x, sin(x)*amplitude *sin(x/10+offset));
            point(x, amplitude *sin(x/10+offset));
        }
        popMatrix();
    } 
    
//    void alternativeSinLine(){
//        pushMatrix();
//            translate(lineX0, lineY0);
//            rotate(getSlope());
//            for(float x = 0; x<getLength() ; x = x+0.5){
//                //y = f(x) = Amplitude * sin(x + offset)
//                float amplitude = sin(x*getLength());
//                float offset = (speed*frameCount)/10;
//                point(x, amplitude *sin(x/10+offset));
//            }
//        popMatrix();
//    } 
    
    void randomizeLine(){
      lineColor = colors[int(random(0, colors.length))];
      lineX0 = int(random(0, width));
      lineY0 = int(random(0, height)); 
      lineXf = int(random(0, width));
      lineYf = int(random(0, height));
      speed = random(10, 15);
    }
    
    float getSlope(){ //in radians
        return atan2((lineYf -lineY0),(lineXf -lineX0));
    }
      
    float getLength(){
        return dist(lineX0, lineY0, lineXf, lineYf);
    }
}
