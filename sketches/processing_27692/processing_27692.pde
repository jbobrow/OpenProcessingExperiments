
public interface ElementoBano {

}

public class Bano extends Lugar {
  public Bano (int posXInicial, int posYInicial, int posXFinal, int posYFinal) {

    super (posXInicial, posYInicial, posXFinal, posYFinal);    

    int [] posicionesFinalesComedorX = new int [20];
    int [] posicionesFinalesComedorY = new int [20];
    posicionesFinalesComedorX [0] = 0;         //piso
    posicionesFinalesComedorY [0] = 0;          
    posicionesFinalesComedorX [1] = 7;                //alfombra
    posicionesFinalesComedorY [1] = 22; 
    posicionesFinalesComedorX [2] = 20-4;             //sillaUno
    posicionesFinalesComedorY [2] = 30; 
    posicionesFinalesComedorX [3] = 43-4;             //sillaDos
    posicionesFinalesComedorY [3] = 30; 
    posicionesFinalesComedorX [4] = 65-4;            //sillaTres
    posicionesFinalesComedorY [4] = 30; 
    posicionesFinalesComedorX [5] = 20-1;            //sillCuatro
    posicionesFinalesComedorY [5] = 70; 
    posicionesFinalesComedorX [6] = 43-1;            //sillaCinco
    posicionesFinalesComedorY [6] = 70; 
    posicionesFinalesComedorX [7] = 65-1;             //sillaSeis
    posicionesFinalesComedorY [7] = 70; 
    posicionesFinalesComedorX [8] = 12;              //mesaComedor
    posicionesFinalesComedorY [8] = 41; 
    posicionesFinalesComedorX [9] = -295;              //mantel
    posicionesFinalesComedorY [9] = -67; 
    posicionesFinalesComedorX [10] = 60;              //decoracion
    posicionesFinalesComedorY [10] = 50; 
    posicionesFinalesComedorX [11] = 0;              //platos
    posicionesFinalesComedorY [11] = 0;
    posicionesFinalesComedorX [12] = 0;              //esca
    posicionesFinalesComedorY [12] = 0;  


    super.setPosicionesFinalesX (posicionesFinalesComedorX);
    super.setPosicionesFinalesY (posicionesFinalesComedorY);
  }

}

public class BanoPiso extends ElementoBase implements ElementoBano {
  public BanoPiso (PImage imagen, int posXInicial, int posYInicial, int id) {
    super (imagen, posXInicial, posYInicial, id);
  }   
}

public class Lavadora extends ElementoBase implements ElementoBano {
  public Lavadora (PImage imagen, int posXInicial, int posYInicial, int id) {
    super (imagen, posXInicial, posYInicial, id);
  }   
}

public class Lavamanos extends ElementoBase implements ElementoBano {
  public Lavamanos (PImage imagen, int posXInicial, int posYInicial, int id) {
    super (imagen, posXInicial, posYInicial, id);
  }   
}

public class BanoMesa extends ElementoBase implements ElementoBano {
  public BanoMesa (PImage imagen, int posXInicial, int posYInicial, int id) {
    super (imagen, posXInicial, posYInicial, id);
  }   
}

public class Papel extends ElementoBase implements ElementoBano {
  public Papel (PImage imagen, int posXInicial, int posYInicial, int id) {
    super (imagen, posXInicial, posYInicial, id);
  }   
}

public class Sanitario extends ElementoBase implements ElementoBano {
  public Sanitario (PImage imagen, int posXInicial, int posYInicial, int id) {
    super (imagen, posXInicial, posYInicial, id);
  }   
}

public class BanoToalla extends ElementoBase implements ElementoBano {
  public BanoToalla (PImage imagen, int posXInicial, int posYInicial, int id) {
    super (imagen, posXInicial, posYInicial, id);
  }   
}

public class BanoAlfombra extends ElementoBase implements ElementoBano {
  public BanoAlfombra (PImage imagen, int posXInicial, int posYInicial, int id) {
    super (imagen, posXInicial, posYInicial, id);
  }   
}

public class BanoFlores extends ElementoBase implements ElementoBano {
  public BanoFlores (PImage imagen, int posXInicial, int posYInicial, int id) {
    super (imagen, posXInicial, posYInicial, id);
  }   
}

public class Grifo extends ElementoBase implements ElementoBano {
  public Grifo (PImage imagen, int posXInicial, int posYInicial, int id) {
    super (imagen, posXInicial, posYInicial, id);
  }   
}


public class Escalera extends ElementoBase implements ElementoBano {
  public Escalera (PImage imagen, int posXInicial, int posYInicial, int id) {
    super (imagen, posXInicial, posYInicial, id);
  }   
}




