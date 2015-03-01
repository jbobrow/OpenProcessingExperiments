

  size(750,500);
  //beginRecord(PDF, "dibujofijo1.pdf");
background(0);
smooth();
noStroke();
  for(int b=0; b<width; b+=10){ 
    fill(25, 0, 0);
    rect(b, 2, 4, 4);
    for(int l=0; l<height; l+=10){
      fill(25, 0, 0);
      rect(b, l, 4, 4);
      fill(0, 0, 45, 200);
      ellipse(b+10, l+10, 3, 3);
    }
  }
  for(int a=0; a<width; a+=5){
    fill(255, 20);
        ellipse(a, a, 75, 75);
  }

  for(int i=0; i<height/2+height/4; i+=4){
    fill(105, 0, 33, 20);

    rect(width/8, i, 100, 100);
    rect(width/8+width/4, i, 100, 100);
    rect(width/8+width/4+width/4, i, 100, 100);
    rect(width/8+width/4+width/4+width/4, i, 100, 100);
  }
  
  for (int x=0; x<width; x+=60){
    noFill();
    stroke(15, 84, 12, 100);
    strokeWeight(4);
beginShape();
curveVertex(x,  200);
curveVertex(100,  90);
curveVertex(x,  19);
curveVertex(21,  x);
curveVertex(x, 400);
endShape();
  }
for(int i=0; i<height; i+=40){
  stroke(22, 3, 40, 200);
  beginShape();
  curveVertex(i, i);
  curveVertex(320, i);
  curveVertex(i, 460);
  curveVertex(i, i);
  endShape();
  beginShape();
  curveVertex(600, i);
  curveVertex(i, 200);
  curveVertex(460, i);
  curveVertex(i, i);
  endShape();
}
for(int s=435; s<width; s+=5){
    noStroke();
    fill(0, random(255), random(255), random(255));
        ellipse(s, s, 75, 75);
  }
/*
for(int c=490; c<width; c+=5){
  for(int c2=320; c2<height; c2+=5){
    noStroke();
    fill(0, random(255), random(255), random(255));
    ellipse(c, c2, 30, 30);
    
  }
}
*/
  //endRecord();
