
size(512,512);
translate(width/2, height/2);
background(64);
smooth();

noStroke();
fill(255,0,0);
arc(0, 0, 300, 300, PI / 2, 3 * PI / 2);

fill(0,0,255);
arc(0, 0, 300, 300, -PI / 2 , PI / 2);

fill(255,0,0);
beginShape();
  vertex(0,126);
  vertex(44,126);
  vertex(44,-24);
  vertex(104,-24);
  vertex(104,-100);
  vertex(0,-100);
endShape(CLOSE);

fill(0,0,255);
beginShape();
  vertex(0,126);
  vertex(-44,126);
  vertex(-44,-24);
  vertex(-104,-24);
  vertex(-104,-100);
  vertex(0,-100);
endShape(CLOSE);

