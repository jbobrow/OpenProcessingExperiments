
int inc=15;


void setup(){
  size(600,600);
  smooth();
  background(255);
  
  
}

void draw(){

  strokeWeight(2);
  stroke(0);
  fill(#F5FF6A);
  ellipse(mouseX, mouseY,70,70);
  fill(0);
  ellipse(mouseX-10,mouseY-10,5,5);
  ellipse(mouseX+10,mouseY-10,5,5);
  noFill();
  arc(mouseX,mouseY,40,40,.31,2.75);
 
  frameRate(20);
  if(mousePressed){
    for(int i=0;i<width;i+=inc){
        stroke(random(0,255),random(0,255),random(0,255));
        strokeWeight(10);
        line(i,0,mouseX,mouseY);
    }
    for(int j=0;j<height;j+=inc){
      stroke(random(0,255),random(0,255),random(0,255));
        strokeWeight(10);
        line(0,j,mouseX,mouseY);
    }
    for(int i=0;i<width;i+=inc){
        stroke(random(0,255),random(0,255),random(0,255));
        strokeWeight(10);
        line(i,600,mouseX,mouseY);
    }
    for(int j=0;j<height;j+=inc){
      stroke(random(0,255),random(0,255),random(0,255));
        strokeWeight(10);
        line(600,j,mouseX,mouseY);
    }
    strokeWeight(2);
  stroke(0);
  fill(#F5FF6A);
  ellipse(mouseX, mouseY,70,70);
  fill(0);
  ellipse(mouseX-10,mouseY-10,5,5);
  ellipse(mouseX+10,mouseY-10,5,5);
  fill(255);
  beginShape();
  vertex(mouseX-20,mouseY+5);
  bezierVertex(mouseX-20,mouseY+25,mouseX+20,mouseY+25,mouseX+20,mouseY+5);
  endShape(CLOSE);

  }
  else{
  background(255);
  strokeWeight(2);
  stroke(0);
  fill(#F5FF6A);
  ellipse(mouseX, mouseY,70,70);
  fill(0);
  ellipse(mouseX-10,mouseY-10,5,5);
  ellipse(mouseX+10,mouseY-10,5,5);
  noFill();
  arc(mouseX,mouseY,40,40,.31,2.75);
}
  
  
if(keyPressed){
  if((key=='c' || key=='C')){
  for(int l=0;l<width;l+=inc){
    for(int r=0;r<height;r+=inc){
    fill(random(0,255),random(0,255),random(0,255));
    noStroke();
    ellipse(l,r,14,14);
    }
  }
   strokeWeight(2);
  stroke(0);
  fill(#F5FF6A);
  ellipse(mouseX, mouseY,70,70);
  fill(0);
  ellipse(mouseX-10,mouseY-10,5,5);
  ellipse(mouseX+10,mouseY-10,5,5);
  fill(255);
  ellipse(mouseX,mouseY+10,20,20);
  //arc(mouseX,mouseY,40,40,.31,2.75);
   
  
}if(keyPressed){
  if((key=='m'||key=='M')){
    for(int k=0;k<width;k+=60){
      for(int t=0;t<height;t+=60){
      fill(random(0,255),random(0,255),random(0,255));
      noStroke();
      rect(k,t,60,60);
        }
  }
   strokeWeight(2);
  stroke(0);
  fill(#F5FF6A);
  ellipse(mouseX, mouseY,70,70);
  fill(0);
  ellipse(mouseX-10,mouseY-10,5,5);
  ellipse(mouseX+10,mouseY-10,5,5);
  fill(255);
  rect(mouseX-10,mouseY,20,20);
  //arc(mouseX,mouseY,40,40,.31,2.75);
}
}
else{
  background(255);
  strokeWeight(2);
  stroke(0);
  fill(#F5FF6A);
  ellipse(mouseX, mouseY,70,70);
  fill(0);
  ellipse(mouseX-10,mouseY-10,5,5);
  ellipse(mouseX+10,mouseY-10,5,5);
  noFill();
  arc(mouseX,mouseY,40,40,.31,2.75);
}

}

}

