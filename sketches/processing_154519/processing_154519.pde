
/*
   this code from a tweet from @fun_pro
   https://twitter.com/fun_pro/status/485878013452894208
*/

int i;

void setup() {  //setup function called initially, only once
  size(900, 900);
  noStroke();
}

void draw() {  //draw function loops 
  translate(i*3%910,i*7%900);
  fill(i%90*3);
  rotate(++i);
  rect(0,0,i%90,i%89);
}
