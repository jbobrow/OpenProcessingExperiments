
/*
*CAMPOS POTENCIALES
 *Por: Joaku de sotavento, Baruch y Ernesto Huerta
 *Los campos potenciales son un modelo matematico 
 *utilizado en la planeación de trayectoriaspara sistemas
 *dinámicos.
 *Aquí se plantean los campos potenciales para el uso en sistemas
 *de representación expresiva para fines artisticos 
 */

// delcaring a robot
Robot myRobot;
// declaring the attractor
Attractor myAttractor;
// declaring the obstacles
Obstacle[] myObstacleArray;
//para declarar el numero de obstaculos 
//********* aqui no se como delarar el arreglo de oabtaculos, 
//en el metodo dentro de cell, se calculan las fuerzas de repulsion como 
//si fuera un arreglo pero no se como hacerlo en el class obstaculo
int _numObs;

//delcaring the cell grid
Cell[][] _cellArray;
// grid size
int _cellSize = 40;
// numero de celulas de ancho y de alto
int _numX, _numY;

// numero de obstaculos
int numObs = 1;


void setup() {
  size (1240, 800);
  smooth();

  // estas partes estan comentadas por que le cambie los valores 
  //iniciales al robot que antes eran ac, ve, lo, locs
  //initialize the variables ac, ve, lo from robot
  //PVector ac = new PVector(0.0,0.);
  //PVector ve = new PVector(0.0,1.0);
  //PVector lo = new PVector(50,50);
  // PVector locS = new PVector (9.0, 9.0);

  // initialize the constants of obstacle
  //PVector oLoc = new PVector();

  //initialize the robot
  //// posicion, masa, paso y razon de cambio
  myRobot = new Robot(new PVector(width/4, height/4), 20, 5, 200);
  //initialize the atractor
  myAttractor = new Attractor(new PVector(width/2, height/2), 20, 2000);
  //Initialize the obstacle (PVector loc, mass, oRepulsion, Mass )


  //myObstacle = new Obstacle (new PVector(width/10, height/10), 50, 100, 100);
  // **en la parte de abajo que esta comentada trataba de inicializar el arreglo de aobtaculos
  //for (int i = 0; i< _numObs; i++) {
  //myObstacle[i] = new Obstacle (new PVector(width/10, height/10),30,10);
  //_numObs = 3;
  // }

  // initialize the obstacle array
  myObstacleArray = new Obstacle[numObs];
  for (int i = 0; i < numObs; i++){
                                                  //location, mass, repulsion, range
    myObstacleArray[i] = new Obstacle (new PVector( random(width), random(height)) , 50, 400, 100);
       
  }

  //initialize the cell grid
  _numX = floor(width/_cellSize);
  _numY = floor(height/_cellSize);



  _cellArray = new Cell[_numX][_numY];
  for (int x = 0; x<_numX; x++) {
    for (int y = 0; y<_numY; y++) {

      _cellArray[x][y] = new Cell (x, y, 0, 0);
    }
  }
}

void draw() {
  background (0);
  frameRate(12);

  //calling the grid
  for (int x = 0; x < _numX; x++) {
    for (int y = 0; y < _numY; y++) {
      _cellArray[x][y].drawMe(myRobot, myAttractor);
      // 
      _cellArray[x][y].attraccion(myRobot, myAttractor);
      //////// mirar el truco que hizo el neto con los curli brackets para que pudiera servir la llamada
       //calling the obstacle
         
      for (int i = 0; i < numObs; i++){
   
      _cellArray[x][y].repulsion(myRobot, new Obstacle[] {myObstacleArray[i]});

      }
      
      _cellArray[x][y].fuerzaT();
      // print (_cellArray[x][y].fTotalx);
    }
  }

  /// calling the robot

  /// este numero nos sirve para actualizar los arreglos
  int ix = (int)(myRobot.loc.x /_cellSize); 
  int iy = (int)(myRobot.loc.y /_cellSize);
  if (ix*_cellSize >= width) ix = width/_cellSize-1;
  if (iy*_cellSize >= height) iy = height/_cellSize-1;
  myRobot.wallking(_cellArray [ix][iy]);
  ////****** estos son las llamadas que dibujan y y dan la movilidad 
  //al obtaculo y al attractor 

 for (int i = 0; i < numObs; i++){
      myObstacleArray[i].go();
      myObstacleArray[i].rollover(mouseX, mouseY);
 }
 
  //calling the attractor
  myAttractor.go();
  myAttractor.rollover(mouseX, mouseY);
  
  //saveFrame("pot-######.png");
}



