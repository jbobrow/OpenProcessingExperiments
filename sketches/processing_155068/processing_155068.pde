
// 1     : Red
// 2     : Orange
// 3     : Yellow
// 4     : Green
// 5     : Blue
// 6     : Purple
// 7     : Black
// 8     : Dark Gray
// 9     : Light Gray
// 0     : White
// Space : Clear Screen


void setup(){
  size(500,500);
  background(255,255,255);
  frameRate(60);
}
void draw(){
  if(key=='1'){
   if(mousePressed){
     fill(255,0,0);
     noStroke();
     ellipse(mouseX,mouseY,15,15);
   }
  }
  if(key==' '){
    background(255);
  }
  if(key=='2'){
    if(mousePressed){
    fill(255,128,0);
    noStroke();
    ellipse(mouseX,mouseY,15,15);
    }
  }
  if(key=='3'){
    if(mousePressed){
      fill(255,247,0);
      noStroke();
      ellipse(mouseX,mouseY,15,15);
    }
  }
  if(key=='4'){
    if(mousePressed){
      fill(0,255,0);
      noStroke();
      ellipse(mouseX,mouseY,15,15);
    }
  }
  if(key=='0'){
    if(mousePressed){
  fill(255,255,255);
  noStroke();
  ellipse(mouseX,mouseY,15,15);
    }
  }
    if(key=='5'){
    if(mousePressed){
      fill(0,0,255);
      noStroke();
      ellipse(mouseX,mouseY,15,15);
    }
  }
      if(key=='6'){
    if(mousePressed){
      fill(255,0,255);
      noStroke();
      ellipse(mouseX,mouseY,15,15);
    }
  }
      if(key=='7'){
    if(mousePressed){
      fill(0,0,0);
      noStroke();
      ellipse(mouseX,mouseY,15,15);
    }
  }
      if(key=='8'){
    if(mousePressed){
      fill(92,92,92);
      noStroke();
      ellipse(mouseX,mouseY,15,15);
    }
  }
      if(key=='9'){
    if(mousePressed){
      fill(163,163,163);
      noStroke();
      ellipse(mouseX,mouseY,15,15);
    }
  }
}
