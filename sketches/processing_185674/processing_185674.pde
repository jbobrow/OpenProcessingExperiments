
//declare variable 
float r,g,b,rd ;

void setup(){// executed only once
  size(640,480);
  frameRate(30);
}

void draw(){ //repeated forever
  background(255);
  strokeWeight(0.2);
  stroke(0);
  line(width/3,0, width/3, height);
  line(width/3*2,0, width/3*2, height);
  noStroke();
  if(mouseX < width/3){
   fill(255,0,0);
  rect(0,0,width/3,height);
  }else if(mouseX < width/3*2){
    fill(255,255,0);
    rect(width/3,0,width/3,height);
  }else{
     fill(0,255,0);
    rect(width/3 *2,0,width/3,height);
  }
}
