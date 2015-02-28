
/*
An example of how to receive and send OSC messages via UDP with the oscP5 library 
available here:
///////////////////////////////////////////////
http://www.sojamo.de/libraries/oscP5/
///////////////////////////////////////////////
OSC IS DETAILED HERE:
http://cnmat.berkeley.edu/system/files/attachments/Nime09OSCfinal.pdf
*/

//include statements for the library
import oscP5.*;
import netP5.*;

//name the oscP5 object
OscP5 oscP5;
//name the addresses you'll send and receive @
NetAddress ProcessingAddress;
NetAddress MaxAddress;
//a variable to receive and one to send
int input;
int outputX;
int outputY;
float funnyNumber;

//now set the addresses, etc
void setup()
{
  //the oscP5 client will be on this computer, port 12345, 12346, and 12347 (if you're networked with another computer, use it's ip#)
  oscP5 = new OscP5(this, 12345);//use the this argument for the IP number here (doesn't work with 127.0.0.1....)
  MaxAddress = new NetAddress("127.0.0.1", 12346);
  
  //make a processing window 800x800 to get some range for mouseX, for the purposes of this example.
  size(800, 800);
}

void draw()
{
  outputX = mouseX;//assign the mouse position to these variables
  outputY = mouseY;
    
    
   //the OscMessage class has handy formatting methods 
   OscMessage mouseData = new OscMessage("/toMax/mouseData");//greate the address
   mouseData.add(outputX);//append these items
   mouseData.add(outputY);
   oscP5.send(mouseData, MaxAddress);//send the message
   
   /*
   this one would be constantly generating messages, and because max is printing them, 
   it might bog down, but if it's just when mouse is down, that clears up a lot
   */
   if(mousePressed)
   {
     funnyNumber = random(100);
  
     OscMessage funnyNumbers = new OscMessage("/toMax/funnyNumbers");
     funnyNumbers.add(funnyNumber);
     oscP5.send(funnyNumbers, MaxAddress);
   }
   
  
  println("the input number from max is " + input);
}

/*////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
there is a bit of formatting to organize the messages for OSC.  it might seem overcomplicated for this 
example but for dealing with the skeleton data, it will make the parent/child trees easy to deal with.
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
*/////////////////////////////////////////////////////////////////////////////////////////////////////

/* 
incoming osc message are forwarded to the oscEvent method.
oscEvent() runs in the background, so whenever a message arrives, 
it is input to this method as the "theOscMessage" argument 
*/
void oscEvent(OscMessage theOscMessage) 
{
  println("the Check");
  
 if(theOscMessage.checkAddrPattern("/stream1")==true) 
 {
       input = theOscMessage.get(0).intValue();
       /*
         there is only one UDP input, but with the prefixes, you can have multiple streams that are unpacked seperately
         the .get() method starts at 0, will return items in a list seperated by spaces
         there are also .floatValue() .stringValue and so on
         
         the oscP5 library has more methods for checking the format of your input stream, but you should know what 
         you are sending and be able to just use the right methods without checking first
         
       */
 }
   
}
