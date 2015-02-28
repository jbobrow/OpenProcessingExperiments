
int I,W=5500;void draw(){noiseDetail(2,0.35);smooth();noFill();while(++I%9>0){float i=0.01*I;stroke(0,0,200,255*noise(i/4));point(I%W/7+noise(i+W)*99,I/W*40+20-sq(noise(i)*14-4)+50*noise(i/9));}}

