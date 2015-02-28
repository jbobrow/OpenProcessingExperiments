
float r;
float g;
float b;
float a;



void setup(){
  background(255);
  size(700,500);
  smooth();
  frameRate(30);
}

void draw(){
   r = random(1,255);
   g = random(1,255);
   b = random(1,255);
   a = random(1,255);
background(mouseX,0,mouseY);

  
  if(mousePressed){
    stroke(255);
    fill(255);
  }
  else{
    stroke(0);
    fill(0);
    //noStroke();
    //noFill();
  }
  triangle(mouseX,mouseY,mouseX+80,mouseY+190,mouseX+90,mouseY+50);
  point(mouseX,mouseY);
  //ellipse(mouseX,mouseY,4,4);
  //rect(mouseX,mouseY,50,50);

}



