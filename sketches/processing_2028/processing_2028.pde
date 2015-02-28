
float lineaY = 0;
int thin = 8;
int thick = 36;
float xpos = 134.0;

void setup(){
  size(500,500);
  //background(0,10);

  stroke(255);
  strokeWeight(7);
  noFill();
}

void draw(){
  float mx = mouseX * 0.4 - width/5.0;

  fill(0,10);
  rect(0,0,width,height);
  lineaY +=1;
  lineaY = lineaY %height;
  line(0,lineaY,width,lineaY);

  fill(102);
  rect(xpos, 0, thick, height);
  xpos += mx/16;
    if(xpos < -thin)  { 
    xpos =  width; 
  }
  if(xpos >  width) { 
    xpos = -thin; 
  }



}


