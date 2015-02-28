
float m = 100, d = 100, f = 10;
long seed = 0;

float[] oldF = new float[20];

void setup() {
  size(500,500);
  
  stroke(0);
  noFill();
  
  noiseSeed(seed);
  
  textFont(createFont("Roboto Black",24,true));
}

void draw() {
  background(255);
  
  noFill();
  beginShape();
  for(float t=0; t < TWO_PI*40; t+=0.1) {
    float r = cos((t/d)*m)+(t/f);
    float x = cos(t)*r*oldF[0];
    float y = sin(t)*r*oldF[0];
    vertex(x+width/2,y+height/2);
  }
  endShape();
  
  m += noise(frameCount/300f,0)-0.5;
  d += noise(frameCount/300f,10)-0.5;
  f += (noise(frameCount/300f,20)-0.5)/10;
  
  while(m <= 0) {m += 100;}
  while(d <= 0) {d += 100;}
  while(f <= 0) {f += 100;}
  
  fill(0);
  text(nf(m,3,3)+"m "+
       nf(d,3,3)+"d "+
       nf(f,3,3)+"f "+
       seed+"s"
       ,5,20);
  
  for(int i=1; i < oldF.length; i++) {
    oldF[i-1] = oldF[i];
  }
  oldF[oldF.length-1] = f/1.5;
}

void keyPressed() {
  if(key == '`') {
    seed++;
    noiseSeed(seed);
  } else if(key >= '1' && key <= '4') {
    m += (key-48)*5;
  } else if(key >= '5' && key <= '8') {
    d += (key-52)*5;
  } else if(key == '\'') {
    saveFrame(m+"m"+d+"d"+f+"f"+seed+"s.png");
  } else {
    m = d = 100;
    f = 10;
    seed = 0;
  }
}

