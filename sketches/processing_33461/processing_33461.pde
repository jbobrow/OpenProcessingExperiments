
int distance=25;
int x=0;
int y=0;

float leftEyePos;
float rightEyePos;
float lidPos;


void setup() {
  size(600,400);
  background(0);
}

void draw() {
//  fill(0);
//  rect(98,98,400,300);
  if(key=='a'){
    fill(255,0,0);
     rect(205,265,160,40);
   }
   
   if(key=='b'){
     stroke(255);
     strokeWeight(3);
     noFill();
     ellipse(275,200,330,300);
   }
//  fill(0,255,0);
//    for (int i=0; i<24; i++){
//      for(int j=0; j<24; j++){
//        rect(x+i*distance, y+j*distance, 20, 20);
//    }   
//  }
    
  fill(50,100,0);
    noStroke();
    ellipse(220,190,40,70);
    ellipse(340,190,40,70);
    rightEyePos=map(mouseX, 0, width, 375, 300);
    leftEyePos=map(mouseX, 0, width, 262, 180);
   
    fill(0,0,0);
    ellipse(rightEyePos,200,20,20);
    ellipse(leftEyePos,200, 20,20);
    lidPos = map(mouseY,0,height,0,200);
    rect(0,0,width,lidPos);
  
    if(mousePressed) {
       rect(0,0,400,250);
    }
    
    
}


