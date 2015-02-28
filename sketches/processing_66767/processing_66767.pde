
void setup(){
  size(400, 400);
  noFill();
  noStroke();
  rectMode(CENTER);
  background(255);
}
//background feature with low alpha for trailing shapes
void draw(){
//  background(121, 17, 17);
}
void keyPressed(){
  if (mousePressed == true) {
    if(keyCode==UP){
      for(int y=0; y<400; y++){
        fill(0);
        rect(mouseX, mouseY-y, 10, 10);
      }
    }
    if(keyCode==DOWN){
      for(int y=0; y<400; y++){
       fill(0);
       rect(mouseX, mouseY+y, 10, 10); 
      }
    }
    if(keyCode==LEFT){
      for(int x=0; x<400; x++){
        fill(0);
        rect(mouseX-x, mouseY, 10, 10);
      }    
    }
    if(keyCode==RIGHT){
      for(int x=0; x<400; x++){
        fill(0);
        rect(mouseX+x, mouseY, 10, 10);
      }    
    }

    if(key=='r' || key=='R'){
        fill(255,0,0);
        rect(mouseX, mouseY, random(20,100), random(20,100));
    }
    if(key=='b' || key == 'B'){
      fill(0, 0, 255);
      rect(mouseX, mouseY, random(20,100), random(20,100));
    }
    if(key=='y' || key=='Y'){
      fill(255, 255, 0);
      rect(mouseX, mouseY, random(10,100), random(10,100));
    }
  }
}

