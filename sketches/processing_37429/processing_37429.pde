
void setup(){
  size(300,300);
  background(0);
  
}

void draw(){
  
  
  for(int x=0; x<300; x+=25){//sets the variable to expand 10 at a time
   
   //makes the squares
    noFill(); 
    stroke(255);
    rectMode(CENTER);
    rect(width/2,height/2,x,x);
    
    //makes the circles
    stroke(#9313F0);
    strokeWeight(2);
    ellipse(x,x,50,50);
    stroke(#E8F013);
    ellipse(width-x,x,50,50);
    
  }
}

 

