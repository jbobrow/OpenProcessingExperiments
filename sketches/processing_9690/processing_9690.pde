
/* 
    incoming osc message are forwarded to the oscEvent method. 
       
    the method addrPattern is used to route incoming addresses to other functions   
    
    see http://www.sojamo.de/libraries/oscP5/index.html for library details
    
    code snippets from 
    http://www.sojamo.de/libraries/oscP5/examples/oscP5plug/oscP5plug.pde
    &&
    http://www.sojamo.de/libraries/oscP5/examples/oscP5parsing/oscP5parsing.pde
*/

void oscEvent(OscMessage theOscMessage) {
 
  if(theOscMessage.isPlugged()==false) {
    /* print the address pattern and the typetag of the received OscMessage */
    println("### received an [unplugged] osc message.");
    println("### addrpattern\t"+theOscMessage.addrPattern());
    println("### typetag\t"+theOscMessage.typetag());

    if(theOscMessage.addrPattern().equals("/test") && theOscMessage.typetag().equals("f") ) { 
      println("OSC: /test worked"); 
    }

    if(theOscMessage.addrPattern().equals("/wii/2/button/A") && theOscMessage.typetag().equals("i") ) { 
      randomBrushes();

    }

    if(theOscMessage.addrPattern().equals("/wii/2/button/B") && theOscMessage.typetag().equals("i") ) { 
      paletteSelector = int(random(10));
      colorFromPalette();
    }
    
        if(theOscMessage.addrPattern().equals("/wii/2/button/Plus") && theOscMessage.typetag().equals("i") ) { 
      frameRate = frameRate + 1;
    }
            if(theOscMessage.addrPattern().equals("/wii/2/button/Minus") && theOscMessage.typetag().equals("i") ) { 
      if (frameRate > 1){
              frameRate = frameRate - 1;
            }
    }

    if(theOscMessage.addrPattern().equals("/wii/2/button/Home") && theOscMessage.typetag().equals("i") ) { 
      if (suppressWiiHome == true){
        setup();
        suppressWiiHome = false;
      }
      else {
        suppressWiiHome = true;
      }
    }

    if(theOscMessage.addrPattern().equals("/wii/1/ir") && theOscMessage.typetag().equals("ff") ) { 

      println("/wii/1/ir:x = " + theOscMessage.get(0).floatValue() + " /wii/1/ir:y = " + theOscMessage.get(1).floatValue());

      wir1x = int(map( theOscMessage.get(0).floatValue(), 0.1, 0.999, float(width), float(height)));
      wir1y = int(map( theOscMessage.get(1).floatValue(), 0.1, 0.999, float(width), float(height)));
      wir1LastAlive = millis();
      
      
      if (wiiMemCount > 10) {

        memWir1x = int(map( theOscMessage.get(0).floatValue(), 0.001, 0.999, float(width), float(height)));
        memWir1y = int(map( theOscMessage.get(0).floatValue(), 0.001, 0.999, float(width), float(height)));
        println("memWir x,y: " + memWir1x + " " + memWir1y);  
        wiiMemCount = 0;

      } 
      else {
        wiiMemCount++;
      }

      wir1LastAlive = millis();
    }   


  } // if(theOscMessage.isPlugged()==false)
} //void oscEvent(OscMessage theOscMessage) {





