
void setup(){
  
  size(500,500);
  background(255);
 smooth();

}
 
void draw(){
 
 // size(random(20,800);,random(20,800));
  float r = random(6,30);
 float d = random(6,30);
 if (mousePressed){
  filter(BLUR);
   fill(random(0,255),random(0,255),random(0,255));
  rect(mouseX,mouseY,d,r); 
  fill(random(0,255),random(0,255),random(0,255));
   ellipse(pmouseX,pmouseY,r,d);
   
}
 
 float f = random(1,100);
  frameRate(f); 
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
