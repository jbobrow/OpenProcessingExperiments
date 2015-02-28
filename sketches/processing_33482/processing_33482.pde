
//Nicole Del Senno
//N00211488

//declare variables
float rightEyePos;
float leftEyePos;
float rightEyePos2;
float leftEyePos2;
float lidPos;

//setup
void setup(){
  size(500,500);
  background(0);
}

void draw(){
    fill(255);
    noStroke();
    ellipse(200,250,50,100);
    ellipse(300,250,50,100);
    
    //assign variables for inner circles
    leftEyePos= map(mouseY,0,height,200,300);
    rightEyePos= map(mouseY,0,height,200,300);
    leftEyePos2=map(mouseX,0,width,175,225);
    rightEyePos2=map(mouseX,0,width,275,325);
    
    fill(0);
    ellipse(leftEyePos2,leftEyePos,20,20);
    ellipse(rightEyePos2,rightEyePos,20,20);
    
    //assign variable for eyelid
    lidPos=map(mouseY,0,height,0,500);
    rect(0,0,250,lidPos);
    rect(0,0,width,lidPos);
    
    //control right and left mouse click
    if(mousePressed && mouseButton==RIGHT){
     rect(250,0,width,height);
    } else if(mousePressed && mouseButton==LEFT){
      rect(0,0,250,height);
    }
 }
  
      


