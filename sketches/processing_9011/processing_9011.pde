
//import oscP5.*;
//import netP5.*;

//OscP5 oscP5;
//NetAddress myRemoteLocation;

PImage bg;
blendPicasso pica;

void setup(){
  //oscP5 = new OscP5(this,5555);
  //myRemoteLocation = new NetAddress("127.0.0.1",5555);
  
  size(500, 650);
  bg = loadImage("Picasso.jpg");
  bg.resize(500, 650);
  image(bg, 0, 0);
}

void draw(){
  
}

void mouseMoved(){
  pica = new blendPicasso(int(random(400)), int(random(400)));
  pica.blendIt();
  pica.displayPicasso();

  //OscMessage myMessage = new OscMessage("processing");  
  //myMessage.add(new int[] { 1, 2000, 1000, 5, 5, 2, 400, 500, 5, 6, 3, 200, 560, 5, 6 });
  //oscP5.send(myMessage, myRemoteLocation); 
}

void mouseClicked(){
  filter(INVERT);
}

