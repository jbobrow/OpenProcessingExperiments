
color daySkyColor = #73D8F2;
color nightSkyColor = #042246;
color sunColor = #FFE200;
color moonColor = #FCFFA7;
color unlitColor = #1C1A05;
color litColor = #FFE200;
color pumpkinColor = #F5800A;
color outlineColor = #A05C28;
color stemColor = #60954A;

void setup(){
  size(600,600);
}

void draw(){
  
  //different noise values
  float noiseValueSun = noise(millis()/1000.0);
  float noiseValuePumpkin1 = noise(millis()/1031.12);
  float noiseValuePumpkin2 = noise(millis()/3110.12);
  float noiseValueTail = noise(millis()/7417.55);
  float noiseValueLegs1 = noise(millis()/1234.0);
  float noiseValueLegs2 = noise(millis()/4567.0);
  float noiseValueLegs3 = noise(millis()/8910.0);
  float noiseValueLegs4 = noise(millis()/3141.5927);
  
  background(daySkyColor);
  if (mousePressed==true){
  background(nightSkyColor);
  }
  
  //sun and moon
  float sunNoiseScale = map(noiseValueSun, 0,1,  0.75, 1.125);
  pushMatrix();
  scale(sunNoiseScale);
  
  noStroke();
  fill(sunColor);
  if (mousePressed==true){
    fill(moonColor);
  }
  ellipse(130,120, 150,150);
  if (mousePressed==true){
    fill(nightSkyColor);
    ellipse(160,110, 120,120);
  }
  popMatrix();
  
  //base pumpkin
  //float pumpkinNoiseScale1 = map(noiseValuePumpkin, 0,1, 0.8,1.1);
  float x1 = map(noiseValuePumpkin1, 0,1, -150,150);
  float y1 = map(noiseValuePumpkin2, 0,1, -150,150);
  pushMatrix();
  //scale(pumpkinNoiseScale);
  translate(x1,y1);
  
  noStroke();
  fill(stemColor);
  quad(200,200, 300,100, 340,100, 440,200);
  
  fill(pumpkinColor);
  stroke(outlineColor);
  strokeWeight(4);
  for (int i=0; i<3; i++){
    ellipse(220+i*100,330, 240,380);
  }
  ellipse(320,330, 240,380);
  
  //a cat! too spooky!
  noStroke();
  fill(unlitColor);
  
  //background
  if(mousePressed==true){
    fill(litColor);
  }
  ellipse(320,300, 320,250);
  
  //tail
  float noiseAngleTail = map(noiseValueTail, 0,1, -5,5);
  pushMatrix();
  //translate(190,150);
  rotate(radians(noiseAngleTail));
  
  fill(pumpkinColor);
  ellipse(380,300, 50,120);
  fill(unlitColor);
  if(mousePressed==true){
    fill(litColor);
  }
  ellipse(370,290, 40,70);
  popMatrix();
  
  //body and head
  fill(pumpkinColor);
  
    //head
  ellipse(260,285, 50,50);
  ellipse(245,290, 30,30);
  triangle(245,290, 250,250, 290,290);
  
    //body
  ellipse(330,330, 150,100);
  fill(unlitColor);
  if(mousePressed==true){
    fill(litColor);
  }
  ellipse(330,360, 100,70);
  
  //legs
  fill(pumpkinColor);
  
    //front legs
  float noiseAngleLeg1 = map(noiseValueLegs1, 0,1, -60,60);
  pushMatrix();
  translate(270,345);
  rotate(radians(noiseAngleLeg1));
  rect(0,0, 15,70);
  popMatrix();
  
  float noiseAngleLeg2 = map(noiseValueLegs2, 0,1, -60,60);
  pushMatrix();
  translate(260,345);
  rotate(radians(noiseAngleLeg2));
  rect(0,0, 15,70);
  popMatrix();
  
    //back legs
  float noiseAngleLeg3 = map(noiseValueLegs3, 0,1, -60,60);
  pushMatrix();
  translate(380,345);
  rotate(radians(noiseAngleLeg3));
  rect(0,0, 15,70);
  popMatrix();
  
  float noiseAngleLeg4 = map(noiseValueLegs4, 0,1, -60,60);
  pushMatrix();
  translate(390,345);
  rotate(radians(noiseAngleLeg4));
  rect(0,0, 15,70);
  popMatrix();
  
  popMatrix();

}
