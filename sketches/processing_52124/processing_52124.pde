


void setup(){
 size(500,500);
smooth(); 
  
}

void draw(){
 fill(random(100,255));
if ((mousePressed == true) && (mouseButton == LEFT)) {
   fill(random(0.255), random(0,255), random(0,255)); 
  }
 else{
  fill(255,0,0, 20); 
  stroke(3);
  }

 ellipse(pmouseX, pmouseY, pmouseX,pmouseX); 

fill(random(100,255));
if ((mousePressed == true) && (mouseButton == LEFT)) {
   fill(255,0,0); 
  }
 else{
  fill(230,10); 
  stroke(0,255,0);
  } 
 line(pmouseX, pmouseY, pmouseX,pmouseX);
 

  
}

