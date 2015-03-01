
void setup(){
  size(500,500);
  background(0);
}

void draw(){
//background reset  
  background(0);
  noFill();
  stroke(255);
  strokeWeight(5);
//draw closed eyes
  for(int x=width/4; x<width; x+=width/2){
    for(int y=height/4; y<height; y+=height/2){
  arc(x,y,100,70,radians(0), radians(180));
    }
  }
//eyes open if key is pressed
  if(keyPressed){
    for(int x=width/4; x<width; x+=width/2){
    for(int y=height/4; y<height; y+=height/2){
     //eye shape
      strokeWeight(5);
      stroke(255);
      ellipse(x,y,100,70);
     //iris
      fill(255,0,0);
      noStroke();
      ellipse(x,y,50,50);
     //pupil
      fill(0);
      ellipse(x,y,25,25);
    }
    }
  }
//if mouse is pressed in upper left fourth of screen, upper left eye opens & displays word "WE"
  if(mousePressed && mouseX<width/2 && mouseY<height/2){
   //eye shape 
    ellipse(width/4,height/4,100,70);
   //iris
    fill(255,0,0);
    noStroke();
    ellipse(width/4,height/4,50,50);
   //pupil
    fill(0);
    ellipse(width/4,height/4,25,25); 
    
  //text "WE"
   textSize(50);
   fill(255,0,0);
   text("WE",215,height/2);
  }
  
//if mouse is pressed in the upper right fourth of the screen, upper right eye opens & displays text "ARE" 
  if(mousePressed && mouseX>width/2 && mouseY<height/2){
   //eye shape 
    ellipse(width/4*3,height/4,100,70);
   //iris
    fill(255,0,0);
    noStroke();
    ellipse(width/4*3,height/4,50,50);
   //pupil
    fill(0);
    ellipse(width/4*3,height/4,25,25); 
    
  //text "ARE"
   textSize(50);
   fill(255,0,0);
   text("ARE",215,height/2);
  }
  
//if mouse is pressed in lower left fourth of screen, lower left eye opens  & displays text "ALWAYS"
 if(mousePressed && mouseX<width/2 && mouseY>height/2){
   //eye shape 
    ellipse(width/4,height/4*3,100,70);
   //iris
    fill(255,0,0);
    noStroke();
    ellipse(width/4,height/4*3,50,50);
   //pupil
    fill(0);
    ellipse(width/4,height/4*3,25,25); 
    
  //text "WATCHING"
   textSize(50);
   fill(255,0,0);
   text("ALWAYS",150,height/2);  
  }
  
//if mouse is pressed in lower right fourth of screen, lower right eye opens
 if(mousePressed && mouseX>width/2 && mouseY>height/2){
   //eye shape 
    ellipse(width/4*3,height/4*3,100,70);
   //iris
    fill(255,0,0);
    noStroke();
    ellipse(width/4*3,height/4*3,50,50);
   //pupil
    fill(0);
    ellipse(width/4*3,height/4*3,25,25); 
    
  //text "WATCHING"
   textSize(50);
   fill(255,0,0);
   text("WATCHING",130,height/2);  
  }
}



