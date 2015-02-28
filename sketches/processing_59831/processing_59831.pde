
void setup(){
  size(500,500);
  smooth();
}

int i = 0;
float x; 
float y;
float easing = 0.01;

void draw(){
  float targetX = mouseX; 
  float targetY = mouseY;
  x += (targetX - x) * easing; 
  y += (targetY - y) * easing;
  
  background(255);
  //body
  stroke(125);
  fill(255,201,201,240);
  ellipse(x,y,200,200); //orig x = 250, y = 200
  noStroke();
  fill(245,153,153,210);
  ellipse(x+8,y,180,180);
  fill(255,184,173,190);
  ellipse(x+20,y,150,150);
  fill(214,120,106,130);
  ellipse(x+20,y,135,135);
  fill(255,222,178,230);
  ellipse(x+20,y,120,120);
  fill(255,213,59,220);
  ellipse(x+20,y,115,115);
  
  //face
  fill(255,236,90,255);
  ellipse(x+20,y,110,110); 
  fill(80);
  
  if(!mousePressed){
    ellipse(x-10,y+10, 15,15); //L eye open
    ellipse(x+50,y+10, 15,15); //R eye open
    noFill();
    strokeWeight(2);
    stroke(80);
    arc(x+20, y+10, 20,15,0,PI); //:)
  }else{
    noStroke();
    arc(x+20, y+10, 22,18,0,PI); //:D
    fill(80); 
    strokeWeight(2);
    arc(x-10,y+10, 15,15,PI, TWO_PI); //L eye squint
    arc(x+50,y+10, 15,15,PI, TWO_PI); //R eye squint
    stroke(80);
  }
    
  
  //leaf propellor
  ellipse(x+10,y-90,2,2);
  line(x+10,y-90, x+10, y-127);
  fill(157,236,155,155);
  
  
  if(i<3){
    ellipse(x+35,y-127,50,25);
    ellipse(x-15,y-127,50,25);
    i+=1;
  }else if(i>=3 && i < 6){
    ellipse(x+25,y-127,30,25);
    ellipse(x-5,y-127,30,25);
    i+=1;
  }else if(i>=6 && i< 8){
    ellipse(x+20,y-127,20,25);
    ellipse(x,y-127,20,25);
    i+=1;
  }else if(i>=8 && i< 11){
    ellipse(x+25,y-127,30,25);
    ellipse(x-5,y-127,30,25);
    i=0;
  }
  
}

