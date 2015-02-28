
// This is provided AS IS!
// I can't assure you it will work 100% of the time!!

// The following changes are all you need to make:
// size() becomes Size() // YOU MUST CALL Size()! ALSO CALL IT ONLY WITH P3D? // TODO: Look into this.
// draw() becomes Draw() // YOU MUST HAVE A Draw(), even if it does nothing.
// background() becomes Background()
// lights() becomes Lights()
// stroke() becomes Stroke()
// noStroke() becomes NoStroke()
// fill() becomes Fill()
// noFill() becomes NoFill()

// Then you will have access to this function:
// ID()
// This function always returns the ID of the object the mouse is over when it is called.
// Objects are given the current ID when they are drawn.
// The current ID is set with a call to ID() with a parameter:
// ID( newID );
// The new ID will stay as the ID for all things rendered until a different ID is set.
// And to really trip you out, you can get the ID of an object at any point on the screen:
// ID( int xPos, int yPos );
// So a call to ID() is really the same as a call to ID(mouseX, mouseY)!

// TODO: Other things to worry about:
// What about tint()?
// What about texture()?
// What about noTint()?
// what about vertex()?
// What about noStroke()?
// What about noFill()?
// Are lights working alright?
// Can I do anything about those calls to Background(), Stroke(), and Fill() I had to comment out?
// Doesn't seem like I need to...!

float r;
color bgcolor = color(32);
color[] colors = {
  color(064,064,064),
  color(255,000,000),
  color(000,255,000),
  color(000,000,255),
  color(255,255,000),
  color(255,000,255),
  color(000,255,255),
  color(255,255,255),
  color(064,064,064) 
};

void setup(){
  Size(300,300, P3D);
  r = 0.0;
}

void Draw(){
  int currentID = 0;
  ID(currentID);
  Background(bgcolor); // The background also gets an ID.
  Lights();
  noStroke();
  translate(width/2.0, height/2.0,30);
  rotateY(r);
  r=(r+0.01)%TWO_PI;
  for(int x=-1;x<2;x++){
    for(int y=-1;y<2;y++){
      for(int z=-1;z<2;z++){
        pushMatrix();
        scale(40);
        translate(x,y,z);
        if(x*y*z != 0){
          currentID++; // Get the next ID...
          ID(currentID); // And use that ID...
          Fill(colors[currentID]); // And it's color...
          box(1); // ...for this box.
        }
        popMatrix();
      }
    }
  }
}

void mouseClicked(){
  int mouseID = ID(); // Get the ID of the object under the mouse.
  //println( mouseID );
  // And set the background color to the color at that index.
  bgcolor = color( red(colors[mouseID])/2, green(colors[mouseID])/2, blue(colors[mouseID])/2 );
  // And just like that, you can do 3D picking!
}

