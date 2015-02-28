
void setup(){
  size(400,400);
  rectMode(CENTER);
  colorMode(HSB,400);
  frameRate(4);

}

void function1( float a, float b, float c, float d, float e, float f, float g, float h,float i, float j){
 float x= random(160,340);
 float y= random(30,250);
  fill(59,x,93);
  noStroke();
  triangle(e,f,g,h,i,j);
  stroke(205, x, y);
  strokeWeight(5);
  noFill();
  rect(a,b, x,y);
  stroke(106, x,y);
  strokeWeight(2);
  ellipse(c,d, x,y);
}
  


  void draw() { 
  
for(int q=0; q<15; q++){
    function1(random(400),random(400),random(400),random(400),random(200),random(200),random(200,300),random(200,300),random(300,400),random(300,400));
    noLoop();
  }
  }
  



