
void setup() {
  size(300,300);
  rectMode(CORNERS);
  smooth();
  frameRate(50);
 
}

int a = 1;

float golddustX = random(99,203);
float golddustY = random(99,203);

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
      
fill(255,217,0,5);
ellipse(99,203,a,a);
a++;
    
    if(a > 575){
a = 1;
}


//golddust 1

if(a > 175){
   fill(255,236,124,a-300);
   stroke(255);
    ellipse(golddustX,golddustY,10,10);
    golddustX += random(-15,15);
    golddustY += random(-15,15);
    
}

//golddust 2

    if(a > 175){
   fill(255,236,124,a-300);
   stroke(255);
    ellipse(golddustX,golddustY,15,15);
    golddustX += random(-15,15);
    golddustY += random(-15,15);
    
}

//golddust 3

  if(a > 175){
   fill(255,236,124,a-300);
   stroke(255);
    ellipse(golddustX,golddustY,5,5);
    golddustX += random(-5,5);
    golddustY += random(-5,5);
    
//fixing stroke "bug"    
    
}
if (a < 200){
  stroke(0);
}
}}}}}
  
      


