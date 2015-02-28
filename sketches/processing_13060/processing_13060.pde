
float x,y;


void setup(){
  size (400,400);
  background(0);
  smooth();
  
   noFill();
stroke(0,0,129,1000);
  beginShape();
  vertex(0,350);
  bezierVertex(80,300,100,250,300,350);
  endShape();
  
  beginShape();
  stroke(0,0,128,1000);
  vertex(300,350);
  bezierVertex(330,370,380,360,400,350);
  endShape(); 
 
}

void draw(){
if (mousePressed==true){
   if (mouseY<300) {
     stroke(255,255,0,100);
     strokeWeight(random(1,4));
    point(mouseX,mouseY);
    
   }else{
     noStroke();
   }
   
  if(keyPressed){
   if(key=='s')
if(mouseY<320);
      stroke(175,238,238,100);
      line(mouseX,mouseY,pmouseX,pmouseY);
  }
   
if (keyPressed){
  if(key ==' '){
    background(0);
       noFill();
stroke(0,0,129,1000);
  beginShape();
  vertex(0,350);
  bezierVertex(80,300,100,250,300,350);
  endShape();
  
  beginShape();
  stroke(0,0,128,1000);
  vertex(300,350);
  bezierVertex(330,370,380,360,400,350);
  endShape();
  
  }
} 
  }
}




