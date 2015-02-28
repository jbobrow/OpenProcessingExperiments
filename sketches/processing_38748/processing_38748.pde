
float random_number;
int my_number = 70;


void setup(){
 size(400,400); 
}

void draw(){
  
  
  //if the mouse is above the ellipse, draw ellipse
  if(mouseX < 40){
  background(0,237,240);
    
  random_number = random(400);
  ellipse(100,200,random_number,random_number);
  stroke(80);
  fill(80);
  random_number = random(50);
  ellipse(300,300,random_number,random_number);
  stroke(90);
        
}
 //otherwise draw a orange background
 else {  
   background(70);
 }
 
   ellipse(300,100,200,200);
   stroke(0,237,247);
   fill(0,237,247);
   stroke(247,70,0);
   ellipse(mouseX,mouseY,50,50);
   
   fill(247,70,0);
   stroke(0,237,247);
   ellipse(mouseX+100,mouseY+100,120,120);


 }
 
