
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup()
{
  size(400, 400, P3D);

  oscP5 = new OscP5(this, 12345);
  myRemoteLocation = new NetAddress("127.0.0.1", 12345);
}

void draw()
{
}

void oscEvent(OscMessage theOscMessage) 
{  
  if (theOscMessage.checkAddrPattern("/fft")==true) {
    println("/fft");
  }
  else  if (theOscMessage.checkAddrPattern("/bd")==true) {
    println("/bd");
  } 
  else  if (theOscMessage.checkAddrPattern("/snare")==true) {
    println("/snare");
  }  
  else  if (theOscMessage.checkAddrPattern("/hh")==true) {
  println("/hh");
  } 
  else  if (theOscMessage.checkAddrPattern("/tom")==true) {
    println("/tom");
  }
  else  if (theOscMessage.checkAddrPattern("/synth")==true) {
println("/synth");
  }
  else  if (theOscMessage.checkAddrPattern("/scene")==true) {
    println("/scene");
  }
  else {
    println("### received an osc message. with address pattern "+theOscMessage.addrPattern());
  }
}
