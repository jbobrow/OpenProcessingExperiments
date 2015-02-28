
void setup(){
  size(500, 500);
  smooth();
  PFont font;
  font = loadFont("BellMTBold-15.vlw");
  textFont(font, 30);
  }

void ings() {
  fill(#BFEFFF);
  textSize(35);
  textAlign(CENTER);
  if (mousePressed==true&&mouseY>100&&mouseY<250){
  float b=random(.5, 5.5);
  int a=round(b);
  if(a==1){
    text("tasting", mouseX-5, mouseY);
  }
  if(a==2){
    text("touching", mouseX-5, mouseY);
  }
  if(a==3){
    text("hearing", mouseX-5, mouseY);
  }
  if(a==4){
    text("seeing", mouseX-5, mouseY);
  }
  if(a==5){
    text("breathing", mouseX-5, mouseY);
  }}}

void poem() {
  fill(0);
  textSize(32);
  textAlign(LEFT);
  text("how should", 60, 90);
  textAlign(CENTER);
  text("any", 250, 300);
  text("human merely being", 250, 420);
  text("doubt unimaginable You?", 250, 480);
}

void dash() {
  if(mouseY>330&&mouseY<420) {
  fill(#E5E5E5);
  textSize(25);
  textAlign(CENTER);
  text("-lifted from the no of all nothing-", 250, 355);
}}

void ee() {
  if(mouseY>480&&mouseX>250) {
    fill(#FF0000);
    textSize(12);
    textAlign(RIGHT);
    text("e. e. cummings", 490, 494);
  }}

void draw() {
 background(255);
 frameRate(2);
 strokeWeight(.5);
 stroke(#BFEFFF);
 noFill();
 rect(10, 100, 480, 150);
 poem();
 ings();
 dash();
 ee();
 }