///////// initialized the acctions of mouse
void mousePressed() {
  myAttractor.clicked(mouseX, mouseY);
  for(int i = 0; i < numObs; i++){
  myObstacleArray[i].clicked(mouseX, mouseY);
  }
  
  
  
}
void mouseReleased() {
  myAttractor.stopDragging();
  for (int i = 0; i < numObs; i++){
  myObstacleArray[i].stopDragging();
  }
  
  //saveFrame("pot-######.png");
}


//////Attractor
//////***** lo que tienen el PVector es que contienen los datos X y Y, de lo que se designe

class Attractor {
  color col;    //// el color del objeto de atraccion
  float mass;    // Mass, tied to size
  float E;  // Esta  es un valor por el que se multiplica la fuerza de atraccion, es el interes en el destino
  PVector loc;
  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?
  PVector drag;  // holds the offset for when object is clicked on

  ///////////////////// constructor
  Attractor(PVector l_, float m_, float e_) {
    loc = l_.get();
    mass = m_;
    E = e_;
    drag = new PVector(0.0, 0.0);
    col = color (random(50), random (100), random (255));
  }

  void go() {
    render();
    drag();
  }


  // Method to display
  void render() {
    ellipseMode(CENTER);
    stroke(0);
    if (dragging) fill (col);
    else if (rollover) fill(col);
    else fill(175, 200);
    ellipse(loc.x, loc.y, mass*2, mass*2);
    //println (loc.x);
  }

  // The methods below are for mouse interaction
  void clicked(int mx, int my) {
    float d = dist(mx, my, loc.x, loc.y);
    if (d < mass) {
      dragging = true;
      drag.x = loc.x-mx;
      drag.y = loc.y-my;
    }
  }

  void rollover(int mx, int my) {
    float d = dist(mx, my, loc.x, loc.y);
    if (d < mass) {
      rollover = true;
    } 
    else {
      rollover = false;
    }
  }

  void stopDragging() {
    dragging = false;
  }



  void drag() {
    if (dragging) {
      loc.x = mouseX + drag.x;
      loc.y = mouseY + drag.y;
    }
  }
}





//================================= the grid
//**************** parece que aqui las cuentas estab bien, se llama a valores de los objetos robot, attractor y obstacle
///*************** la cosa es que los metodos **atraccion, repulsion y fuerzaT** necesitan estarse refrescando en el loop para ir actualizando los datos
///**************** que son de los que depende el robot para moverse
///**************** otro problea es que necesito cargar los valores de *** fTotalx, fTotaly *** en cada uno de los cuadors y 
///**************** fatx, faty,***** necesito cargarlos en el attractor y **** frepx, frepy *** en los obstaculos


class Cell {
  float x, y;


  ///////// componesta of attractor field
  float fatx;
  float faty; 

  /////// componets of resulsive field
  float d0; // distance between the obstacle´s and the robot
  float rep; // the vector between the robot and the obstacle
  float frepx; // reulsion force on x 
  float frepy; // repulsion force on y
  ///////////////////
  float fTotalx; 
  float fTotaly;
  color col;
  ///////////////////// componets of unitary vector repuslion attraccion


  //
  /// constructor of grid
  Cell(float ex, float why, float fTotx, float fToty) {
    x = ex  *_cellSize;
    y = why * _cellSize;
    fTotalx = fTotx;
    fTotaly = fToty;
    col = 100;
  }
  /////////////// este metodo calcula la fuerza de atraccion entre el robot y su destino dependiendo de la razon de cambio Delta I (interes del robot)
  PVector attraccion(Robot r, Attractor att) {
    float d = dist(r.loc.x, r.loc.y, att.loc.x, att.loc.y);
    //println(d);
    if (d  <= r.deI) {
      fatx = (att.E) * (r.loc.x - att.loc.x);
      faty = (att.E) * (r.loc.y - att.loc.y);
    } 
    else {
      
      fatx = (att.E) * (r.loc.x - att.loc.x);
      faty = (att.E) * (r.loc.y - att.loc.y);
      /*     
      fatx = (att.E) *( (r.loc.x - att.loc.x)/d);
      faty = (att.E) * ( (r.loc.y - att.loc.y)/d);
      */
    }
    return new PVector(fatx, faty);
  }



  PVector repulsion(Robot r, Obstacle[] obs) {

    for ( int i = 0; i < obs.length; i++) {
      d0 = dist(r.loc.x, r.loc.y, obs[i].loc.x, obs[i].loc.y);
      if ( d0 <= obs[i].rangoO) {
        rep = ((-1*obs[i].N) * (1/d0 - 1/obs[i].rangoO)) * (pow(((pow((r.loc.x - obs[i].loc.x), 2)) + pow((r.loc.y - obs[i].loc.y), 2)), 3/2));
      }
      else {
        rep = 0;
      }
      frepx = rep * (r.loc.x - obs[i].loc.x);
      frepy = rep * (r.loc.y - obs[i].loc.y);
    } 
    return new PVector (frepx, frepy);
  }

