
//Guilherme Vargas Garcia, Sept, 24

void setup(){
  size(500,300);
  noStroke();
}

void draw(){
  background(255);
  fill(#0D98FF, 204);
  float y1=map(mouseX, 0, width, 80, 230);
  float y2=map(width-mouseX, 0, width, 80, 230);
  float diam= pmouseY/4+10;
  float diam2= height-pmouseY;
  ellipse(100,y1,diam,diam);
  ellipse(200,y2,diam,diam);
  ellipse(300,y1,diam,diam);
  ellipse(400,y2,diam,diam);
  
  if ((mouseY >= height/2) && (mouseX< 160)){
    fill(#0D71FA); //blue
    ellipse(100,y1,diam,diam);
    ellipse(200,y2,diam,diam);
    ellipse(300,y1,diam,diam);
    ellipse(400,y2,diam,diam);
  }
  if ((mouseY > height/2) && (mouseX >160 )){
    fill(#FF2739); //red
     ellipse(100,y1,diam,diam);
    ellipse(200,y2,diam,diam);
    ellipse(300,y1,diam,diam);
    ellipse(400,y2,diam,diam);
  }
  
  if ((mouseX > 320) && (mouseY > height/2)){
    fill(#07DB59); //green
     ellipse(100,y1,diam,diam);
    ellipse(200,y2,diam,diam);
    ellipse(300,y1,diam,diam);
    ellipse(400,y2,diam,diam);
}
  if ((mouseX < 160) && (mouseY<height/2)){
    fill(#003C8E); //dark blue
    ellipse(100,y1,diam,diam);
    ellipse(200,y2,diam,diam);
    ellipse(300,y1,diam,diam);
    ellipse(400,y2,diam,diam);
  }
  
  if((mouseX>160) && (mouseY<height/2)){
    fill(#81000B); //dark red
    ellipse(100,y1,diam,diam);
    ellipse(200,y2,diam,diam);
    ellipse(300,y1,diam,diam);
    ellipse(400,y2,diam,diam);
  }
  
 if((mouseX>320) && (mouseY<height/2)){
    fill(#006425); //Dark green
    ellipse(100,y1,diam,diam);
    ellipse(200,y2,diam,diam);
    ellipse(300,y1,diam,diam);
    ellipse(400,y2,diam,diam);
 }
