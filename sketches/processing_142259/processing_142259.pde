
/*
Konkuk University
SOS iDesign

Name: CHOI Seung-hwan
ID: 201420112

*/

import ddf.minim.*;

Minim minim;
AudioInput in;
float volume = 0;
float volumeF = 0;

void setupAudio(){
minim = new Minim(this);
in = minim.getLineIn(Minim.MONO, 512);
}

void getVolume(){
volumeF = in.right.level()*150;
volume = 0.8*volume + 0.8*volumeF;
}

void stop(){
in.close();
minim.stop();
super.stop();
}

void setup(){
size (600, 600);
setupAudio();
background(255);
smooth();
}

void draw(){
  
  float LX = constrain(mouseX,175,220);
  float LY = constrain(mouseY,350,420);
  float RX = constrain(mouseX,380,420);
  float RY = constrain(mouseY,350,420);
  
//hairband  
  
  fill(255,50,0);
  strokeWeight(12);
  ellipse(300,285,250,250);
  
  fill(255,50,0);
  strokeWeight(12);
  beginShape();
  vertex(240,250);
  bezierVertex(240,250,100,300,120,15);
  bezierVertex(120,15,250,40,270,250);
  endShape();
  
  fill(255,50,0);
  strokeWeight(12);
  beginShape();
  vertex(360,250);
  bezierVertex(360,250,500,300,480,15);
  bezierVertex(480,15,350,40,330,250);
  endShape();
  
//face  
  
  fill(#fdd1be);
  strokeWeight(11);
  ellipse(300,400,480,380);
  
//eyes
  
  fill(255);
  strokeWeight(3);
  ellipse(170,380,215,215);
  
  fill(255);
  strokeWeight(3);
  ellipse(430,380,215,215);
  
  fill(#ff495a);
  strokeWeight(0);
  ellipse(182,380,190,190);
  
  fill(#ff495a);
  strokeWeight(0);
  ellipse(418,380,190,190);
  
  fill(0);
  strokeWeight(0);
  ellipse(200,385,150,150);
  
  fill(0);
  strokeWeight(0);
  ellipse(400,385,150,150);
  
//hair
  
  fill(#fd9218);
  smooth();
  strokeWeight(5);
  beginShape();
  vertex(250,210);
  vertex(220,220);
  vertex(190,230);
  vertex(160,250);
  vertex(120,280);
  vertex(110,290);
  vertex(100,300);
  vertex(90,310);
  vertex(80,320);
  vertex(80,320);
  vertex(80,335);
  vertex(110,325);
  vertex(120,325);
  vertex(130,305);
  vertex(150,285);
  vertex(205,250);
  vertex(185,275);
  vertex(155,315);
  vertex(205,305);
  vertex(260,305);
  vertex(300,240);
  vertex(340,305);
  vertex(395,305);
  vertex(445,315);
  vertex(415,275);
  vertex(395,250);
  vertex(450,285);
  vertex(470,305);
  vertex(480,325);
  vertex(490,325);
  vertex(520,335);
  vertex(520,320);
  vertex(510,310);
  vertex(500,300);
  vertex(490,290);
  vertex(480,280);
  vertex(440,250);
  vertex(410,230);
  vertex(380,220);
  vertex(350,210);
  vertex(300,210);
  endShape(CLOSE);
  
//outline
  
  noFill();
  smooth();
  strokeWeight(12);
  ellipse(300,400,480,380);
  
//interaction
  
  if(mousePressed){
    
    float a=random(255);
    float b=random(255);
    float c=random(255);
    float d=random(100);
    
    fill(d);
    strokeWeight(0);
    ellipse(200,385,150,150);
    
    fill(d);
    strokeWeight(0);
    ellipse(400,385,150,150);
    
    fill(255);
    strokeWeight(0);
    ellipse(200,385,70,70);
    
    fill(255);
    strokeWeight(0);
    ellipse(400,385,70,70);
    
    strokeWeight(2);
    fill(a,b,c);
    beginShape();
    vertex(195,380);
    vertex(200,355);
    vertex(205,380);
    vertex(230,385);
    vertex(205,390);
    vertex(200,415);
    vertex(195,390);
    vertex(170,385);
    endShape(CLOSE);
    
    strokeWeight(2);
    fill(a,b,c);
    beginShape();
    vertex(405,380);
    vertex(400,355);
    vertex(395,380);
    vertex(370,385);
    vertex(395,390);
    vertex(400,415);
    vertex(405,390);
    vertex(430,385);
    endShape(CLOSE);
    
    strokeWeight(0);
    fill(d,a,b,65);
    ellipse(pmouseX,pmouseY,50,50);
  }
    
    else{
      fill(255);
      strokeWeight(0);
      ellipse(LX,LY,70,70);
      
      fill(255);
      strokeWeight(0);
      ellipse(RX,RY,70,70);
    }

//mouse

    getVolume();
    float X = map(volume, 0, 2, 0.5, 5);
    float Y = map(volume, 0, 2/2, 2, 1);
    
    strokeWeight(4);
    fill(#F7F23C);
    ellipseMode(CENTER);
    ellipse(300,530,X,Y);
    
}

void keyPressed(){
setup();

}
