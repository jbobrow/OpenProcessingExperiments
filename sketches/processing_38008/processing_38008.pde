
void setup(){
 size(400,400);
 //fill(255,255,255);
 smooth();
 noStroke(); 
}

void draw(){
  background(0,0,0);
  //fill(0,0,0);
  int height=20;
  int width=20;
  float xPos;
  float yPos;
  for (int row =0;row<= 1024;row=row+height){   
    for(int col=0;col<= 768;col=col+width){
     fill(random(255) , random(255),random(255));
     xPos = row + random(mouseX);
     yPos = col + random(mouseX);
     rect(xPos,yPos,width,height);
     
     
    }
  }
}

