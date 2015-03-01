
float Xposition;
float Yposition;
void setup(){
 background(217,24,24);
 size(600,400);
 fill(176,176,176);
 rect(40,50,520,275);
 fill(255,255,255);
 ellipse(85,362,65,65);
 ellipse(515,362,65,65);
 Xposition=300;
 Yposition=200;
  
}

void draw(){
  /*
  if(mouseX>43&&mouseX<557&&mouseY>50&&mouseY<325){
  if(mousePressed){
  noStroke();
  fill(20,20,20);
  ellipse(mouseX, mouseY,5,5);
  }
  }
  */
  
  fill(179,181,180,1);
 rect(40,50,520,275);

 fill(25,25,25);
ellipse(Xposition, Yposition, 5,5); 
}
 void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      Yposition=Yposition-1;
    } else if (keyCode == DOWN) {
      Yposition=Yposition+1;
    } 
    else if (keyCode == RIGHT) {
      Xposition=Xposition+1;
    } 
    else if (keyCode == LEFT) {
      Xposition=Xposition-1;
    } 
    if(Yposition>322) Yposition=322;
    if(Yposition<53) Yposition=53;
    if(Xposition<43) Xposition=43;
    if(Xposition>557) Xposition=557;
  }  
  
}

void mousePressed(){ 
{stroke( random(255), random(255), random(255));
} 
}
