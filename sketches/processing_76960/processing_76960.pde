

void setup(){
  size(800,800);
  background(255);
}

void draw(){
  
 for (float i=0; i<=800; i+=20){
 noFill();
  // stroke(255);
  line(width/2,height/2,i,80);
  
  }
  for(float i=800; i>=0; i-=20){
    line(width/2,height/2,i,720);
   
  }
  for(float i=0; i<=640; i+=20){
    line(width/2, height/2, 0, i + 80);
  }
for(float i=720; i>=80; i-=20){
  line(width/2,height/2, 800, i);
}

if (mousePressed && dist(mouseX, mouseY, width/2, height/2) < 10){
  stroke(random(0,255), random(0,255), random(0,255));
}

}


