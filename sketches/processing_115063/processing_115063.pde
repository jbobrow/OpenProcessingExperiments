
int circleX = 250;//for previous par of task
int circleY = 250;//for previous part of task
int circleDiameter = 0;
int H;
float s = 20;
float B = 100;

void setup() { 
  size(700, 700); 
  colorMode(HSB, 1080, 100, 100, 100);
  smooth();
}   

void draw() {
  // a circle which follows the mouse, and which increases in size depending on how fast the mouse is moved

  background(171, 5, 100);           
  noStroke();          
  fill(H, s, B);

  if (circleDiameter<= 1080) {
    H = circleDiameter;
  }
 


  circleDiameter=circleDiameter+((abs(mouseX-pmouseX)/4));
  ellipseMode(CENTER);  
  ellipse(mouseX, mouseY, circleDiameter, circleDiameter); 
  if (B<=0) {
    circleDiameter = 0;
    H=circleDiameter
    s=20;
    B=B+100;
  }

  if ((mousePressed == true) && (circleDiameter<1080)&&(circleDiameter>0)) {
    println("not big enough yet");
    println(circleDiameter);
    circleDiameter = circleDiameter - 0.5;
  }
  if ((mousePressed==true) && (circleDiameter>=1080)) {
    println("restarted");
    circleDiameter= 1;
    s = 20;
    B = 100;
  }
  else {
    circleDiameter=circleDiameter+((abs(mouseX-pmouseX)/4));
  };
  if (circleDiameter>1080) {
    s = s+0.5;
    B = B-0.5;
    println(circleDiameter);
  }
}

  
       
