
void setup(){
  background (255);
  size (300,300);
  frameRate (25);
}

int x=0;

//OG Box
void draw(){
  noStroke();
  fill (0);
  rectMode(CENTER);
  rect (width/2,height/2,width/4,height/4);
  x++;
  
  //changing colors
  if (x>100){
    noStroke();
    fill (255,0,0);
    rectMode(CENTER);
    rect (width/2,height/2,width/4,height/4);
    x++;
  }
  
  //growing bigger
  if (x>150){
    noStroke();
    fill(255,0,0);
    rectMode(CENTER);
    rect (width/2,height/2,(width/4)+x/5,(height/4)+x/5);
    x++;
  }
  
  //sliding down
  if (x>200){
    background (255);
    noStroke();
    fill(255,0,0);
    rectMode(CENTER);
    rect (width/2,(height/2)+x/2,(width/4)+201/5,(height/4)+201/5);
    x++;
  } 
  
  //sumshing at the bottom
  if (x>250){
    background (255);
    noStroke();
    fill(255,0,0);
    rectMode(CENTER);
    rect (width/2,(height/2)+251/2,(width/4)+201/5+(3.77*x),(height/4)+201/5);
    x++;
  } 
  
  //stopping animation
  if (x>300){
    noLoop();
  }
    
}

