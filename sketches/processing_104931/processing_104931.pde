
void setup(){
size(400,400);
}
void draw(){
  if(mouseX<100){
    background(255);
  }else if(mouseX<300){
    background(128);
  }else{
    background(0);
  }
  
noStroke();
fill(203,0,0);
rect(50,50,200,200);
rect(375,300,100,100);
 
fill(255,233,118);
rect(250,0,125,150);
rect(0,300,50,400);
 
fill(0,0,0);
rect(50,250,100,100);
rect(150,350,100,25);
 
fill(17,12,173);
rect(250,300,125,75);
 
 
stroke(0,0,0);
strokeWeight(7);
strokeCap(SQUARE);
 
line(100,15,100,50);
 
line(10,50,375,50);
 
line(50,50,50,385);
 
line(250,15,250,375);
 
line(375,15,375,385);
 
line(10,150,50,150);
 
line(10,300,400,300);
 
line(50,250,375,250);
 
line(250,150,375,150);
 
line(50,350,250,350);
 
line(150,375,375,375);
 
line(150,250,150,385);
 
line(315,150,315,250);
}



