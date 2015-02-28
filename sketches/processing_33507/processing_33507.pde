

//int distance=25;
int x=0;
int y=0;
 
float leftEyePos;
float rightEyePos;
float lidPos;
 

void setup() {

  size(500, 500);
  background(0);
  frameRate(100);
}


void draw() { 
 smooth();

  if(key=='n'){          //drawing the nose
    
    beginShape();
    strokeWeight(3);
    stroke(255,255,0);
    curveVertex(300, 250); 
    curveVertex(300,250); 
    curveVertex(250, 250); 
    curveVertex(250, 200); 
    curveVertex(250, 200);
    
    endShape();

     //rect(180,250,150,30);
   }
    
   if(key=='h'){           //drawing the head
     stroke(255,255,0);
     strokeWeight(5);
     noFill();
     ellipse(250,200,300,300);
   }

  fill(255,255,0);
    noStroke();
    ellipse(200,170,50,80);//right eye
    ellipse(300,170,50,80);//left eye
    rightEyePos=map(mouseX, 0, width, 360, 300);
    leftEyePos=map(mouseX, 0, width, 260, 180);
    
    fill(0);
    ellipse(rightEyePos,200,25,25);
    ellipse(leftEyePos,200, 25,25);
    lidPos = map(mouseY,0,height,0,370);  //the whole figuer gets covered in black
    rect(0,0,width,lidPos);
   
    }
     
     


 
 
 
 
