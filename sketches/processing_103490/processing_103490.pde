
import themidibus.*; 

MidiBus myBus; 

  
  
void setup(){
  background(0);
size(600, 800);
frameRate(100);
  MidiBus.list(); 
  myBus = new MidiBus(this, -1, "Java Sound Synthesizer"); 

}
void draw(){
  fill(0);
  ellipse(130, 60, 100, 100);
  fill(0);
  ellipse(500, 60, 100, 100);
  fill(0);
  ellipse(100, 400, 80, 80);
  fill(0);
  ellipse(400, 238, 90, 90);
  fill(0);
  ellipse(500, 700, 130, 130);
  fill(0);
  ellipse(259, 567, 95, 95);
  fill(0);
  ellipse(489, 540, 110, 110);
  fill(0);
  ellipse(236, 450, 80, 80);
  fill(0);
  ellipse(300, 400, 75, 75);
  fill(0);
  ellipse(195, 379, 105, 105);
  fill(0);
  ellipse(420, 50, 80, 80);
  fill(0);
  ellipse(30, 770, 40, 40);
  fill(0);
  ellipse(370, 70, 70, 70);
  fill(0);
  ellipse(300, 400, 60, 60);
  fill(0);
  ellipse(60, 50, 120, 120);
  fill(0);
  ellipse(425, 625, 145, 145);
  fill(0);
  ellipse(420, 620, 50, 50);
  fill(0);
  ellipse(250, 500, 90, 90);
  fill(0);
  ellipse(430, 340, 30, 30);
  fill(0);
  ellipse(300, 740, 110, 100);
  fill(0);
  ellipse(550, 400, 30, 30);
  fill(0);
  ellipse(430, 220, 90, 90);
  fill(0);
  ellipse(50, 350, 120, 120);
  fill(0);
  ellipse(400, 675, 30, 30);
  fill(0);
  ellipse(95, 740, 90, 90);
  fill(0);
  ellipse(550, 75, 60, 60);
  fill(0);
  ellipse(300, 400, 140, 140);
  fill(0);
  ellipse(250, 110, 20, 20);
  
  int channel = 0;
  int pitch= 95;
  int velocity= 127;
  int pitch1= 50;
  int velocity1= 127;
  int pitch2= 80;
  int velocity2= 130;
  int pitch3=32;
  int velocity3= 110;
  int pitch4= 23;
  int velocity4= 113;
  int pitch5= 46;
  int velocity5= 120;
  int pitch6= 15;
  int velocity6= 130;
  int pitch7= 71;
  int velocity7= 127;
  int pitch8= 87;
  int velocity8= 100;
  int pitch9= 37;
  int velocity9= 132;
  int pitch10= 109;
  int velocity10= 100;
  int pitch11= 102;
  int velocity11= 112;
  int pitch12= 118;
  int velocity12= 90;
  int pitch13= 19;
  int velocity13= 100;
  int pitch14= 20;
  int velocity14= 20;
  int pitch15= 79;
  int velocity15= 135;
  int pitch16= 113;
  int velocity16= 127;
  int pitch17= 55;
  int velocity17= 110;
  int pitch18=132;
  int velocity18= 115;
  int pitch19= 68;
  int velocity19= 120;
  int pitch20= 29;
  int velocity20= 130;
  int pitch21= 92;
  int velocity21= 119;
  int pitch22= 22;
  int velocity22= 123;
  int pitch23= 86;
  int velocity23= 127;
  int pitch24= 34;
  int velocity24= 130;
  int pitch25= 99;
  int velocity25= 134;

  int number = 0;
  int value = 0;
  myBus.sendControllerChange(channel, number, value); // Send a controllerChange
  delay(0);
if(keyPressed==true) {
  if(key=='z')
{
  fill(random(255), 180, 255, 200);
  noStroke();
  ellipse(130, 60, 100, 100);
  myBus.sendNoteOn(channel, pitch, velocity); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch, velocity); // Send a Midi nodeOff
  
}
if (key == 'a')
{
  fill(random(255), 255, 89, 124);
  noStroke();
  ellipse(500, 60, 80, 80);
  myBus.sendNoteOn(channel, pitch1, velocity1); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch1, velocity1); // Send a Midi nodeOff
  
}
if(key == 'q')
{
  fill(random(255), 200, 180, 240);
  noStroke();
  ellipse(100, 400, 80, 80);
  myBus.sendNoteOn(channel, pitch2, velocity2); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch2, velocity2); // Send a Midi nodeOff
  
  
}
if(key == 'w')
{
  fill(random(255), 200, 195, 175);
  noStroke();
  ellipse(400, 238, 90, 90);
  myBus.sendNoteOn(channel, pitch3, velocity3); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch3, velocity3); // Send a Midi nodeOff
  
}
if(key == 's')
{
  fill(random(255), 199, 255, 200);
  noStroke();
  ellipse(500, 700, 130, 130);
  myBus.sendNoteOn(channel, pitch4, velocity4); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch4, velocity4); // Send a Midi nodeOff
  
}
if(key=='x')
{
  fill(random(255), 200, 199, 198);
  noStroke();
  ellipse(259, 567, 95, 95);
  myBus.sendNoteOn(channel, pitch5, velocity5); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch5, velocity5); // Send a Midi nodeOff
  
}
if(key=='e')
{
  fill(random(255), 248, 197, 139);
  noStroke();
  ellipse(489, 540, 110, 110);
  myBus.sendNoteOn(channel, pitch6, velocity6); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch6, velocity6); // Send a Midi nodeOff
  
}
if(key=='d')
{
  fill(random(255), 156, 201, 116);
  noStroke();
  ellipse(236, 450, 80, 80);
  myBus.sendNoteOn(channel, pitch7, velocity7); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch7, velocity7); // Send a Midi nodeOff
  
}
if(key=='c')
{
  fill(random(255), 213, 99, 197);
  noStroke();
  ellipse(300, 400, 75, 75);
  myBus.sendNoteOn(channel, pitch8, velocity8); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch8, velocity8); // Send a Midi nodeOff
  
}
if(key=='r')
{
  fill(random(255), 255, 240, 230);
  noStroke();
  ellipse(195, 379, 105, 105);
  myBus.sendNoteOn(channel, pitch9, velocity9); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch9, velocity9); // Send a Midi nodeOff
  
}
if(key=='f')
{
  fill(random(255), 89, 255, 255);
  noStroke();
  ellipse(30, 770, 40, 40);
  myBus.sendNoteOn(channel, pitch10, velocity10); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch10, velocity10); // Send a Midi nodeOff
  
}
if(key=='v')
{
  fill(random(255), 255, 150, 255);
  noStroke();
  ellipse(370, 70, 70, 70);
  myBus.sendNoteOn(channel, pitch11, velocity11); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch11, velocity11); // Send a Midi nodeOff
  
}
if(key=='t')
{
  fill(random(255), 255, 255, 167);
  noStroke();
  ellipse(300, 400, 60, 60);
  myBus.sendNoteOn(channel, pitch12, velocity12); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch12, velocity12); // Send a Midi nodeOff
  
}
if(key=='g')
{
  fill(random(255), 255,0,255);
  noStroke();
  ellipse(60, 50, 120, 120);
  myBus.sendNoteOn(channel, pitch13, velocity13); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch13, velocity13); // Send a Midi nodeOff
  
}
if(key=='b')
{
  fill(random(255), 169, 169, 255);
  noStroke();
  ellipse(425, 625, 145, 145);
  myBus.sendNoteOn(channel, pitch14, velocity14); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch14, velocity14); // Send a Midi nodeOff
  
}
if(key=='y')
{
  fill(random(255), 150, 255, 180);
  noStroke();
  ellipse(250, 500, 90, 90);
  myBus.sendNoteOn(channel, pitch15, velocity15); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch15, velocity15); // Send a Midi nodeOff
  
}
if(key=='h')
{
  fill(random(200), 255, 130, 255);
  noStroke();
  ellipse(430, 340, 30, 30);
  myBus.sendNoteOn(channel, pitch16, velocity16); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch16, velocity16); // Send a Midi nodeOff
  
}
if(key=='n')
{
  fill(random(180), 180, 200, 220);
  noStroke();
  ellipse(300, 740, 110, 100);
  myBus.sendNoteOn(channel, pitch17, velocity17); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch17, velocity17); // Send a Midi nodeOff
  
}
if(key=='u')
{
  fill(random(200), 180, 160, 266);
  noStroke();
  ellipse(550, 400, 30, 30);
  myBus.sendNoteOn(channel, pitch18, velocity18); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch18, velocity18); // Send a Midi nodeOff
  
}
if(key=='j')
{
  fill(random(200), 140, 180, 255);
  noStroke();
  ellipse(430, 220, 90, 90);
  myBus.sendNoteOn(channel, pitch19, velocity19); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch19, velocity19); // Send a Midi nodeOff
  
}
if(key=='o')
{
  fill(random(180), 200, 220, 220);
  noStroke();
  ellipse(50, 350, 120, 120);
  myBus.sendNoteOn(channel, pitch20, velocity20); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch20, velocity20); // Send a Midi nodeOff
  
}
if(key=='l')
{
  fill(random(180), 255, 255, 180);
  noStroke();
  ellipse(400, 675, 35, 35);
  myBus.sendNoteOn(channel, pitch21, velocity21); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch21, velocity21); // Send a Midi nodeOff
  
}
if(key=='m')
{
  fill(random(255), 120, 120, 255);
  noStroke();
  ellipse(95, 740, 90, 90);
  myBus.sendNoteOn(channel, pitch22, velocity22); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch22, velocity22); // Send a Midi nodeOff
  
}
if(key=='i')
{
  fill(random(255), 90, 199, 201);
  noStroke();
  ellipse(550, 75, 60, 60);
  myBus.sendNoteOn(channel, pitch23, velocity23); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch23, velocity23); // Send a Midi nodeOff
  
}
if(key=='k')
{
  fill(random(255), 200, 200, 200);
  noStroke();
  ellipse(300, 400, 140, 140);
  myBus.sendNoteOn(channel, pitch24, velocity24); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch24, velocity24); // Send a Midi nodeOff
  
}
if(key=='p')
{
  fill(random(255), 190, 199, 209);
  noStroke();
  ellipse(250, 110, 20, 20);
  myBus.sendNoteOn(channel, pitch25, velocity25); // Send a Midi noteOn
  delay(0);
  myBus.sendNoteOff(channel, pitch25, velocity25); // Send a Midi nodeOff
  
}
}
}
