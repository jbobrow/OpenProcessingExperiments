
void setup(){
  size(700,500);
  background(255);
 smooth();
  frameRate(30);
}
 
void draw(){
  float r = random(6,30);
 float d = random(6,30);
 if (mousePressed){
 stroke(0);
 strokeWeight(random(.5,5.5));
strokeCap(SQUARE);
  line(mouseX,mouseY,pmouseX,pmouseY); 
  noStroke();
fill(255,0,0);
  rect(mouseX,mouseY,d,r); 
  fill(0,random(55,255));
   ellipse(pmouseX,pmouseY,r,d);
   
}
 
}
 
 
 
void keyPressed(){
 
   if(key=='z'){
  background(255);
}
   if(key=='b'){
filter(BLUR);
}
  if(key=='f'){
 frameRate(random(1,100));

}

  if (key=='s'){
float r = random(100,500);   
    
  }
  
  if (key=='c'){
background(random(0,100)); 

  }
float a = random(10,200);
  if (key=='x'){
 size(500,700);
 }
if (key=='y'){
 size(700,500);
 }

}


