
PFont font;

String txt = "+U0NO41tQMG6KAIqeMGowimMZUtUwajCKMExmQjBrcxtwyDBriYswSDCLMG4wbzABX3xZczBMWXMwiTBXME8wajBEfJeRzjBqYkAwklGFMGuFNTBXMGYwkDCLMEswiTBnMG8wajBPMGQwZjABT1kwillzMIkwVzBEUSowVzBEYR9gxTBrUk1fjDCSX9gwjDBmgepSBjCSYpUwUmObMFEwizBLMIkwYDBoUNUwb1b6ME9P4TBYMGZ1kTBMMG8wajBEMG4wZzBCMIswAl98WXMwbmcJMGQwZjCQMItVhGCqZi+XXjBuUgZSJTBva4YwkzBpW2ZVTzCEfUyaEzBocux6yzBXMGYwkDCLMAIwXzCedvSJmnaEMGt2+GJLMJJ27l9TMGtxwzBIUfowWU4IMGcwQjCLMAJZKzBgMEswiXb4Ykswb2ZCMGswiDCLMGh6Mlm7MGtiUzBfMIwwX2nYMGpgHTByMJIwWTCLMAJfUzCKMG5fNzBPcMgwVzBPZ2UwizBuMG8wAV98WXMwboD4MEswiX0UfIswalhKMH4wijBMTgBepjBrWRqRzzBrmNswkzBnUfowizBoMEQwdWEPVHMwZzABUjowYDBua9IwYDBugVCHVVJkMGAwbjCSVDkwTWObMFEwXzCKbXQwczBbY5swUTBfMIowWTCLMG4waDBvTjgwZ4ozMEyQVTB1MAJRdoo8YuAwazBvMF8waDByT1UwjHoLcMgwVzBPYBIwiTCMMGYwgjABUNUwb198WXMwSzCJbgUwRDCCMG4wZ4HqUgYwboF4MJJtFzBvMIwwX2nYMGpsF2MBMG4wVzBfWDRUCDBMTsqPxDBrT1WQTTCCMEIwZDBfMAJsF5rYMEQwgjBuMGtR+k8aMGQwXzBoMEQwdWEfMFgwVTB4egAwazBvjXcwVzBfT00wZzBCMIswAg-";

int x = 0;
int y = 0;

void setup() {
  size(530, 650);  
  background(0);
  smooth();

  font = loadFont("font.vlw");
  textFont(font);
  textSize(25);

  frameRate(15);
}

void draw() {
  background(0);

  fill(0, 255, 0);
  text(txt, 0, 0, width, height);

  fill(0);
  noStroke();
  //stroke(255);
  //10*25

  rect(x, (650/17)*y, width, 650/17);
  rect(0,(650/17)*(y+1), width, height);
  x += 10;
  if (x > width) {
    y++;
    x = 0;
  }
  if(y > 17){
    y = 0;
  }
}

