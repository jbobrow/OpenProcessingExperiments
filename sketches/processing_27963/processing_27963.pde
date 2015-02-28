
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
AudioPlayer song2;
AudioPlayer song3;
AudioPlayer song4;
AudioPlayer song5;
AudioPlayer song6;
AudioPlayer song7;



void setup() {


size(500,500);

minim = new Minim(this);
song = minim.loadFile ("Short Minor.aif");
song2 = minim.loadFile ("Blue Major.aif");
song3 = minim.loadFile ("Red Yellow.aif");
song4 = minim.loadFile ("High Low One.aif");
song5 = minim.loadFile ("Green.aif");
song6 = minim.loadFile ("First.aif");
song7 = minim.loadFile ("Yellow Red.aif");


}

void draw() {

noCursor();

smooth();

background(255);


//Ellipses

noStroke();

fill(143,192,189);
ellipse(mouseX, mouseY,100, 100);

boolean o = mouseX<50;
if (o == true && !song6.isPlaying())
{ 
song6.loop(0);

}

boolean m = mouseX>50 && mouseX<100;
if (m == true && !song4.isPlaying())
{ 
song4.loop(0);

}

boolean a = mouseX<50;
if(a == true) {
fill (170,160,160);
ellipse(mouseX,mouseY,160,160);

}

//Section One

//Music

boolean z = mouseX>100 && mouseX<150;
if (z == true && !song.isPlaying())
{ 
song.loop(0);

}

//Visuals

boolean b = mouseX>100 && mouseX<150;
if(b == true) {
fill(73,73,73);
ellipse(mouseX,mouseY,120,120);
} else {
fill(132,156,170);
ellipse(mouseX,mouseY,100,100);


}

//Section Two

//Music

boolean y = mouseX>150 && mouseX<250;
if (y == true && !song2.isPlaying())
{ 
song2.loop(0);


}

//Visuals

boolean c = mouseX<150;
if(c == true) {
fill(237,240,174);
ellipse(mouseX,mouseY,80,80);

} else {
fill(180,198,178);
ellipse(mouseX,mouseY,50,50);

}


//Section Three

//Music


//Visuals

boolean d = mouseX>250 && mouseX<350;
if(d == true) {
fill(255);
ellipse(mouseX,mouseY,80,80);
fill(87,37,37);
ellipse(mouseX,mouseY,50,50);

} else {
fill(45,31,47);
ellipse(mouseX,mouseY,30,30);

}

//Section Four




boolean e = mouseX>250 && mouseX<350;
if(e == true) {
noStroke();
fill(255);
ellipse(mouseX,mouseY,130, 130);
}


//Section Five



boolean f = mouseX>350 && mouseX<420;
if(f == true) {
fill(237,240,174);
ellipse(mouseX,mouseY,180,180);
fill(87,37,37);
ellipse(mouseX, mouseY, 40,40);
}

else {
fill(45,31,47);
ellipse(mouseX,mouseY,30,30);

}

//Section Six

boolean x = mouseX>250 && mouseX<350;
if (x == true && !song3.isPlaying())
{ 
song3.loop(0);

}

boolean p = mouseX>350 && mouseX<420;
if (p == true && !song7.isPlaying())
{ 
song7.loop(0);
}


boolean g = mouseX>420;
if(g == true) {
fill(255);
ellipse(mouseX, mouseY, 110,110);
fill(137,140,174);
ellipse(mouseX,mouseY,30,30);
fill(255);
ellipse(mouseX, mouseY, 20,20);
fill(180,190,150);
ellipse(mouseX, mouseY, 10,10);

}

//Section Seven

boolean n = mouseX>420;
if (n == true && !song5.isPlaying())
{ 
song5.loop(0);
}


boolean h = mouseX>420;
if(h == true){

fill(255);
ellipse(mouseX, mouseY, 110,110);

fill(255);
ellipse(mouseX, mouseY, 20,20);
fill(180,199,150);
ellipse(mouseX, mouseY, 80,80);
}



}

