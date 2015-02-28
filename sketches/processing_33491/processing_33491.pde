
float leftEyePosx;
float rightEyePosx;
float leftEyePosy;
float rightEyePosy;
float lidPosx;
float lidPosy;
int counter=0;
PImage bg;

void setup() {
  size (898, 297);
  bg = loadImage("eyes.png");
}
  
 void draw() {
    fill(255);
    noStroke();
    background(bg);
    ellipse(300, 150, 90, 50);
    ellipse(600, 150, 90, 50);

    leftEyePosx = map(mouseX, 0, width, 270, 330);
    leftEyePosy = map(mouseY, 0, height, 140, 153);
   
    rightEyePosx = map(mouseX, 0, width, 575, 630);
    rightEyePosy = map(mouseY, 0, height, 140, 153);
    
    //pupil
    fill(0, 170, 0);
    stroke(3);
    ellipse(leftEyePosx,leftEyePosy , 30, 30);
    ellipse(rightEyePosx, rightEyePosy, 30, 30);
 
    
       //conditional
      if ( counter==0){
       
      leftEyePosx = map(mouseX, 0, width, 270, 330);
      leftEyePosy = map(mouseY, 0, height, 140, 153);
      rightEyePosx = map(mouseX, 0, width, 575, 630);
      rightEyePosy = map(mouseY, 0, height, 140, 153);
       } else if(counter <=360) {
       ellipse(300+10*cos(radians(counter)), 150+10*sin(radians(counter)), 30, 30);
       ellipse(600+10*cos(radians(counter)), 150 +10*sin(radians(counter)), 30, 30);
       //ellipse(width/2+, height/2+ , 10, 10);
       counter+=2;
       }else{
       
         counter=0;
       }
      if(mousePressed && (counter ==0)){
         counter=1;
      }
 }
       //conditional2   
 void keyPressed() {
   frameRate(2);
   if (key=='a') {
      //pupil
    fill(0, 80, 200);
    noStroke();
    ellipse(leftEyePosx,leftEyePosy , 30, 30);
    ellipse(rightEyePosx, rightEyePosy, 30, 30);
       }
       
  }

       
  
 
      
 
    

