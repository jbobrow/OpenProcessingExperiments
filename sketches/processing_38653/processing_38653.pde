
//AnthonyHernandez//PatternsandConditionals//

void setup(){
  size(500,500);
  background(0);
}

void draw(){
  background(0);
  stroke (255);
  
  for(int x=0;x<width; x+=10){
    for(int y=0; y<height; y+=10){
      
      fill(random(0,255),random(0),random(0));
      //sphere(x,y,5,5);
      
      if((x%500)==0){
        line(x,y,x+6,y-6);
      }else{
       fill(random(0,255),random(255),random(255));
       rect (400,400,x,y);
        line(x,y,x+6,y+6);  
      ellipse(x,y,5,5);
      strokeWeight(.5);
      stroke(random(100,255),random(255),random(255));
      
      }
    }
  }
}


