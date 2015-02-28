
void setup(){
  size(300,300);
  smooth();
  noStroke();}
  
void draw(){
  float x=random(-25,25);
  float y=random(-25,25);
//first conditions
  if(mouseX>=width/2){
     fill(0,100); 
     rect(0,0,width,height);
 //create the I variable with a FOR    
     for (int i=250; i >= 0; i = i-10){
//create the circle pattern in the middle of the screen       
       fill(250 -i);
      ellipse(width/2, height/2, i, i);      } 

//an ellipse follow the mouse    
     fill(255);
     ellipse(mouseX,mouseY, 50, 50);}
 
//second conditions 
  if(mouseX<=width/2){    
//ellipse pattern for the second condition    
    for (int i=255; i > 0; i = i -10){
    fill(255 -i);
    ellipse(width/2, height/2, i, i);
    } 

//background    
    fill(255,100);
     rect(0,0,width,height);
     fill(0);
     ellipse(mouseX,mouseY, 50, 50);

//second ellipse follow the mouse   
    stroke(0);
    strokeWeight(5);
    noFill();
    ellipse(mouseX+x,mouseY+y, 50, 50);
    
//creating two serials of ellipses that follow the mouse
    fill(0);
    noStroke();
    for(int x2=mouseX-mouseY; x2<255; x2= x2+30){
    ellipse(mouseX-x+x2,mouseY-y,20,20);}
    for(int x2=mouseX-mouseY; x2<255; x2= x2+30){
    ellipse(mouseX-x,mouseY-y+x2,20,20);}}
}

