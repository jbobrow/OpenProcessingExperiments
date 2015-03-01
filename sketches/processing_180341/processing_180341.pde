
PVector[] direccion;

//Ahora incluimos un arreglo de posiciÃ³nes global;
PVector[] pos;

//PVector[] prevPos;  //para luego calcular la velocidad...

int tamCuadrante = 50;
int anchoCuadricula;
int altoCuadricula;



void setup() {

  size(700,500);
  //size(displayWidth, displayHeight);
  background(0);
  anchoCuadricula = floor( width/tamCuadrante );
  altoCuadricula = floor( height/tamCuadrante);
  direccion = new PVector[ altoCuadricula * anchoCuadricula ];
  pos = new PVector[ altoCuadricula * anchoCuadricula ];


  for (int i = 0; i < anchoCuadricula; i++) {
    for ( int j = 0; j < altoCuadricula; j++) {
      direccion[i + j*anchoCuadricula] = new PVector(1, 1);

      //pos[i + j*anchoCuadricula] = new PVector(1,1);
      pos[i + j*anchoCuadricula] = posIJ(i, j);  //damos las posiciones iniciales;
      //TodavÃ­a no se va a usar...
      //PVector prevPos = posIJ(i,j);  //damos las posiciones iniciales;
    }
  }
}


void draw() {
  //background(200);
  noStroke();
  fill(127, 60, 20, 1);
  rect(0, 0, width, height);

  stroke(0, 255);

  for (int i = 0; i < anchoCuadricula; i++) {
    for ( int j = 0; j < altoCuadricula; j++) {

      // PVector pos = posIJ(i,j); ahora se van a mover, no pueden ser posiciones fijas;
      int indice = i + j*anchoCuadricula;

      //Delta es tu nuevo origen y se mueve con el ratÃ³n
      // Calculamos las direcciones
      PVector delta = new PVector(pos[indice].x - mouseX, -(pos[indice].y - mouseY));
      direccion[indice].y = delta.x; 
      direccion[indice].x = delta.y;

      //direccion[indice].setMag(20 * cos(delta.mag()));  // esta chido!!! Â¿podrÃ­as cambiar la magnitud con respecto a delta?
      //Un coseno, por ejemplo, 

      //Puedes hacer que se muevan en circulos
      float freq = 0.007195*cos(noise(0.018*cos(frameCount/1000.50f), 0.018*sin(frameCount/1000.50f)));
      //float freq = 0.075*cos(frameCount/600000.0f);
      //float freq = 10*frameCount;

      //      direccion[indice].x =(direccion[indice].x * abs(cos(delta.mag()*freq)));
      //      direccion[indice].y =(direccion[indice].y * abs(sin(delta.mag()*freq)));

            direccion[indice].x =(direccion[indice].x * cos(delta.mag()*freq)) + (-1*direccion[indice].x * sin(delta.mag()*freq));
            direccion[indice].y =(direccion[indice].y * sin(delta.mag()*freq))+ (direccion[indice].y * cos(delta.mag()*freq));

      //direccion[indice].x =(direccion[indice].x * cos(delta.mag()*freq)) + (-1*direccion[indice].x * abs(sin(delta.mag()*freq)));
      //direccion[indice].y =(direccion[indice].y * sin(delta.mag()*freq))+ (direccion[indice].y * abs(cos(delta.mag()*freq)));

      //Prueba quitando el comentario de la linea de abajo... se ve bien peluche...
      direccion[indice].setMag(7 * cos(delta.mag()*0.001));
      //direccion[indice].setMag(1.15);

      //Ahora deja que la partÃ­cula sea libre...
      PVector nuevaPos = new PVector((pos[indice].x + direccion[indice].x), pos[indice].y + direccion[indice].y);

      //----Checa fronteras (metido en una funciÃ³n hasta abajo)

      nuevaPos = fronteras(nuevaPos, indice); 

      // Pintamos las direcciones
      //line(pos.x , pos.y, pos.x + direccion[indice].x, pos.y + direccion[indice].y);
      line(pos[indice].x, pos[indice].y, nuevaPos.x, nuevaPos.y);

      if (indice > anchoCuadricula) {

        stroke(0, 5);
        beginShape();
        if (dist(pos[indice].x, pos[indice].y, pos[indice-1].x, pos[indice-1].y) < 300) {
          stroke(dist(pos[indice].x, pos[indice].y, pos[indice-1].x, pos[indice-1].y)/1.5, 90, 60, 75);
          line(pos[indice].x, pos[indice].y, pos[indice-1].x, pos[indice-1].y);
          curveVertex(pos[indice].x, pos[indice].y);
          curveVertex(pos[indice-1].x, pos[indice-1].y);
        }
        if (dist(pos[indice].x, pos[indice].y, pos[indice-1].x, pos[indice].y) < 300) {
          stroke( dist(pos[indice].x, pos[indice].y, pos[indice-1].x, pos[indice].y)/1.5, 60, 10, 75);
          line(pos[indice].x, pos[indice].y, pos[indice-1].x, pos[indice].y);
          curveVertex(pos[indice].x, pos[indice].y);
          curveVertex(pos[indice-1].x, pos[indice].y);
        }
        if (dist(pos[indice].x, pos[indice].y, pos[indice].x, pos[indice-1].y) < 300) {
          stroke( dist(pos[indice].x, pos[indice].y, pos[indice].x, pos[indice-1].y)/2.0, dist(pos[indice].x, pos[indice].y, pos[indice].x, pos[indice-1].y)/3.5, 60, 75);
          line(pos[indice].x, pos[indice].y, pos[indice].x, pos[indice-1].y);
          curveVertex(pos[indice].x, pos[indice].y);
          curveVertex(pos[indice].x, pos[indice-1].y);
        }
        endShape();
      }

      //movemos la partÃ­cula
      pos[indice].x = nuevaPos.x;  //podrÃ­a llevar movimiento con ruido de perlin...
      pos[indice].y = nuevaPos.y;
    }
  }
}

