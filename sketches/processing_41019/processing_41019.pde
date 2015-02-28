
// Author: Anita Chen 
// explaining the frame loop in processing
//references :http://moodle.ncku.edu.tw/mod/resource/view.php?id=104672
int diam = 10;  
float centX, centY; 

void setup() {    
  size(500, 300); 
  frameRate(12);  // 12 frames per second                                     
  smooth(); 
  background(84, 123, 80); 
  centX = width/2; 
  centY = height/2;
} 

void draw() {   
  stroke(0); 
  strokeWeight(5); 
  fill(255, 243, 120,50); 
  ellipse(centX, centY, diam, diam); 

  strokeWeight(0);
  noFill();
  if (diam <= 400) { 
    //background(180);  // clears background every frame                                   
    ellipse(centX, centY, diam, diam);  
    diam += 20;  // increases diameter for next loop
  }else{
    stroke(226, 184, 74);
    strokeWeight(2);   
    diam -= 10;
  }
  // loop within loop
  stroke(65,95,65);     
  noFill();
  int tempdiam = diam; 
  while (tempdiam > 30) {                               
    ellipse(centX, centY, tempdiam, tempdiam); 
    tempdiam -= 30;
  }
}
  void keyPressed(){
  saveFrame("TheFrameLoopDemo-####.jpg");
  }





