

   int x1,y1,y2,y3;
   float x,y;
 
   color colorE2=color(255,100,100);
   color colorE=color(100,100,100);
   color colorE1=color(100,100,100);


void setup(){
  size(500,500);
  frameRate(60);
  //rect color
  
    x1=400;
    y1=100;
    y2=200;
    y3=300;
   rectMode(CORNER);
   fill(255);
   rect(x1,y1,50,50);
   fill(colorE2);
   rect(x1,y2,50,50);
   fill(colorE1);
   rect(x1,y3,50,50);
}



void draw() {
//

 
  
 //ellipse color
   fill(colorE);  
   ellipse(x,y,50,50);
    x = x- (-mouseX + x) / 60;
    y = y - (-mouseY + y) / 60;
    
    if(mouseX>=x1 && mouseX<=x1+50 && mouseY>=y1 && mouseY<=y1+50 ){
    background(255); 
    fill(255);
    rect(x1,y1,50,50);
    fill(255,100,100);  
    rect(x1,y2,50,50);
    fill(100,100,100);
    rect(x1,y3,50,50);} 
   
    else if(mouseX>=x1 && mouseX<=x1+50 && mouseY>=y2 && mouseY<=y2+50){
   
 colorE=colorE2 ;
 }
     else if(mouseX>=x1 && mouseX<=x1+50 && mouseY>=y3 && mouseY<=y3+50){
   
 colorE=colorE1 ;
    
  }
   
    
 
  
}  



