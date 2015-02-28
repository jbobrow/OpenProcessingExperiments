
// variable aus klasse wird definiert / klasse aufrufen
Monsi var;

void setup () {
  size( 800, 600 );
  smooth();
  frameRate(10);
  var = new Monsi();
  var.init(); // aufrufen um die koordianten zu bekommen
}

void draw () {
  background( 200 );
  var.drawMe();
}

// wird geprüft ob maus bewegt wurde
void mouseMoved() {
  var.testMouseOver( mouseX, mouseY );
}

// wird zuerst aufgerufen, wenn mans geklickt
void mousePressed () {
  var.testMousePressed( mouseX, mouseY );
}

// wird geprüft ob maus bewegt object
void mouseDragged () {
  var.moveIfPressed( mouseX-pmouseX, mouseY-pmouseY);
}

// wird geprüft ob maus losgelasen
void mouseReleased () {
  var.released();
}



