
/* Hello there, before we begin
 I'd like to write a couple of 
things.I love this course, I 
sincerally do, and I was 
heart-broken when I was 
informed that I couldn't
have acess to a computer, but I 
didn't give up, I downloaded
this processing app, but 
unfortunally it doesn't support
 maxim, so my piano won't have 
 sound. Hope you understand
  this. :-) */

void setup()
{
  size(700,400); //this means that the screen is the size of the tablet's screen
  background(200,200,225);
}
void draw()
{// here we start drawing my little piano
  fill(255,255,255);
  rect(100,150,80,250);
  rect(180,150,80,250);
  rect(260,150,80,250);
  rect(340,150,80,250);
  rect(420,150,80,250);
  rect(500,150,80,250);
  rect(580,150,80,250);
  fill(0,0,0);
  rect(160,150,40,125);
  rect(240,150,40,125);
  rect(320,150,40,125);
  rect(480,150,40,125);
  rect(560,150,40,125);
}

void mousePressed()
{// until here the piano keys didn't do anything, but now they will change the backgrond
// I'd love to see my piano really play music, if someone want to use the code and make this piano play
// please leave it on the comments/feedback :-) 
    if((mouseX > 100 && mouseY > 150 && mouseX< 160 && mouseY< 275) || (mouseX > 100 && mouseY >275 && mouseX<160 && mouseY<400)){
    background(0,138,189);}
    if((mouseX > 200 && mouseY > 150 && mouseX< 240 && mouseY< 275) || (mouseX > 180 && mouseY >275 && mouseX<260 && mouseY<400)){
    background(153,51,51);}
    if((mouseX > 280 && mouseY > 150 && mouseX< 320 && mouseY< 275) || (mouseX > 260 && mouseY >275 && mouseX<340 && mouseY<400)){
    background(255,204,51);}
    if((mouseX > 360 && mouseY > 150 && mouseX< 420 && mouseY< 275) || (mouseX > 340 && mouseY >275 && mouseX<420 && mouseY<400)){
    background(34,139,34);}
    if((mouseX > 420 && mouseY > 150 && mouseX< 480 && mouseY< 275) || (mouseX > 420 && mouseY >275 && mouseX<500 && mouseY<400)){
    background(255,69,0);}
    if((mouseX > 520 && mouseY > 150 && mouseX< 560 && mouseY< 275) || (mouseX > 500 && mouseY >275 && mouseX<580 && mouseY<400)){
    background(250,100,80);}
    if((mouseX > 600 && mouseY > 150 && mouseX< 660 && mouseY< 275) || (mouseX > 580 && mouseY >275 && mouseX<660 && mouseY<400)){
    background(255,128,114);}
    if(mouseX > 160 && mouseY > 150 && mouseX< 200 && mouseY< 275){
    background(161,202,241);}
    if(mouseX > 240 && mouseY > 150 && mouseX< 280 && mouseY< 275){
    background(204,51,51);}
    if(mouseX > 320 && mouseY > 150 && mouseX< 360 && mouseY< 275){
    background(255,255,122);}
    if(mouseX > 480 && mouseY > 150 && mouseX< 520 && mouseY< 275){
    background(238,188,33);}
    if(mouseX > 560 && mouseY > 150 && mouseX< 600 && mouseY< 275){
    background(127,255,0);}
}
// this app creates an apk if we press the play button, unfortunally you won't be able to see which key I'll
// press, but if you want I'll leave the code on the forum
