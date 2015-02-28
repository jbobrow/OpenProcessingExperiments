
import ddf.minim.*;

int pos = 0;
int a=200;
int b=200;
int c=100;
int d=100;


Minim minim;
AudioPlayer drum;
AudioPlayer piano1;
AudioPlayer piano2;
AudioPlayer piano3;
AudioPlayer scratch1;
AudioPlayer scratch2;
AudioPlayer loop1;
AudioPlayer loop2;
AudioPlayer random2;
AudioPlayer random3;
AudioPlayer drumbreak;



void setup() {
  
size(800,800);
strokeWeight(4);

minim = new Minim(this);
drum = minim.loadFile("/Users/jjrabie1/Desktop/INTRO TO CREATIVE PROGRAMMING/week2/drum.wav");
piano1 = minim.loadFile("/Users/jjrabie1/Desktop/INTRO TO CREATIVE PROGRAMMING/week2/piano1.wav");
piano2 = minim.loadFile("/Users/jjrabie1/Desktop/INTRO TO CREATIVE PROGRAMMING/week2/piano2.wav");
piano3 = minim.loadFile("/Users/jjrabie1/Desktop/INTRO TO CREATIVE PROGRAMMING/week2/piano3.wav");
scratch1 = minim.loadFile("/Users/jjrabie1/Desktop/INTRO TO CREATIVE PROGRAMMING/week2/scratch1.wav");
loop1 = minim.loadFile("/Users/jjrabie1/Desktop/INTRO TO CREATIVE PROGRAMMING/week2/loop1.wav");
loop2 = minim.loadFile("/Users/jjrabie1/Desktop/INTRO TO CREATIVE PROGRAMMING/week2/loop2.wav");
random2 = minim.loadFile("/Users/jjrabie1/Desktop/INTRO TO CREATIVE PROGRAMMING/week2/random2.wav");
random3 = minim.loadFile("/Users/jjrabie1/Desktop/INTRO TO CREATIVE PROGRAMMING/week2/random3.wav");
drumbreak = minim.loadFile("/Users/jjrabie1/Desktop/INTRO TO CREATIVE PROGRAMMING/week2/drumbreak.wav");


drum.play();
drum.loop();

 
}



void draw() {
  
  background(255);
  pos = drum.position();
  
  fill(100);
  for (a = 200; a < width; a = a+200) {
  for (b = 200; b< height; b= b+200){
  ellipse(a, b, c, d);

 if (mouseX<275 && mouseY<275 && mouseX>115 && mouseY>115 ) {
   fill(255,255,0);
ellipse(200,200,150,150); 
if (100<pos && pos<200){
  piano1.play(); }}
fill(100);

 if (mouseX<475 && mouseY<275 && mouseX>315 && mouseY>115 ) {
   fill(255,255,0);
ellipse(400,200,150,150);
if (100<pos && pos<200){
  piano2.play(); }}
fill(100);

 if (mouseX<675 && mouseY<275 && mouseX>515 && mouseY>115 ) {
   fill(255,255,0);
ellipse(600,200,150,150);
if (100<pos && pos<200){
  piano3.play(); }}
fill(100);

 if (mouseX<275 && mouseY<475 && mouseX>115 && mouseY>315 ) {
   fill(255,255,0);
ellipse(200,400,150,150);
if (100<pos && pos<200){
  scratch1.play(); }}
fill(100);

 if (mouseX<475 && mouseY<475 && mouseX>315 && mouseY>315 ) {
   fill(255,255,0);
ellipse(400,400,150,150); 
if (100<pos && pos<200){
  loop1.play(); }}
fill(100);

 if (mouseX<675 && mouseY<475 && mouseX>515 && mouseY>315 ) {
   fill(255,255,0);
ellipse(600,400,150,150);
if (100<pos && pos<200){
  loop2.play(); }}
fill(100);

 if (mouseX<275 && mouseY<675 && mouseX>115 && mouseY>515 ) {
   fill(255,255,0);
ellipse(200,600,150,150); 
if (100<pos && pos<200){
  random2.play(); }}
fill(100);

 if (mouseX<475 && mouseY<675 && mouseX>315 && mouseY>515 ) {
   fill(255,255,0);
ellipse(400,600,150,150); 
if (100<pos && pos<200){
  random3.play(); }}
fill(100);

 if (mouseX<675 && mouseY<675 && mouseX>515 && mouseY>515 ) {
   fill(255,255,0);
ellipse(600,600,150,150);
if (100<pos && pos<200){
  drum.pause();
  drumbreak.play(); }}
fill(100);




}
}
}

void stop()
{
  drum.close();

  minim.stop();
  
  super.stop();
}

