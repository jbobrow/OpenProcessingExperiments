
void setup(){
size(250,250);
background(255);
  
}
  
void draw() {
 
strokeWeight(2);
stroke(0);

// center line
line(125,0,125,250);

// big black circle
fill(0);
ellipse(110,100,111,100);

// small grey circle
fill(100,100,100);
stroke(100,100,100);
ellipse(160,125,50,50);

// small red rectangle
fill(255,0,0);
stroke(255,0,0);
rect(20,220,15,15);

// capture frame
if(keyPressed){
if(key==' '){
saveFrame("asymbalance.png");
}
}
  
}

