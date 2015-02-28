
int button;
int button2;
int x;
int dir;

void setup(){
  size(800,800);
  noFill();
  smooth();
  stroke(.1);
  
  
  }
  
void draw(){
     noFill();
     fill(153);
  for(int i=0;i<width;i++){
    stroke(i/2);
    line(i,0,i,height);
  }
  if (button == 0){
    background(255);
  }
  if (button == 1){
    background(234,31,234);
  }
  
  stroke(0);
  for(int i=50; i < 200; i++){
    ellipse(width/2,height/2,i*6,i*6);
    
    rect(0,100,800,50);

    
    //button2 fill
        if (button2 == 1){
       fill(150,222,217);
       rect(0,100,800,50);
       textSize(40);
    text("bang! bang!",width/2,100);
     }
     if (button2 == 0){
       noFill();
     }
     noFill();
  }
 
}
//button 1
  void mouseReleased(){
    if (mouseX > 250 && mouseY > 250 && mouseX < 550 && mouseY < 550) 
     if (button == 0) {
      button = 1;
      textSize(40);
    text("boom",width/2,height/2);}
      else {
      button = 0;
    }
      if (mouseY > 100 && mouseY < 150) {
        
     if (button2 == 0) {
      button2 = 1;}
      else {
      button2 = 0;
     }
    }
  }