//----------------------------------------------
PVector posIJ( int i, int j) {
  PVector resultado =  new PVector( floor(i*tamCuadrante + tamCuadrante/2), floor(j*tamCuadrante + tamCuadrante/2));
  return resultado;
}

//----------------------------------------------
PVector fronteras(PVector npos, int indice) {

  if (pos[indice].x > width) {
    //pos[indice].x = width;
    pos[indice] = posIJ(indice%anchoCuadricula, int(indice/anchoCuadricula));
    direccion[indice].x *= -1;
  }

  if (pos[indice].x < 0) {
    //pos[indice].x = 0;
    pos[indice] = posIJ(indice%anchoCuadricula, int(indice/anchoCuadricula));
    direccion[indice].x *= 1;
  }

  if (pos[indice].y > height) {
    //pos[indice].y = height;
    pos[indice] = posIJ(indice%anchoCuadricula, int(indice/anchoCuadricula));
    direccion[indice].y *= -1;
  }

  if (pos[indice].y < 0) {
    //pos[indice].y = 0;
    pos[indice] = posIJ(indice%anchoCuadricula, int(indice/anchoCuadricula));
    direccion[indice].y *= 1;
  }

  return new PVector(pos[indice].x + direccion[indice].x, pos[indice].y + direccion[indice].y);
}

//-----------------------------------------------
void keyPressed() {
  if (key == ' ') {
    background(0);
  }

  if (key == 'r') {
    for (int i = 0; i < anchoCuadricula; i++) {
      for ( int j = 0; j < altoCuadricula; j++) {
        direccion[i + j*anchoCuadricula] = new PVector(1, 1);

        //pos[i + j*anchoCuadricula] = new PVector(1,1);
        pos[i + j*anchoCuadricula] = posIJ(i, j);  //damos las posiciones iniciales;
        //TodavÃ­a no se va a usar...
        //PVector prevPos = posIJ(i,j);  //damos las posiciones iniciales;
      }
    }
  }

  if (key == 's') {
    //saveFrame("camposVec-######.jpg");
  }
}

