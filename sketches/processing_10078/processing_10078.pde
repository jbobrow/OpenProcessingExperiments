
float bc; 
float increment = 0.01;
// The noise function's 3rd argument, a global variable that increments once per cycle
float zoff = 0.0;  
// We will increment zoff differently than xoff and yoff
float zincrement = 0.02; 
float rotationY ;
float rotationX;
float fov = PI/4;
void setup() {
  size(700,700,P3D);
  background(0);
}

void draw() {
  background(bc);
  rotateY(rotationY);
  rotateX(rotationX-radians(2));
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
        float bright = noise(xoff,yoff,zoff)*255;
  
        // Try using this line instead
        //float bright = random(0,255);
        
        // Set each pixel onscreen to a grayscale value
        stroke(0,0,255,125);
        rotateY(radians(-1));
        point(x,y,bright);
        stroke(255,0,0,125);
        rotateY(radians(2));
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
  
}
void keyPressed(){
  if(key=='a'){
    fov = mouseX/float(width) * PI/2;
  }
}


