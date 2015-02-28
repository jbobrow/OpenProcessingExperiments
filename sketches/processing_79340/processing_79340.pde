
int p = 0;
void oscEvent() {

  String patternPad = "/pad";
  String patternSeq = "/seq";

  //  if (patternSeq.equals(theOscMessage.addrPattern()) == true) {
  //    int xSeq = theOscMessage.get(0).intValue();
  //    
  //    for (int j = 0 ; j < ledX ; j++) {
  //      sequenceColor( xSeq, j );
  //    }
  //  }
  int f = int(frameRate);
  if (frameCount%f == 0) {
    p ++;
    
    for (int j = 0 ; j < ledX ; j++) {
      sequenceColor( p % 8, j );
    }
  }
  //  if (theOscMessage.isPlugged()==false) {
  // print the address pattern and the typetag of the received OscMessage 
  //    println("### received an osc message.");
  //    println("### addrpattern\t"+theOscMessage.addrPattern());
  //    println("### typetag\t"+theOscMessage.typetag());

  //    if (patternPad.equals(theOscMessage.addrPattern()) == true) {
  int j = 0, k = 0;
  for (int i = 0; i < ledX * ledY; i++) {
    //println(i + " | " + j + " | " + k);
    //        gridRecieved[k][j] = theOscMessage.get(i).intValue();

    if (gridRecieved[k][j] == 1 ) {
      pressedColor(k, j);
    } 
    else if (gridRecieved[k][j] == 0 ) {
      unpressedColor(k, j);
    }

    // print(gridRecieved[k][j] + " ");
    if ( (i+1) % 8 == 0 && i != 0 ) { 
      j++;
      k = 0;
    } 
    else k++;
  }
}
//  }
//}
void pressedColor (int i, int j) {
  ledTile[i][j].p.toGreen(); // make it green
  ledTile[i][j].p.enabled = true;
}
void unpressedColor (int i, int j) {
  ledTile[i][j].p.toRed(); // make it red
  ledTile[i][j].p.enabled = false;
}
void sequenceColor (int i, int j) {
  ledTile[i][j].p.fireParticle();
//ledTile[i][j].p.fp[0].pop();
}


