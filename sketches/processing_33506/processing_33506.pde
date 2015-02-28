
float lefteyePos;
float righteyePos;
float lidPos;

void setup(){
size(600,900);
background(255);
smooth();
noStroke();
}

void draw(){

//eyes
noFill();
stroke(255,0,0);
strokeWeight(3);
    lefteyePos = map(mouseX,20,375,150,325);
    righteyePos = map(mouseX,20,375,75,225);
    background(255);
    fill(246,164,210);
    rect(lefteyePos,250,30,30);
    rect(righteyePos,250,30,30);

//eyelids    
noStroke();  
  fill(255); 
  lidPos = map(mouseY,0,height,0,350);
  rect(0,0,width,lidPos);

//mouth
fill(200,20,100);
arc(300,320, 100, 100, 0, PI);


 

}

