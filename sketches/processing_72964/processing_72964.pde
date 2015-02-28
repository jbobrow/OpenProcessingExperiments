
void setup(){
  size(800,800);
  background(0);
}

void draw(){
  
  fill(255);
  for(int x=0;x<100;x++){

    for(int y=0;y<100;y++){
      if(mouseX>x*30&&mouseX;<x*30+25&&mouseY;>y*30&&mouseY;<y*30+25){
    fill(random(255),random(255),random(255));
        }
    rect(x*30,y*30,random(25),random(25));
            
    
  }
  }
  
}
