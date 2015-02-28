
//Homework 2, 60-257
//Copyright 2013 Stephanie Cheung and the giant robots
void setup (){
  size(600,600);
  background(95,6,6);
  text("The elusive smile of Jim Roberts.", 205,400);
  smooth();
}
  float x = 300;
  float y = 200;
  float wd = 200;
  float ht = 200;
  float tr = 255; 
  int tx,ty;
  float angle;
 
void draw(){
  translate (tx,ty);
  rotate (angle);
  headShape();
  nose();
  glasses();
  ear();
  moustache();
  hair();
  
   
}
 
void mousePressed(){
  pushMatrix();
  x=mouseX;
  y=mouseY;
  wd=random(10,300);
  ht=random(10,300);
  tr=random(10,255);
}

void keyPressed(){
  if (key=='w'){  
    ty = ty - 20%height; 
  }
  else if (key=='s'){
    ty = ty + 20%width;
  }
  else if (key=='d'){
    tx = tx + 20%width;
  }
  else if (key=='a'){
    tx = tx - 20%height;
  }
  else if (key=='q'){
    background(95,6,6);
    popMatrix();
  }
}

void keyReleased(){
  angle=random(0,.5*PI);
}

void headShape(){
  noStroke();
  fill(245,178,124,tr);
  ellipse(x,y,wd,ht);
  stroke(0);
  strokeWeight(1);
  noFill();
  arc(x,y,wd,ht,.08*PI,2*PI-.08*PI);
}

void nose(){
  fill(245,178,124,tr);
  beginShape();
  curveVertex(x+wd*.485,y-ht*.12);
  curveVertex(x+wd*.485,y-ht*.12);
  curveVertex(x+wd*.55,y+ht*.05);
  curveVertex(x+wd*.485,y+ht*.12);
  curveVertex(x+wd*.485,y+ht*.12);
  endShape();
}

void glasses(){
  strokeWeight(2);
  stroke(50);
  fill(176,216,242,tr);
  arc(x+wd*.18,y-ht*.15,wd*.25,ht*.25, 0,PI);
  line(x+wd*.305,y-ht*.15,x-wd*.25,y-ht*.15);
  noFill();
  beginShape();
  curveVertex(x+wd*.305,y-ht*.15);
  curveVertex(x+wd*.305,y-ht*.15);
  curveVertex(x+wd*.4,y-ht*.17);
  curveVertex(x+wd*.485,y-ht*.12);
  curveVertex(x+wd*.485,y+ht*.12);
  endShape();
}

void ear(){
  fill(250,150,73,tr);
  strokeWeight(3);
  stroke(229,100,0,tr);
  ellipse(x-wd*.25,y, wd*.25,ht*.35);
  noStroke();
  fill(245,178,124);
  ellipse(x-wd*.2,y, wd*.2,ht*.3);
}

void moustache(){
  strokeWeight(1);
  stroke(100);
  fill(156,156,156,tr);
  triangle(x+wd*.25,y+ht*.25, x+wd*.2,y+ht*.20, x+wd*.48,y+ht*.2);
  strokeWeight(2);
  stroke(50);
  line(x+wd*.28,y+ht*.3, x+wd*.4,y+ht*.3);
}

void hair(){
  fill(167);
  arc(x-wd*.05,y-ht*.27,wd*.8,ht*.5,PI,1.6*PI);
}


