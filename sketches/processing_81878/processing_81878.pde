
size(800, 800);
background(255);
noFill();
smooth();


for (int x = 0; x < 1700; x++) {
  float n = norm(x, 0, 1700.0);
  float val = pow(n, 4) * 255.0; 
  stroke(255-val);
  ellipse(width/2, height/2, x, x);
  }

//  shade background


  for (int x = 10; x < 900; x += 4) {

    if (x<400) { 
      float n = map(x, 0, 700, 0, 5);
      float p = pow(n, 5);
      float ypos = lerp(0, 200, p+10);

      stroke(0, 220, 229);
      strokeWeight(n/30);
      beginShape();
      vertex(width-x, p); 
      bezierVertex(n, p, 600-x, 600-n, x*3, height);  
      endShape();
    }

    else {
      float n = map(x, 0, 500, 0, 3);
      float p = pow(n, 5);
      float ypos = lerp(0, 100, p*0.4);

      stroke(154, 187, 255);
      strokeWeight(n/10);
      beginShape();
      vertex(x+400, p*0.4);
      bezierVertex(n/3, 400, n*1.5, x*2.6, 0, height);
      endShape();
    }
  }

// blue line



for (int x = 0; x<800; x += 3) {
  float n = norm(x, 0.0, 100.0);
  float y = pow(n, 3); 

  stroke(81, 255, 163);
  strokeWeight(n/20);
  beginShape();
  vertex(318, 376);
  bezierVertex(y-360, x+200, 800, 800-n, x+400, y+48);
  endShape();
}

// green line



for (int x=10 ; x<800; x += 4) {
  float n = norm(x, 10.0, 94.0);
  float y = pow(n, 2); 

  stroke(166, 145, 255);
  strokeWeight(n/30);
  beginShape();
  vertex(318, 376);
  bezierVertex((x/2)+100, y, n, x-80, 805-x, 460-(y*3));
  endShape();
}

// purple line
