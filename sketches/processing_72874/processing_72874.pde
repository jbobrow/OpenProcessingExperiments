
// DORAHAN ARAPGIRLIOGLU
//Drawing program

//I tried to make buttons that change the shape of the brush, but I couldn't get it working.

int y;
int x;
//int button1 = 0;

void setup(){
  
  size (600,600);
  smooth();
  background(255);
  colorMode(HSB,360,100,100,100);
  
}

void draw(){
  
  //drawing controls

  fill(0);
  rect(0,500,600,100);
  
  //buttons
  
  fill(255);
  rect(50,525,25,25);
  
  rect(400,525,25,25);
  triangle(450,550,463,525,475,550);
  ellipse(512.5,537.5,25,25);
  
  //drawing

 
 //if mousePressed (){ 
   //if (mouseX >400 && mouseX <425 && mouseY >525 && mouseY <550)
  
  //(mouseX >400 && mouseX <425 && mouseY >525 && mouseY <550)
  
  
    //if(mouseX >400 && mouseX <425 && mouseY >525 && mouseY <550){
      
    
    noStroke();
    fill(y++,mouseX,mouseX);
      if (y>255){
        y=0;
      }
    if (mousePressed == true){
      if (mouseX > 400){
        ellipse(mouseX,mouseY,mouseX/5,mouseY/5);
      } else {
     //   if ( < 400)
    rect(mouseX,mouseY,mouseX/5,mouseY/5);
      }
    }
     
     
 }
 
// void mousePressed(){
 //  if (mouseX >400 && mouseX <425 && mouseY >525 && mouseY <550)
  // button1 = 1;
// }
