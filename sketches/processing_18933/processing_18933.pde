
void setup (){
  size(300,300);
background(255,255,255);
}

int x=0;
int t=0;
void draw(){
if (x<100){
  rectMode(CENTER);
  noStroke();
  fill(180,180,180);
  rect(width/2,height/2,x/3+30,x/3+30);
  fill(150,150,150);
  rect(width/2,height/2,x/3,x/3);
  x++;
}
else{
  if(x<150){
  rectMode(CENTER);
  noStroke();
  fill(x+80,180,180);
  rect(width/2,height/2,x/3+30,x/3+30);
  fill(x+50,150,150);
  rect(width/2,height/2,x/3,x/3);
  x++;
  }
  else{
    if(x<200){
    background(255,255,255);
    rectMode(CENTER);
    noStroke();
    fill(230+x-150,2*x-120,2*x-120);
    rect(width/2+2*x-300,height/2+2*x-300,x/3+30,x/3+30);
    
    fill(200+x-145,2*x-150,2*x-150);
    rect(width/2-2*x+300,height/2-2*x+300,x/3,x/3);
    x++;
    }
    else{
      if(x<300){
        background(255,255,255);
        strokeWeight(20-t/5);
       stroke(220+t/2,180+t/2,180+t/2);
       rectMode(CENTER);
       noFill();
       rect(width/2,height/2,280-3*t,280-3*t);
       t++;
       x++;
      }
      else{
        background(255,255,255);
      }
    }
      
  }
}

}
void mousePressed(){
  x=0;
  t=0;
  t++;
  x++;
}
  
  


