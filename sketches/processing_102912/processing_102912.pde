
int counter;
int INTERVAL= 50;
int colors[] = {#000000, #FF0000, #00FF00,#0000FF,#FFFFFF, #FF00FF, #00FFFF, #FFFF00};
int NUM_SIN_LINES = 3;
SquareLine []lines;
 
void setup() {  //setup function called initially, only once
  size(512, 512);
  background(#07B0C0);
  strokeWeight(2);
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
   
  counter = 0;
  lines = new SquareLine[NUM_SIN_LINES];
  for(int i=0; i<lines.length; i++){
    lines[i] = new SquareLine();
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
 
class SquareLine{
    private int lineX0, lineY0, lineXf, lineYf;
    private int lineColor;
    private float speed;
 
    SquareLine(){
        randomizeLine();
    }
 
    void draw(){
        pushMatrix();
        translate(lineX0, lineY0);
        stroke(lineColor);
        rotate(getSlope());
        
        int numCycles = 3;
        int cycleLength = int(getLength()/numCycles);

        int stepLength = cycleLength/3; //3 steps in a cycle
        int amplitude = 10;
        
        //http://en.wikipedia.org/wiki/Square_wave
        for(float step = 0; step<numCycles ; step++){ //TODO: pshape?
            //forward
            line(0,0,stepLength,0);
            translate(stepLength ,0);
            //(up half amplitude
            line(0,0,0,amplitude/2);
            translate(0, amplitude/2);
            //forward
            line(0,0,stepLength,0);
            translate(stepLength ,0);
            //down amplitude
            line(0,0,0,-amplitude);
            translate(0, -amplitude);
            //forward
            line(0,0,stepLength,0);
            translate(stepLength ,0);
            //(up half amplitude
            line(0,0,0,amplitude/2);
            translate(0, amplitude/2);
        }
        popMatrix();
    }
     
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
