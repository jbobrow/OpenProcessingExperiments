
void setup() {
  setupAudio();
  
  size(500, 600); 
  background(0, 200, 100);
}



void draw()
{
  getVolume();
  background(0, 200, 100);
  float colorShift = map (volume,0,255,50,0);
  float eyeBM=map(volume,0,255,0,25);
  float eye=map(volume,0,255,0,25);
  float mouthMove=map(volume,0,255,0,25);
  
  ellipse(250,250,300,400);
  fill(255-colorShift,100,100);
  ellipse(175,225,25+eye,25+eye);
  ellipse(325,225,25+eye,25+eye);
  fill(255);
  
  line(160-eyeBM,192-eyeBM,190+eyeBM,200-eyeBM);
  line(160-eyeBM,182-eyeBM,190+eyeBM,190-eyeBM);
  line(160-eyeBM,187-eyeBM,190+eyeBM,195-eyeBM);
  line(160-eyeBM,177-eyeBM,190+eyeBM,185-eyeBM);
  line(310-eyeBM,200-eyeBM,340+eyeBM,192-eyeBM);
  line(310-eyeBM,190-eyeBM,340+eyeBM,182-eyeBM);
  line(310-eyeBM,195-eyeBM,340+eyeBM,187-eyeBM);
  line(310-eyeBM,185-eyeBM,340+eyeBM,177-eyeBM);
  
  rect(150,450,200,450);
 
  
  
}

