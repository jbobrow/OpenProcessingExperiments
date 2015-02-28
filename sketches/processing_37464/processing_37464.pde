
void setup(){
  size(600,600);
  background(100);
}

void draw(){
  for(int x=0; x<width/2; x+=10){  //ellipses will grow bigger in increments of 10 until screen is filled
    
  //first set of ellipses
    noFill();
    stroke(200,x,100);  
      //allows color of ellipse outlines to change gradually
    ellipse(width/2, height/2, x, height/2);
      //ellipse starts at center of sketch, width = 0, height = screen
      //ellipse grows wider each time in increments of 10, height remains the same 
        
  //second set of ellipses
    stroke(100,x,200);
    ellipse(width/2, height/2, width/2, x);
      //this time ellipse grows taller each time in increments of 10 and width remains the same giving the illusion of sphere
 
  //third set of ellipses
    stroke(150);
    ellipse (x, x, x, x);
      //ellipses grow larger from 0,0
     
  }
 
}



