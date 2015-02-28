
float sWeight=0.125;//stroke
void setup(){
  size(600,600);
  background(0);
  frameRate(50);
  smooth();
}

void draw (){ 
  if(keyPressed==true){
    if((key=='w')){
      stroke(225,225,225);//white lines
    }
    if((key=='b')){
      stroke(0);//black lines
    }
    if((key=='c')){
      fill(0);
      rect(0,0,600,600);}//clear screen
  }
  if (mousePressed==true){
   strokeWeight(sWeight);//stroke is .25
  for(int y=0; y<=height-10; y+=20){
    for(int x=0; x<= width-10; x+=20){
      line (x,y,mouseX,mouseY);//draws lines from points to location of mouse
    }
  }
}
}

