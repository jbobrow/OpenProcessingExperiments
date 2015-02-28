


void setup() {
  size(500, 500);
  smooth();
}

void draw() {


  fill(0);
  rect(width/2, height/2, 500, 500);
  //BACKGROUND
  for (float i=1; i<width; i+=20) {
    noStroke();
    fill(random(0, 255), random(i, 30), 0, 60);
    ellipse(i, random(0, height), i, i);
  }




  //HEAD 
  fill(255, 100);
  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(width-150, height/6);
  vertex(width-150, height/3+30);
  vertex(width/2+80, height/3+60);
  vertex(width/2+70, height/2+110);
  vertex(width/2+30, height/2+120);
  vertex(width/2-30, height/2+120);
  vertex(width/2-70, height/2+110);
  vertex(width/2-100, height/3+60);
  vertex(130, height/3+30);
  vertex(130, height/6);
  endShape(CLOSE);




  //EYES
  stroke(0);
  strokeWeight(2);
  fill(255);
  ellipse(width/2+60, height/3-15, 50, 50);
  ellipse(width/2-60, height/3-15, 50, 50);

  fill(0);
  ellipse(width/2+60, height/3-15, 20, 20);
  ellipse(width/2-60, height/3-15, 20, 20);


  //GLASSES 
    fill(255);
  rectMode(CENTER);
  rect(width/2-60, height/3, 70, 30);
  rect(width/2+60, height/3, 70, 30);
  stroke(0);
  strokeWeight(3);
  line(width/2-25, height/3, width/2+25, height/3); 


  //EYEBROWS
  stroke(0);
  fill(0);
  strokeWeight(5);
  rect(width/2-60, height/3-40, 50, 10);
  rect(width/2+60, height/3-40, 50, 10);

  //SMILE
  for(float i=60; i>=0 && i<=60; i--){
  fill(255);
  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(width/2-50, height/2+i);
  vertex(width/2+60, height/2+i+20);
  vertex(width/2+50, height/2+80);
  vertex(width/2-50, height/2+80);
  vertex(width/2-70, height/2+i+10);
  endShape(CLOSE);
  }

  line(width/2-50, height/2+55, width/2+50, height/2+55); 
  strokeWeight(20);
  line(width/2-25, height/2+100, width/2+25, height/2+100); 

  //HAIR
  for (float i=140; i<=340; i+=20) {
    for (float j=0; j<=100; j+=10) {
      stroke(255);
      strokeWeight(1);
      fill(0);
      ellipse(i, j, 20, 20);
    }
  }
}



