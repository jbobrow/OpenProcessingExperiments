
void serialSetup(){

  whichSerial = -1;
  textFont(font,24);
 textAlign(CENTER);
  fill(0,0,255);
  int ylength = height/(ports.length + 3);
  String instructions = "CLICK ON THE CORRECT SERIAL PORT";
  text(instructions,width/2,ylength);
  textFont(font,20);
  for (int i = 0; i < ports.length;i++){
    if(mouseY > (i+1)*ylength + ylength/2 && mouseY<= (i+2)*ylength + ylength/2) {
      fill(255,0,0); 
      whichSerial = i;
    }
    else{
      fill(255);
      // whichSerial = -1;
    }
    text(ports[i],width/2,(i+2)*ylength);
    // println(ports[i]); 
  }

  String noGood = "None of these look right";
  if(mouseY > (ports.length+1)*ylength + ylength/2 && mouseY<= (ports.length+2)*ylength + ylength/2) {
    fill(255,0,0); 
    whichSerial = ports.length;
  }
  else{
    fill(255);
  }
  text(noGood,width/2,(ports.length+2)*ylength);

}

void startPort(){

  if (whichSerial < ports.length) {
    println("go");
    port = new Serial(this,Serial.list()[whichSerial],9600);
    mode = NAME_SETUP; 
  }
  else{
    println("retry");
    mode = RETRY_SERIAL;
  }
}

void retrySerial(){
  textFont(font,24);
  textAlign(CENTER);
  fill(0,0,255);
  String instructions = "CONNECT YOUR USB CABLE\nAND PRESS THE MOUSE BUTTON";
  text(instructions,width/2,height/2);

}

