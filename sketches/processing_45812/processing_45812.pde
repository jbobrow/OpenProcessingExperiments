
float fuzzy = 0.0;

void setup(){
  size(640,360);
  background(#f6f3ec);
}

void draw(){
    if (fuzzy < 200.0) {
    fuzzy += 0.005;
}
  /* taupe*/
  fill(#50463c);
  noStroke();
  smooth();
  beginShape();
  vertex(404, 138);
  vertex(274, 188);
  vertex(280, 177);
  vertex(417, 315);
  vertex(404, 149);
  vertex(0, 0);
  endShape();
  
  
  /* taupe*/
  fill(#aa8f81);
  noStroke();
  smooth();
  beginShape();
  vertex(0, 0);
  vertex(440, 0);
  vertex(540, 73);
  vertex(118, 216);
  vertex(20, 147);
  vertex(0, 0);
  endShape();
  
  /* blanc*/
  fill(#ffffff);
  stroke(#cfc0b1);
  smooth();
  beginShape();
  vertex(384, 25);
  vertex(397, 32);
  vertex(528, 0);
  vertex(484, 0);
  vertex(384, 25);
  endShape();
  
   /* rouge*/
  fill(#dc3433);
  noStroke();
  smooth();
  beginShape();
  vertex(397, 32);
  vertex(528, 0);
  vertex(560, 0);
  vertex(398, 43);
  vertex(397, 32);
  endShape();
  
  /* blanc*/
  fill(#ffffff);
  noStroke();
  smooth();
  beginShape();
  vertex(384, 25);
  vertex(397, 32);
  vertex(398, 43);
  vertex(385,36);
  vertex(385, 25);
  endShape();
  
  /*jaune pale*/
  fill(#e2cf8e);
  noStroke();
  smooth();
  beginShape();
  vertex(540, 73);
  vertex(540, 101);
  vertex(118, 254);
  vertex(118, 216);
  endShape();
  
  /*anthracite*/
  fill(#353332);
  noStroke();
  smooth();
  beginShape();
  vertex(118, 216);
  vertex(118, 254);
  vertex(0, 169);
  vertex(0, 130);
  endShape();
  
   /*anthracite*/
  noFill();
  stroke(#cfc0b1);
  smooth();
  beginShape();
  vertex(415, 315);
  vertex(436, 306);
  vertex(423, 143);
  vertex(402, 152);
  endShape();
  
    /* Bleu */
  fill(#628dc1);
  noStroke();
  smooth();
  beginShape();
  vertex(0, 0);
  vertex(325, 0);
  vertex(350, 71);
  vertex(0, 153);
  vertex(0, 0);
  endShape();
  
  /* Rouge */
  fill(#dc3433);
  noStroke();
  smooth();
  beginShape();
  vertex(640, 221);
  vertex(551, 231);
  vertex(618, 360);
  vertex(640, 360);
  endShape();
  
    filter(BLUR, fuzzy*random(0,15));
}
