
// Import the picking library for simple 3D picking
import picking.*;

// Declare a Picker object to do the picking.
Picker picker;

// Set up variables for the scene.
float r = 0.0;
color[] colors = {
  color(064,064,064), // Black
  color(255,000,000), // Red
  color(000,255,000), // Green
  color(000,000,255), // Blue
  color(255,255,000), // Yellow
  color(255,000,255), // Purple
  color(000,255,255), // Cyan
  color(255,255,255) }; // White
  color bgcolor = color(32);

void setup(){
  // Set the size, and make this a 3D sketch.
  size(300,300, P3D);
  // Set up the picking object.
  picker = new Picker(this);
}

void draw(){
  // Define a variable to track the current object's ID.
  int currentID = 0;
  // The background's ID is always -1
  background(bgcolor);
  lights();
  noStroke();
  translate(width/2.0, height/2.0,30);
  rotateY(r);
  r=(r+0.01)%TWO_PI;
  for(int x=-1;x<2;x++){
    for(int y=-1;y<2;y++){
      for(int z=-1;z<2;z++){
        // Each box has a different object ID, so you have to tell the picker which ID to use. 
        picker.start(currentID);
        pushMatrix();
        scale(40);
        translate(x,y,z);
        if(x*y*z != 0){
          // Each box is has a different color.
          fill(colors[currentID]);
          // Draw the box.
          box(1);
          currentID++;
        }
        popMatrix();
        // Tell the picker to stop using the ID, since we don't want any other objects to use this ID.
        picker.stop();
      }
    }
  }

// See the click buffer. Warning: Heavy code.
//loadPixels();
//picker.getBuffer().loadPixels();
//for( int i = 0; i < width * height; i++){
//  pixels[i] = 200 * picker.getBuffer().pixels[i];
//}
//updatePixels();

}

void mouseClicked(){
  // Get the object ID at the mouse's position.
  int mouseID = picker.get(mouseX,mouseY);
  println( mouseID );
  if(mouseID!=-1){
    // Set the background to the same color (but darker) to indicate which box was clicked.
    bgcolor = color( red(colors[mouseID])/2, green(colors[mouseID])/2, blue(colors[mouseID])/2 );
  } 
}








