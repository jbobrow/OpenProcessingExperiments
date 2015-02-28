

void setup(){

  size(600,600);
}

void draw(){
  background(220);
  for(int i=0; i<width;  i=i+40){
    for(int y=0; y<height; y=y+6){
      stroke(0);
      fill(random(i),y+50,y+100);
      rect(i,y,5,5);
      fill(random(200));
      ellipse(i+25,y,10,10);
    }
    //if mouseX<150, then rect appear
     if(mouseX<150){
       for(int r=0; r<width; r=r+40){
         for(int h=0;h<height; h=h+100){
           smooth();
           stroke(255);
        fill(random(r+10));
      rect(r+7,h+35,32,30);
       }
      
     }
  }
 
  }
}

