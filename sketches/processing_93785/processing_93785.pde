
PImage motif1; 
PImage motif2;
boolean paused = false;
float genius;
 
 
void setup(){
  size(800,800);
  background(0);
  noStroke();
  loop();
  frameRate(275);
  motif1 = loadImage("Eyes Collage.png");
  motif2 = loadImage("trial.png");
}
 
 
//PAUSE AND CLEAR ACTIONS 
void keyPressed(){
  if (key == ' '){
    //if (paused) means that paused == true;
    //make the program restart again
    if (paused==true){
      paused = false;
    }
    else{
    paused = true;
    }
  }
      if (key == 'c'){
      background(0);
    }
    
}
 
 
 
void draw(){
  if(!paused){
  genius = random(-8, 2.0);
  image(motif1, random(-width,width), random(-height,height), motif1.width/genius, motif1.height/genius);
}
  if(!paused){
  genius = random(-8, 1.0);
  image(motif1, random(-width,width), random(-height,height), motif1.width/genius, motif1.height/genius);
   
 
 
   
  image(motif1, mouseX, mouseY, motif1.width/genius/5, motif1.height/genius/5);
  }
  
 
   
  stroke(0);
  line(0,0,mouseX,mouseY);
  line(0,800,mouseX,mouseY);
  line(800,0,mouseX,mouseY);
  line(800,800,mouseX,mouseY);
  line(200,300,mouseX,mouseY);
  line(700,500,mouseX,mouseY);
  
  
 
}
void mousePressed(){
  image(motif2, mouseX, mouseY, motif2.width, motif2.height);
 
}



