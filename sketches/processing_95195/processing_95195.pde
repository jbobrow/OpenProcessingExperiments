
void setup(){
  background (255, 255, 255); //background color
  size(520, 700); //size
  noStroke(); //nostroke
}

void draw(){
  school (10, 10); //school 
}  
  
  color pick(){
    return color(random(255), random(0), random (0)); //color pick
}    

 void CHS(int x, int y, color c){ 
  fill(c); //color
  rect(10, 10, 50, 200); //left bar on C
  rect(10, 10, 150, 50); //top bar on C
  rect(10, 160, 150, 50); //bottom bar on C
  fill(c); //color
  rect(180, 240, 50, 200); //left bar of H
  rect(180, 320, 150, 50); //middle bar of H
  rect(280, 240, 50, 200); //right bar of H
  fill(c); //color
  rect(360, 470, 150, 50); // top of S);
  rect(360, 520, 50, 30); //top left of S
  rect(360, 550, 150, 50); //middle of S
  rect(360, 620, 150, 50); //bottom bar of S
  rect(460, 600, 50, 30); //bottom right of S
}

  void school (int x, int y){ //void school
  background(255, 255, 255); //background color
  CHS(10, 10, pick()); //chs
}

