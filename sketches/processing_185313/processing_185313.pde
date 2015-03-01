
void setup(){
  size(100,600);
  smooth();
  noCursor();
  background(255);
  for(int a=25;a<600;a+=25){
    strokeWeight(5);
    line(0,a,20,a);
  }
}

void draw(){
//temp rises 
  if((mouseY-pmouseY)<0){
    noStroke();
    fill(mouseY+255,0,0);
    rect(0,mouseY,100,600-mouseY);
    fill(255);
    triangle(mouseX,mouseY,mouseX+20,mouseY,mouseX+10,mouseY-10);
    for(int a=25;a<600;a+=25){
      stroke(0);
      strokeWeight(5);
      line(0,a,20,a);
    }
  }
//temp drops  
  else if((mouseY-pmouseY)>0){
    noStroke();
    fill(0,0,mouseY);
    rect(0,0,100,mouseY);
    fill(255);
    triangle(mouseX,mouseY,mouseX+20,mouseY,mouseX+10,mouseY+10);
    for(int a=25;a<600;a+=25){
      stroke(0);
      strokeWeight(5);
      line(0,a,20,a);
    }
  }
}