  ////////********** este es el vector unitario de la fuerza de repulsion y la fuerza de attraccion 

  PVector fuerzaT () {


    fTotalx =  (fatx + frepx) /  sqrt(pow(fatx, 2)+ pow(frepx, 2));
    fTotaly =  (faty + frepy) /  sqrt(pow(faty, 2)+ pow(frepy, 2));

    return new PVector (fTotalx, fTotaly);
  }   


  void drawMe(Robot rob, Attractor att) {
    float colorCamb = dist(rob.loc.x, rob.loc.y, x, y);
    stroke(0);
    float colorCamb2 = dist(rob.loc.x, rob.loc.y, att.loc.x, att.loc.y);
    fill(map(colorCamb2, 0, dist(0, 0, width, height), 0, 255));
    if (colorCamb < _cellSize/2) fill(150, 50, 200);
    rect(x, y, _cellSize, _cellSize);
  }
}





/////////////OBSTACLE


class Obstacle {
  float mass;    // Mass, tied to size
  float N;  // fuerza de repulsion
  float rangoO; // amplitud del campo de repulsion
  PVector loc;
  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?
  PVector drag;  // holds the offset for when object is clicked on

  Obstacle(PVector l_, float m_, float n_, int rango) {
    loc = l_.get();
    mass = m_;
    N = n_;
    rangoO = rango;
    drag = new PVector(0.0, 0.0);
  }

  void go() {
    render();
    drag();
  }


  // Method to display
  void render() {
    ellipseMode(CENTER);
    stroke(0);
    if (dragging) fill (50);
    else if (rollover) fill(100);
    else fill(175, 200);
    ellipse(loc.x, loc.y, mass*2, mass*2);
  }

  // The methods below are for mouse interaction
  void clicked(int mx, int my) {
    float d = dist(mx, my, loc.x, loc.y);
    if (d < mass) {
      dragging = true;
      drag.x = loc.x-mx;
      drag.y = loc.y-my;
    }
  }

  void rollover(int mx, int my) {
    float d = dist(mx, my, loc.x, loc.y);
    if (d < mass) {
      rollover = true;
    } 
    else {
      rollover = false;
    }
  }

  void stopDragging() {
    dragging = false;
  }


  void drag() {
    if (dragging) {
      loc.x = mouseX + drag.x;
      loc.y = mouseY + drag.y;
    }
  }
}




//////////object Robot
class Robot {
  color c;
  PVector loc;

  ////////********* estos osn los que quiero estar actualizando en el robot para que se mueva.
  float avanzaY;
  float avanzaX;

  float mass;
  float deltaO; // el tamagno del paso del robot
  float deI; // La razon de cambio en la fuerza de atraccion, si se usa una formula u otra

  //////////// constructor robot  
  Robot(PVector lo, float m_, float delta, float razon) {
    c = color (60, 100, 100);
    loc = lo.get();
    mass = m_;

    avanzaX = 0;
    avanzaY = 0;


    // Controles del robot
    deltaO = delta;
    deI = razon;
  }

  //PVector getLoc() {
  //return loc;
  //}

  ////calling the display and the move method
  void wallking(Cell _cell) {
    display(_cell);
   // println(_cell.fuerzaT());
  }
  ////////////////******************* al parecer esta es mi gran zanja ya que necesito como mencionava al principio del codigo que los valores de 

  /////// display the robot
  void display(Cell _cell) {
    ellipseMode (CENTER);
    stroke(0);
    
    PVector deltaAv = moving(_cell); //////********* aqui es donde estoy atorado, no se como llamar a este metodo con los valores que estoy tratando de jalar de la clase Cell y necesito que esos datos se esten refrescando para poder mandarlos al display y que la bolita se mueva.
    //loc.x = loc.x + deltaAv.x;
    //loc.y = loc.y + deltaAv.y;
    ellipse(loc.x, loc.y, 20, 20); // lo que va aquí **** avanzaX, avanza **** es de los dos primeros valores de la fuincion los que van dando los datos del movimiento
  }

  ////////////////////********** aqui es donde estaba intentando poner el metodo de avanze del robot que mando a llamar en el wallking y este a su vez en el loop (void draw)
  PVector moving(Cell _cellArray) {
    avanzaX =  loc.x - (deltaO * _cellArray.fTotalx);
    avanzaY =  loc.y - (deltaO * _cellArray.fTotaly);
    loc.x = avanzaX;
    loc.y = avanzaY; 
    print(avanzaX);
    print("\t");
    print(avanzaY);
    println();
    return new PVector (avanzaX, avanzaY);
  }

  
}



