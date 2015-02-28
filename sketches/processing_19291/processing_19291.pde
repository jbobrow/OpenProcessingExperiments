
PImage face;
PImage black;

float NudgeX = 0;
float NudgeY = 0;
float faceNudgeX = 0;
float faceNudgeY = 0;



//Setup
void setup() {
    size (640, 480);
    noStroke();
    smooth();
    face= loadImage ("face2.png");
    black =loadImage ("face_black.png");
}
//Draw
void draw() {
  background (253, 220, 220);
  float easing = 0.1;
 
// Left Eye
    float eyeLx =  map (mouseX, 0, width/2, 120, 130);
    float eyeLy = map (mouseY, 0, width/2, 140, 160);
    float d = dist(mouseX, mouseY, 217, 217);
      eyeLx += (mouseX - eyeLx) * easing;
      eyeLy += (mouseY - eyeLy) * easing;
      
if (keyPressed == true)
    {
      NudgeX = random (10, 10);
      NudgeY= random (2, 10);
    background (224, 4, 4);
    fill (0);
    ellipse (eyeLx+NudgeX, eyeLy+NudgeY, 150, 150);  
    fill (187, 37, 37);
    ellipse (eyeLx+NudgeX, eyeLy+NudgeY, 105, 105);
    fill (238, 28, 28);
    ellipse (eyeLx+NudgeX, eyeLy+NudgeY,  90, 90);
   
    }else if (d > 217) {
      fill (187, 37, 37);
    fill (255, 229, 233);
    ellipse (eyeLx, eyeLy, 100, 100);  
    fill (255, 151, 168);
    ellipse (eyeLx, eyeLy, 90, 90);
    fill (248, 77, 105);
    ellipse (eyeLx, eyeLy,  70, 70);
    fill (237, 54, 84);
    ellipse (eyeLx, eyeLy, 60, 60);
      
 
    }
    else
    {  
    fill (255, 229, 233);
    ellipse (eyeLx, eyeLy, 120, 120);  
    fill (255, 151, 168);
    ellipse (eyeLx, eyeLy, 105, 105);
    fill (248, 77, 105);
    ellipse (eyeLx, eyeLy,  90, 90);
    fill (237, 54, 84);
    ellipse (eyeLx, eyeLy, 75, 75);
   
   
    }
    
//Left Pupil
    float pupilLx = map (mouseX, 0, width/2, 125, 140);
    float pupilLy = map (mouseY, 0, width/2, 145, 170);
    float SmallpupilLx = map (mouseX, 0, width/2, 140, 150);
    float SmallpupilLy = map (mouseY, 0, width/2, 155, 180);
    
if (keyPressed == true)
    {
      fill (0);
      ellipse (pupilLx, pupilLy, 20, 30);
    }
    else
    {
    fill (255);
    ellipse (pupilLx, pupilLy, 20, 20);
    fill (255, 217, 224);
    ellipse (SmallpupilLx, SmallpupilLy, 10, 10);
    }
    
    
    
// Right Eye
    float eyeRx = map (mouseX, 0, width/2, 460, 475);
    float eyeRy = map (mouseY, 0, width/2, 140, 170 );

      eyeRx += (mouseX - eyeLx) * easing;
      eyeRy += (mouseY - eyeLy) * easing;
    
if (keyPressed == true)
    {
     fill (0);
    ellipse (eyeRx+NudgeX, eyeRy+NudgeY, 150, 150);  
    fill (187, 37, 37);
    ellipse (eyeRx+NudgeX, eyeRy+NudgeY, 105, 105);
    fill (238, 28, 28);
    ellipse (eyeRx+NudgeX, eyeRy+NudgeY,  90, 90);
    
    }else if (d > 217) {
      fill (187, 37, 37);
    fill (255, 229, 233);
    ellipse (eyeRx, eyeRy, 100, 100);  
    fill (255, 151, 168);
    ellipse (eyeRx, eyeRy, 90, 90);
    fill (248, 77, 105);
    ellipse (eyeRx, eyeRy,  70, 70);
    fill (237, 54, 84);
    ellipse (eyeRx, eyeRy, 60, 60);
      
 
    }
    
    else
    {  
    
    fill (255, 229, 233);
    ellipse (eyeRx, eyeRy, 120, 120); 
    fill (255, 151, 168);
    ellipse(eyeRx, eyeRy,  105, 105);
    fill (248, 77, 105);
    ellipse (eyeRx, eyeRy,  90, 90);
    fill (237, 54, 84);
    ellipse (eyeRx, eyeRy, 75, 75);
    }

//Right Pupil
    float pupilRx = map (mouseX, 0, width/2, 465, 485);
    float pupilRy = map (mouseY, 0, width/2, 145, 180);
    float SmallpupilRx = map (mouseX, 0, width/2, 475, 495);
    float SmallpupilRy = map (mouseY, 0, width/2, 155, 190);
  
if (keyPressed == true)
    {
      fill (0);
      ellipse (pupilRx, pupilRy, 20, 30);
       
    }
    else
    {
    fill (255);
    ellipse (pupilRx, pupilRy, 20, 20);
    fill (255, 217, 224);
    ellipse (SmallpupilRx, SmallpupilRy, 10, 10);
 
    }

// Blink

if (mousePressed) {
   fill (24, 24, 24);
   quad (434, 212, 577, 104, 539, 59, 402, 181);
   quad (214, 213, 73, 107, 88, 57, 248, 148);
   
}
    
    
if (keyPressed) {
    faceNudgeX = random (5, 5);
    faceNudgeY= random (2, 10);
     image (black, -5+faceNudgeX, -10+faceNudgeY);
    }else{
    image(face, 0, 0);
    


}
}


