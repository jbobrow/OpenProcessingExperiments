
//Author:yi-ting sie
//Purpose:the loop in the processing
//Explian how it works:the start is blue baceground and slowing open ellipse, after both things are change color and weight.
//References:NCKU Moodle-Design proframming design, http://moodle.ncku.edu.tw/course/view.php?id=43022.tech 1: programming basics.

int xxx = 10; 
float X, Y;

void setup() {    
  size(550, 550); 
  frameRate(5); //秒數
  smooth(); 
  X = width/2;
  Y = height/2;
} 


void draw() { 
  if (xxx <= 150) { 
    background(23, 42, 132);//藍色
    stroke(0);
    strokeWeight(2); 
    fill(248, 182, 45); //黃色 
    ellipse(X/2, Y, xxx, xxx*0.5); //外部橢圓形
    ellipse(X*3/2, Y, xxx, xxx*0.5); //外部橢圓形

    stroke(201, 188, 156);
      strokeWeight(1);     
    noFill(); 
    int eye = xxx; 
    while (eye > 50) {   //50之後才出現                            
      ellipse(X/2, Y, eye*0.45, eye*0.45); //內部圓形
      ellipse(X*3/2, Y, eye*0.45, eye*0.45); //內部圓形 
      eye -= 10;
    }
  } 
  else if ( xxx <= 250) {
    background(235, 0, 25); //紅色
    strokeWeight(6); 
    fill(255);//白色
    ellipse(X/2, Y, xxx, xxx*0.5); //外部橢圓形
    ellipse(X*3/2, Y, xxx, xxx*0.5); //外部橢圓形

    stroke(0);
    strokeWeight(1);     
    noFill(); 
    int eye = xxx; 
    while (eye > 50) {   //50之後才出現                            
      ellipse(X/2, Y, eye*0.45, eye*0.45); //內部圓形
      ellipse(X*3/2, Y, eye*0.45, eye*0.45); //內部圓形
      eye -= 5;
    }
  }
  xxx += 5;
} 

void keyPressed(){
  saveFrame("loop-####.jpg");
}


