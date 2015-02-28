
float bc; 
float increment = 0.01;
// The noise function's 3rd argument, a global variable that increments once per cycle
float zoff = 0.0;  
// We will increment zoff differently than xoff and yoff
float zincrement = 0.02; 
float rotationY ;
float rotationX;
float clr=1;
float fov = PI/4;
void setup() {
  size(700,700,P3D);
  background(0);
}

void draw() {
  background(bc);
  rotateY(rotationY);
  rotateX(rotationX);
  float cameraZ = (height/2.0) / tan(fov/2.0);
  perspective(fov, float(width)/float(height), 
              cameraZ/10.0, cameraZ*10.0);

  // Optional: adjust noise detail here
  //noiseDetail(8,0.65f);
  
  

  float xoff = 0.0; // Start xoff at 0
  
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = width/5; x < 4*width/5; x+=2) {
    xoff += increment;   // Increment xoff 
    float yoff = 0.0;   // For every xoff, start yoff at 0

      for (int y = height/5; y < 4*height/5; y+=2) {
        yoff += increment; // Increment yoff
        
        // Calculate noise and scale by 255
        float bright = noise(xoff,yoff,zoff)*255-.8*dist(mouseX,mouseY,x,y);
  
        // Try using this line instead
        //float bright = random(0,255);
        
        // Set each pixel onscreen to a grayscale value
      if(clr==1){
        stroke(y,x,bright);
      }
      if(clr==2){
        stroke(x,bright,y);
      }      
      if(clr==3){
        stroke(bright,x,y);
      }
      if(clr==4){
        stroke(bright);
      }
       if(clr==5){
        stroke(255);
      }
      if(clr==6){
        stroke(0);
      }
        point(x,y,bright);
      }
  }
  
  
  zoff += zincrement; // Increment zoff

  
}

void mouseDragged(){
  rotationY+= map(mouseX-pmouseX,0,100,0,2);
  rotationX+= map(mouseY-pmouseY,0,100,0,2);
}

void keyReleased(){
  if (key == ' '){
    if(bc==0){
      bc =255;
    }
    else{
      bc=0;
    }
  }
  if(key=='1'){
    clr=1;
  }if(key=='2'){
    clr=2;
  }if(key=='3'){
    clr=3;
  }if(key=='4'){
    clr=4;
  }if(key=='5'){
    clr=5;
  }if(key=='6'){
    clr=6;
  }
}
void keyPressed(){
  if(key=='a'){
    fov = mouseX/float(width) * PI/2;
  }
}


