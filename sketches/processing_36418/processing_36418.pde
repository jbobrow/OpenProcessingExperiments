
void setup(){
  size(300,300);
  background(255);
}

void draw(){
  stroke(1);
  line(height/4,width/4+13,300,width/4+13);
  line(height/4,width/4-13,300,width/4-13);
  if(mouseX < width/4){
    fill(225,64,64);
  ellipse(height/5,width/3,20,100);
    fill(255,64,64);
    ellipse(height/4,width/4,26,26);
  }else{
    fill(255);
    ellipse(height/4,width/4,25,25);
  }
  fill(131,139,139);
  rect(0,height/2,width/4,height/2);
  
}

    

