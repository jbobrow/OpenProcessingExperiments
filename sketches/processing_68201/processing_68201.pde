
//"Mira" del usuario con la que apunta a los "Targets"
class Crossair {
  //Declaraciones
  float x;
  float y;
  float speed;

  //Constructor
  Crossair() { }

  //Métodos
    void display(float xpos, float ypos) {
      x = xpos;
      y = ypos;
      stroke(255);
      strokeWeight(10);
      line(x, y, x, y+10);
      line(x, y, x, y-10);
      line(x, y, x+10, y);
      line(x, y, x-10, y);
    }
  }


