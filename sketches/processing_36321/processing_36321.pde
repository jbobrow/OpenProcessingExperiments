
void setup(){
  size(300,300); 
}

void draw(){
  //the back wall
  if(mouseY>65) {//if the guys arm presses lightswitch down
    fill(0);
    rect(width/2,0,width,112.5);
  }
  else {
    fill(255);
    rect(width/2,0,width,112.5);
  }
  
  //light switch
  rect(190,60,5,10);
  
  //side wall
  quad(0,0,width/2,0,width/2,112.5,0,height);
  
  //the floor
  quad(width/2,112.5,width,112.5,width,height,0,height);
  
  //window and sun/moon & stars
  if(mouseY>65) {//if the guys arm presses lightswitch down
    fill(#0AE1F7);
    quad(125,37.5,125,75,50,height/2,50,20);
    fill(255,255,0);
    ellipse(100,60,20,20);
  }
  else {
    fill(0);
    quad(125,37.5,125,75,50,height/2,50,20);
    fill(255);
    ellipse(100,60,20,20);
    stroke(255);
    strokeWeight(2);
    point(60,64);
    point(63,85);
    point(70,50);
    point(90,90);
  }
  
  
  //the door in the back wall
    stroke(0);
    strokeWeight(1);
    fill(255,255,0);
    rect(200,37.5,50,75);
  
 
  
  //the man in the door
  fill(0);
  ellipse(225,50,20,20);
  line(225,50,225,90);
  line(225,90,215,112.5);
  line(225,90,235,112.5);
  line(225,65,235,70);
  line(225,65,192,mouseY);
  
  
}

