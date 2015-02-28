
void setup(){
  size(800,800);
  background(0);
  
}

void draw(){
  
   
   if(mouseX>550&&mouseX;<650&&mouseY;>0&&mouseY;<20){
    if(mousePressed){
      background(255);
    }
   }
    if(mouseX>150&&mouseX;<250&&mouseY;>0&&mouseY;<20){
    if(mousePressed){
      background(0);
    }
   }
   if(mouseX>350&&mouseX;<450&&mouseY;>0&&mouseY;<20){
    if(mousePressed){
      background(137,137,137);
    }
   }
  
  if(mousePressed){
  fill(0);
  stroke(255);
  for(int x=0;x<3;x++){

    for(int y=0;y<3;y++){
      if(mouseX>10&&mouseX;<790&&mouseY;>10&&mouseY;<790){
    fill(random(255),random(255),random(255));
    stroke(0);
    strokeWeight(1);
        }
    rect(mouseX+x*30-45,mouseY+y*30-45,random(25),random(25));
     if(mouseX>150&&mouseX;<250&&mouseY;<20){
    if(mousePressed){
           
    
  }
  }
  }
  }
  }
            
  noFill();
  strokeWeight(5);
  stroke(255);
  rect(10,10,780,780);
  fill(0);
  rect(150,0,100,20);
  fill(137,137,137);
  rect(350,0,100,20);
  fill(255);
  rect(550,0,100,20);
 
}
