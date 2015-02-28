
void setup() {
  size(1000, 1000);
  background(0);
  smooth();
}

void draw() {
  float a = sq(1*random(1500)); // defenierar variabeln a som 1 upphöjt i ett nummer mellan 1 och 1500
  int currentTime = millis(); // defenierar variabeln currentTime som tiden i millisekunder sketchen körts
  fill(255, 255, 255, 20);
  stroke(255, 255, 255, 0);
  quad(random(600), random(600), mouseX, mouseY, random(1000), random(1000), random(1000), random(1000));
  if (currentTime > a) { // säger att om tiden som programet körts är större än vad a blir så sätter den svart bg
    background(0);
  }  
}
