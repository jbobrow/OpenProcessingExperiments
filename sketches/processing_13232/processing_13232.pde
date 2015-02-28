
// keyPressed

void keyPressed(){

  println("keypressed = " + key);

    if (key == 'a' || key == 'A') {
     // turns all the brushes off
      for(int i=0; i<10; i=i+1) {
        //brushActive[i] = false;
      }
  } 
  if (key == 'b' || key == 'B') {
    //theBackGroundColor=colorFromPalette();
  } 
  
  if (key == 'c' || key == 'C') {
    //background(colorFromPalette());
    //pikcha = createGraphics(width, height, JAVA2D);
  } 

  if (key == 'p' || key == 'P') {
    paletteSelector = int(random(10));
  } 

  if (key == 'q' || key == 'Q') {
    setup();
  } 

  // randomize brushes
  if (key == 'r' || key == 'R') {
    //randomBrushes();
    initMouseMemory2();
  } 

  if (key == 's' || key == 'S') {
    save("recursiveCircleThing" + frameCount + ".png");

   // pikcha.save( "mBoverlay" + frameCount + ".png" );
    println("Saving frame " + frameCount );
  } 

  if (key == 'u' || key == 'U') {
    updateNowMouse();
    updateThenMouse();
    updateMemMouse();
  } 


  if (key == 'z' || key == 'Z') {
    initMouseMemory2();
  } 
  
    if (key == '+' || key == '=') {
    its = its + 1;
    println("its = " + its);
  } 
  
      if (key == '-' || key == '_') {
    
        if (its > 1) { 
          its = its - 1;
          println("its = " + its);
      }
  } 
  

  if (key == '1' ||
    key == '2' ||
    key == '3' ||
    key == '4' ||
    key == '5' ||
    key == '6' ||
    key == '7' ||
    key == '8' ||
    key == '9') {

    int theKey = int(str(key)) - 1;

    println(theKey);
    
    /*
    if (brushActive[theKey]){
      //brushActive[theKey] = false;
    }    
    else {
      //brushActive[theKey] = true;
    } */
  }   
}


