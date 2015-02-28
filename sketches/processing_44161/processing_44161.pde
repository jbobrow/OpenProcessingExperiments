
//Initialized the class
class Ejemplo_class {
  int x_position = 0;
  int y_position = 0;
  //Constructo 
  Ejemplo_class() {
    /*int x_position = x_pos;
     int y_position = y_pos;
     int speed_a = speed_a_pos;
     int speed_b = speed_b_pos;
     int randomRedColor = rrc;
     int randomGreenColor = rgc;
     int randomBlueColor = rbc;*/
  }
  void crear_cuadro(int posX, int posY, int posWidth, int posHeight) {
    stroke(255);
    rect(posX, posY, posWidth, posHeight);
  }
}


