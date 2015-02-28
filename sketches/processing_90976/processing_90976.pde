
// Sketch Feb 25 2013 12:44:56 PM 
// Kara Dodd kdodd@ucsc.edu

int s = 5;

void setup () {
  size (700, 500, P3D);
  background(0);
  smooth();
  frameRate(60);
}

void draw(){
  //fade effect
  noStroke();
  fill(0,0,0,2);
  rect(0, 0, width, height);
  
  stroke(mouseX, mouseY, frameRate);
  strokeWeight(s);
  float dis = dist(mouseX, mouseY, height/2, width/2);
  line(mouseX, mouseY-5, dis, dis);
  
  if (mousePressed){
   background(0);
    if(s >= 500){
      s = 0;
    }else{
     s++; 
    } 
  } 
}



