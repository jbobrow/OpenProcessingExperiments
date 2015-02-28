
//Drawing program, Maria Nunez, Assigment 3
float x;
float exis;
float uxus;

void setup(){
  size (800,1000);
  smooth();
  background(0);
  textSize(16);
  text("Click here for instructions",width/2,height/2);
  
  x=0;
  exis=-x;
  uxus=x;
 
}

void draw(){
  noStroke();
  
 //start 
  if (((mouseX>450) && (mouseY>450) && (mouseX<550) && (mouseY<550))&& mousePressed){
    background(0);
    textSize(16);
    fill(255);
    text("-Click and keep pressed to draw (B/W)", 350,450);
    text("-'Down arrow & Click' to clear", 350,470);
    text("-Up arrow pressed & Click for Color", 350,490);
     fill(100,140,23);
    rect(350,500,200,50);
    rectMode(CORNER);
    fill(255);
    text("Click here to start", 355,525);
    redraw();
    
 //instructions   

    if(((mouseX>350) && (mouseY>500) && (mouseX<550) && (mouseY<550))&& mousePressed){
    background(0);
    redraw();
    
    } 
    }
 
  else {
  
  //draw triangles.expanding out
  
  if (mousePressed){
   exis++;
   uxus--;
 
  triangle(exis,height/2,x,0,x,height/2);
  triangle(exis,height/2,x,1000,x,height/2);
  triangle(uxus,height/2,x,0,x,height/2);
  triangle(uxus,height/2,x,1000,x,height/2);
  }
  
  // Change color, clear, restart
  else if (keyPressed){
    if (key == CODED) {
      //B/W
      if (keyCode == UP){
        fill(random(255),random(255),random(255),random(100));
           }
   
     //return
     else if(keyCode==LEFT){
    x=0;
    }
      else if (keyCode==DOWN){
     background(0);
  }
    }
    }
 
 //Moving location x
  else if (x>width){
   x=0;
     } 
  else{
    fill(random(255),random(10));
    x+=1;
    exis=x;
    uxus=x;
   }
  loop();
  }
  }  
  
  





