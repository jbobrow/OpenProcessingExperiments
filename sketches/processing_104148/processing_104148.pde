
int time = 0;
 
void setup(){
  size(900, 900);
  noFill();
  stroke(360 );
  colorMode(RGB, 360);
}
 
void draw(){
  background(0);


  for(int i = 0; i < 360; i+= random(-5,10)){
    float x = cos(radians(i)) * 400 + width / 2;
    float y = sin(radians(time + i)) * 600/PI + height / 2;
    float w = cos(radians(time + i)) * 4;
    w = abs(w);
      
    stroke(i*22, i, 255, time);
    ellipse(x, y, w, w);
    ellipse(x, y, w*3, w*3);
    ellipse(y, x, w, w);
    ellipse(y, x, w*3, w*3);
    stroke(i*2, i, 255, time/30);
    ellipse(x, y, w*2, w*2);
    ellipse(y, x, w*2, w*2);

    stroke(i*22, i, 255, time/60);
    ellipse(y, x, w*6, w*6);
    ellipse(x, y, w*6, w*6);
  }
   for(int i = 0; i < 360; i+= random(-5,10)){
    float r = cos(radians(i)) * 400 + width / 2;
    float s = sin(radians(time + i)) * -600/PI + height / 2;
    float t = cos(radians(time + i)) * 6;
    t = abs(t);
    stroke(i*22, i, 255, time);
    ellipse(r, s, t, t);
    ellipse(r, s, t*3, t*3);
    ellipse(s, r, t, t);
    ellipse(s, r, t*3, t*3);
    stroke(i*2, i, 255, time/80);
    ellipse(r, s, t*2, t*2);
    ellipse(s, r, t*2, t*2);

    stroke(i*22, i, 255, time/160);
    ellipse(s, r, t*6, t*6);
    ellipse(r, s, t*6, t*6);
  }

   for(int i = 0; i < 360; i+= random(-1,55)){
    float r = cos(radians(i)) * 100 + width / 2;
    float s = sin(radians(time + i)) * 100/PI + height / 2;
    float t = cos(radians(time + i)) * 6;
    t = abs(t);
    stroke(i*22, i, 255, time/10);
    ellipse(r, s, t, t);
    ellipse(r, s, t*3, t*3);
    ellipse(s, r, t, t);
    ellipse(s, r, t*3, t*3);
    stroke(i*2, i, 255, time/40);
    ellipse(r, s, t*2, t*2);
    ellipse(s, r, t*2, t*2);

    stroke(i*22, i, 255, time/80);
    ellipse(s, r, t*16, t*16);
    ellipse(r, s, t*16, t*16);
  }
     for(int i = 0; i < 360; i+= random(-1,15)){
    float r = cos(radians(i)) * 100 + width / 2;
    float s = sin(radians(time + i)) * -100/PI + height / 2;
    float t = cos(radians(time + i)) * 6;
    t = abs(t);
    stroke(i*22, i, 255, time/10);
    ellipse(r, s, t, t);
    ellipse(r, s, t*3, t*3);
    ellipse(s, r, t, t);
    ellipse(s, r, t*3, t*3);
    stroke(i*2, i, 255, time/40);
    ellipse(r, s, t*2, t*2);
    ellipse(s, r, t*2, t*2);

    stroke(i*22, i, 255, time/80);
    ellipse(s, r, t*16, t*16);
    ellipse(r, s, t*16, t*16);
  }
  println(i);

  time++;
}
