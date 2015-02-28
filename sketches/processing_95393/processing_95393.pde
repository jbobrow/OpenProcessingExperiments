
void setup() {
  size(500,500);
  background(255);
}

int emotionLevel = 0;
int eyePosY = 0;
int[] lidPosY = new int[2];

void draw() {
  background(255);
  fill(0);
  
  emotionLevel = (height-mouseY)*100/height;
  println(emotionLevel);
  eyePosY = 210+(emotionLevel*2);
  ellipse(140-(emotionLevel/8),eyePosY,50,50);
  ellipse(360+(emotionLevel/8),eyePosY,50,50);
  
  lidPosY[0] = 50+(emotionLevel*4);
  lidPosY[1] = (emotionLevel*5);
  if (emotionLevel >= 93) {
    line(30,370,220,370);
    line(280,370,470,370);
  } else if (emotionLevel >= 85) {
    
  } else if (emotionLevel >= 75){
    line(30,175,220,425);
    line(280,425,470,175);
  } else {
    fill(255);
    beginShape();
    vertex(30,0);
    vertex(30,lidPosY[0]);
    vertex(220,lidPosY[1]);
    vertex(220,0);
    endShape();
    beginShape();
    vertex(280,0);
    vertex(280,lidPosY[1]);
    vertex(470,lidPosY[0]);
    vertex(470,0);
    endShape();
  }

  mask();
  noFill();
  stroke(0);
  ellipse(125,250,180,360);
  ellipse(375,250,180,360);
}

void mask() {
  noStroke();
  fill(255);
  beginShape();
  vertex(125,70);
  bezierVertex(165,70,215,130,215,250);
  bezierVertex(215,370,165,430,125,430);
  bezierVertex(85,430,35,370,35,250);
  bezierVertex(35,130,85,70,125,70);
  vertex(125,0);
  vertex(0,0);
  vertex(0,500);
  vertex(250,500);
  vertex(250,0);
  vertex(125,0);
  endShape();
  
  beginShape();
  vertex(125+250,70);
  bezierVertex(165+250,70,215+250,130,215+250,250);
  bezierVertex(215+250,370,165+250,430,125+250,430);
  bezierVertex(85+250,430,35+250,370,35+250,250);
  bezierVertex(35+250,130,85+250,70,125+250,70);
  vertex(125+250,0);
  vertex(0+250,0);
  vertex(0+250,500);
  vertex(250+250,500);
  vertex(250+250,0);
  vertex(125+250,0);
  endShape();
}


