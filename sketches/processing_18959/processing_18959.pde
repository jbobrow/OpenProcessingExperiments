
void setup(){
  size(400,400);
  smooth();
  frameRate(30);
}
int x=0;
void draw(){
  noStroke();
  fill(10);
  ellipse(50,height/2,100,100);
  rect(50,150,150,50);
  x++;
  if (x>100){
    noStroke();
  fill(x+50,20,8);
  ellipse(50,height/2,100,100);
  rect(50,150,150,50);
  x++;
  }
  
  if (x>150){
     stroke(247,240,48);
    fill(10);
    ellipse(x+50,175,50,50);
    noStroke();
    fill(10);
    ellipse(50,height/2,100,100);
    rect(50,150,150,50);
    x++;
  }
  if (x>200){
    background(246,246,236);
     stroke(247,240,48);
   
    ellipse(-200+x,175,50,50);
    noStroke();
    fill(123,133,199);
    rect(25,125,175,275);
   
  }
    if (x >220){
     background(247,118,32);
     fill(x,10,x);
      rect(25,125,175,275);
     
    }
if (x >300){    
      noLoop();
   }
}



