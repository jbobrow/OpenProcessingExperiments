
void setup(){
  size(1000,500);
  frameRate(5);
}

void draw(){
  background(255);
  noStroke();
  fill(200,116,35);
  ellipse(width/2, height/2, 800, 500);
  stroke(0);
  strokeWeight(3);
  line(250,100,250,200);
  line(200,125,250,200);
  line(300,125,250,200);
  fill(255);
  ellipse(width/4,height/2,200,200);
  fill(25,130,20);
  ellipse(width/4,height/2,70,70);
  fill(0);
  ellipse(width/4,height/2,50,50);
  line(750,100,750,200);
  line(800,125,750,200);
  line(700,125,750,200);
  fill(255);
  ellipse(3*width/4,height/2,200,200);
  fill(25,130,20);
  ellipse(3*width/4,height/2,70,70);
  fill(0);
  ellipse(3*width/4,height/2,50,50);
}

void mousePressed(){
    if(mouseButton == CENTER) {
  background(255);
  noStroke();
  fill(200,116,35);
  ellipse(width/2, height/2, 800, 500);
  stroke(0);
  strokeWeight(3);
  line(250,400,250,200);
  line(200,375,250,200);
  line(300,375,250,200);
  fill(255);
  ellipse(width/4,height/2,200,200);
  line(750,400,750,200);
  line(800,375,750,200);
  line(700,375,750,200);
  fill(255);
  ellipse(3*width/4,height/2,200,200);
    }
    else if(mouseButton == LEFT){
  background(255);
  noStroke();
  fill(200,116,35);
  ellipse(width/2, height/2, 800, 500);
  stroke(0);
  strokeWeight(3);
  line(250,400,250,200);
  line(200,375,250,200);
  line(300,375,250,200);
  fill(255);
  ellipse(width/4,height/2,200,200);
  line(750,100,750,200);
  line(800,125,750,200);
  line(700,125,750,200);
  fill(255);
  ellipse(3*width/4,height/2,200,200);
  fill(25,130,20);
  ellipse(3*width/4,height/2,70,70);
  fill(0);
  ellipse(3*width/4,height/2,50,50);
    }
    
    else {
  background(255);
  noStroke();
  fill(200,116,35);
  ellipse(width/2, height/2, 800, 500);
  stroke(0);
  strokeWeight(3);
  line(250,100,250,200);
  line(200,125,250,200);
  line(300,125,250,200);
  fill(255);
  ellipse(width/4,height/2,200,200);
  fill(25,130,20);
  ellipse(width/4,height/2,70,70);
  fill(0);
  ellipse(width/4,height/2,50,50);
  line(750,400,750,200);
  line(800,375,750,200);
  line(700,375,750,200);
  fill(255);
  ellipse(3*width/4,height/2,200,200);
    }
}


