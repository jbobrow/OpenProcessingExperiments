
float a,b,c;

void setup(){
 size(600,600); 


}

void draw(){
  a=map(mouseY,0,600,0,255);
    b=map(mouseX,0,600,0,0);
      c=map(mouseX,0,600,0,200);
  background(a,256-b,c);
   
  beginShape();
   stroke(0);

  strokeWeight(10);
  stroke(#F08C8C);
    fill(#F08C8C);

  vertex(width/3,height*3/5);
  bezierVertex(mouseX-50,mouseY,mouseX+50,mouseY,width*2/3,height*3/5);

  endShape();
  stroke(0);
  strokeWeight(100);
  point(width/4,height/3);
  point(width*3/4,height/3);
  
   stroke(255);
     strokeWeight(10);
  point(width/4+10,height/3-10);
  point(width*3/4+10,height/3-10);

  
}


