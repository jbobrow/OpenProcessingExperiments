
import ddf.minim.*;
Minim minim;
AudioPlayer song;
int[]y;


void setup() {
  size(1000, 750);
  minim = new Minim(this);
  song = minim.loadFile("Disorder.mp3", 1000);
  song.play();
  
}
void draw() {
  background(0);
  stroke(255);
 
  for (int i = 600; i < song.bufferSize() - 199; i++) {
    line(i, song.left.get(i)*5+50, i+1, song.left.get(i+1)*5+50);
    line(i, song.right.get(i)*5+70, i+1, song.right.get(i+1)*5+70);
    line(i, song.left.get(i)*5+90, i+1, song.left.get(i+1)*5+90);
    line(i, song.right.get(i)*5+110, i+1, song.right.get(i+1)*5+110);
    line(i, song.left.get(i)*5+130, i+1, song.left.get(i+1)*5+130);
    line(i, song.right.get(i)*5+150, i+1, song.right.get(i+1)*5+150);
    line(i, song.left.get(i)*5+170, i+1, song.left.get(i+1)*5+170);
    line(i, song.right.get(i)*5+190, i+1, song.right.get(i+1)*5+190);
    line(i, song.left.get(i)*5+210, i+1, song.left.get(i+1)*5+210);
    line(i, song.right.get(i)*5+230, i+1, song.right.get(i+1)*5+230);
    line(i, song.left.get(i)*5+250, i+1, song.left.get(i+1)*5+250);
    line(i, song.right.get(i)*5+270, i+1, song.right.get(i+1)*5+270);
    line(i, song.left.get(i)*5+290, i+1, song.left.get(i+1)*5+290);
    line(i, song.right.get(i)*5+310, i+1, song.right.get(i+1)*5+310);
    line(i, song.left.get(i)*5+330, i+1, song.left.get(i+1)*5+330);
    line(i, song.right.get(i)*5+350, i+1, song.right.get(i+1)*5+350);
    line(i, song.left.get(i)*5+370, i+1, song.left.get(i+1)*5+370);
    line(i, song.right.get(i)*5+390, i+1, song.right.get(i+1)*5+390);
    line(i, song.left.get(i)*5+410, i+1, song.left.get(i+1)*5+410);
    line(i, song.right.get(i)*5+430, i+1, song.right.get(i+1)*5+430);
    line(i, song.left.get(i)*5+450, i+1, song.left.get(i+1)*5+450);
    line(i, song.right.get(i)*5+470, i+1, song.right.get(i+1)*5+470);
    line(i, song.left.get(i)*5+490, i+1, song.left.get(i+1)*5+490);
    line(i, song.right.get(i)*5+510, i+1, song.right.get(i+1)*5+510);
    line(i, song.left.get(i)*5+530, i+1, song.left.get(i+1)*5+530);
    line(i, song.right.get(i)*5+550, i+1, song.right.get(i+1)*5+550);
    line(i, song.left.get(i)*5+570, i+1, song.left.get(i+1)*5+570);
    line(i, song.right.get(i)*5+590, i+1, song.right.get(i+1)*5+590);
    line(i, song.left.get(i)*5+610, i+1, song.left.get(i+1)*5+610);
    line(i, song.right.get(i)*5+630, i+1, song.right.get(i+1)*5+630);
    line(i, song.left.get(i)*5+650, i+1, song.left.get(i+1)*5+650);
    line(i, song.right.get(i)*5+670, i+1, song.right.get(i+1)*5+670);
  }
  
  
  for (int i = 400; i < song.bufferSize() - 399; i++) {
    
   line(i, song.left.get(i)*80+50, i+1, song.left.get(i+1)*80+50);
    line(i, song.right.get(i)*30+70, i+1, song.right.get(i+1)*30+70);
    line(i, song.left.get(i)*90+90, i+1, song.left.get(i+1)*90+90);
    line(i, song.right.get(i)*25+110, i+1, song.right.get(i+1)*25+110);
    line(i, song.left.get(i)*45+130, i+1, song.left.get(i+1)*45+130);
    line(i, song.right.get(i)*75+150, i+1, song.right.get(i+1)*75+150);
    line(i, song.left.get(i)*43+170, i+1, song.left.get(i+1)*43+170);
    line(i, song.right.get(i)*160+190, i+1, song.right.get(i+1)*160+190);
    line(i, song.left.get(i)*87+210, i+1, song.left.get(i+1)*87+210);
    line(i, song.right.get(i)*54+230, i+1, song.right.get(i+1)*54+230);
    line(i, song.left.get(i)*46+250, i+1, song.left.get(i+1)*46+250);
    line(i, song.right.get(i)*88+270, i+1, song.right.get(i+1)*88+270);
    line(i, song.left.get(i)*60+290, i+1, song.left.get(i+1)*60+290);
    line(i, song.right.get(i)*60+310, i+1, song.right.get(i+1)*60+310);
    line(i, song.left.get(i)*90+330, i+1, song.left.get(i+1)*90+330);
    line(i, song.right.get(i)*60+350, i+1, song.right.get(i+1)*60+350);
    line(i, song.left.get(i)*60+370, i+1, song.left.get(i+1)*60+370);
    line(i, song.right.get(i)*140+390, i+1, song.right.get(i+1)*140+390);
    line(i, song.left.get(i)*53+410, i+1, song.left.get(i+1)*53+410);
    line(i, song.right.get(i)*60+430, i+1, song.right.get(i+1)*60+430);
    line(i, song.left.get(i)*71+450, i+1, song.left.get(i+1)*71+450);
    line(i, song.right.get(i)*60+470, i+1, song.right.get(i+1)*60+470);
    line(i, song.left.get(i)*60+490, i+1, song.left.get(i+1)*60+490);
    line(i, song.right.get(i)*60+510, i+1, song.right.get(i+1)*60+510);
    line(i, song.left.get(i)*60+530, i+1, song.left.get(i+1)*60+530);
    line(i, song.right.get(i)*60+550, i+1, song.right.get(i+1)*60+550);
    line(i, song.left.get(i)*63+570, i+1, song.left.get(i+1)*63+570);
    line(i, song.right.get(i)*60+590, i+1, song.right.get(i+1)*60+590);
    line(i, song.left.get(i)*69+610, i+1, song.left.get(i+1)*69+610);
    line(i, song.right.get(i)*77+630, i+1, song.right.get(i+1)*77+630);
    line(i, song.left.get(i)*54+650, i+1, song.left.get(i+1)*54+650);
    line(i, song.right.get(i)*58+670, i+1, song.right.get(i+1)*58+670);
  }
  
  for (int i = 200; i < song.bufferSize() - 599; i++) {
    
    line(i, song.left.get(i)*5+50, i+1, song.left.get(i+1)*5+50);
    line(i, song.right.get(i)*5+70, i+1, song.right.get(i+1)*5+70);
    line(i, song.left.get(i)*5+90, i+1, song.left.get(i+1)*5+90);
    line(i, song.right.get(i)*5+110, i+1, song.right.get(i+1)*5+110);
    line(i, song.left.get(i)*5+130, i+1, song.left.get(i+1)*5+130);
    line(i, song.right.get(i)*5+150, i+1, song.right.get(i+1)*5+150);
    line(i, song.left.get(i)*5+170, i+1, song.left.get(i+1)*5+170);
    line(i, song.right.get(i)*5+190, i+1, song.right.get(i+1)*5+190);
    line(i, song.left.get(i)*5+210, i+1, song.left.get(i+1)*5+210);
    line(i, song.right.get(i)*5+230, i+1, song.right.get(i+1)*5+230);
    line(i, song.left.get(i)*5+250, i+1, song.left.get(i+1)*5+250);
    line(i, song.right.get(i)*5+270, i+1, song.right.get(i+1)*5+270);
    line(i, song.left.get(i)*5+290, i+1, song.left.get(i+1)*5+290);
    line(i, song.right.get(i)*5+310, i+1, song.right.get(i+1)*5+310);
    line(i, song.left.get(i)*5+330, i+1, song.left.get(i+1)*5+330);
    line(i, song.right.get(i)*5+350, i+1, song.right.get(i+1)*5+350);
    line(i, song.left.get(i)*5+370, i+1, song.left.get(i+1)*5+370);
    line(i, song.right.get(i)*5+390, i+1, song.right.get(i+1)*5+390);
    line(i, song.left.get(i)*5+410, i+1, song.left.get(i+1)*5+410);
    line(i, song.right.get(i)*5+430, i+1, song.right.get(i+1)*5+430);
    line(i, song.left.get(i)*5+450, i+1, song.left.get(i+1)*5+450);
    line(i, song.right.get(i)*5+470, i+1, song.right.get(i+1)*5+470);
    line(i, song.left.get(i)*5+490, i+1, song.left.get(i+1)*5+490);
    line(i, song.right.get(i)*5+510, i+1, song.right.get(i+1)*5+510);
    line(i, song.left.get(i)*5+530, i+1, song.left.get(i+1)*5+530);
    line(i, song.right.get(i)*5+550, i+1, song.right.get(i+1)*5+550);
    line(i, song.left.get(i)*5+570, i+1, song.left.get(i+1)*5+570);
    line(i, song.right.get(i)*5+590, i+1, song.right.get(i+1)*5+590);
    line(i, song.left.get(i)*5+610, i+1, song.left.get(i+1)*5+610);
    line(i, song.right.get(i)*5+630, i+1, song.right.get(i+1)*5+630);
    line(i, song.left.get(i)*5+650, i+1, song.left.get(i+1)*5+650);
    line(i, song.right.get(i)*5+670, i+1, song.right.get(i+1)*5+670);
 }
  

 
  
}

 
 
  
void stop() {
  song.close();
  minim.stop();
  super.stop();
}


