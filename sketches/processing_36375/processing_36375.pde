
void setup() {
  size(300,300);
  rectMode(CORNERS);
  smooth();
}

int x = 1;

void draw() {
  
  //rectangle 1
  
  if (mouseX < 150){
    fill(225,25);
    rect(0,0,150,300);
  }else{
    background(235);
  }
  
  //rectangle 2
  
   if (mouseY > 150){
    fill(200,50);
    rect(0,150,150,300);
  }
  
  //rectangle 3
  
  if (mouseX > 75){
    if(mouseY > 150){
    fill(175,25);
    rect(75,150,150,300);
  }}

//rectangle 4

 if (mouseX > 75){
    if(mouseY < 225){
      if(mouseX < 150){
        if(mouseY >150){
        fill(150,50);
    rect(75,150,150,225);
    }}}}
    
    //rectangle 5
    
     if (mouseX > 75){
    if(mouseY < 225){
      if(mouseX < 113){
        if(mouseY >150){
        fill(125,25);
    rect(75,150,113,225);
    }}}}
    
    //rectangle 6
    
     if (mouseX > 75){
    if(mouseY > 188){
      if(mouseX < 113){
        if(mouseY < 225){
        fill(100,25);
    rect(75,188,113,225);
    }}}}
    
    //rectangle 7
    
    if (mouseX > 94){
    if(mouseY > 188){
      if(mouseX < 113){
        if(mouseY < 225){
        fill(75,15);
    rect(94,188,113,225);
    }}}}
    
    //rectangle 8
    
    if (mouseX > 94){
    if(mouseY > 188){
      if(mouseX < 113){
        if(mouseY < 207){
        fill(50,10);
    rect(94,188,113,207);
    }}}}
    
    //rectangle 9
    
     if (mouseX > 94){
    if(mouseY > 188){
      if(mouseX < 103){
        if(mouseY < 207){
        fill(100);
    rect(94,188,103,207);
    }}}}
    
    //final target
    
       if (mouseX > 94){
    if(mouseY > 198){
      if(mouseX < 103){
        if(mouseY < 207){
        fill(0);
    rect(94,198,103,207);
    }}}}
    
    
    //redcircle
    
if (mouseX > 94){
if(mouseY > 198){
if(mouseX < 103){
if(mouseY < 207){
      
fill(255,0,0,5);
ellipse(99,203,x,x);
x++;
    
}}}}}
  
      


