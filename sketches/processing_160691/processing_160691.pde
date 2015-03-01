
/* declare class meteo as a array */ 
meteo meteoArray[];  
/* declare class meteo as a array */



void setup() {
  size(650, 500, P3D); //P3D for rotate X,Y,Z and sphere

  /* reset values of array meteo */
  meteoArray = new meteo[10]; //reset how many array do i need 
  for (int i = 0; i<10; i++) { //set the value into Array
    meteoArray[i] = new meteo(random(-50, 0), random(-50, 0), 0, random(-90, 90), 
                              random(10, 20), random(0, 2), random(0, 2), 
                              random(-2, 2));
                              /*meteo(xpos, ypos, zpos, rotation, 
                              meteoSize, meteoSpeedX, meteoSpeedY, 
                              meteoSpeedZ);*/
    /* reset values of array meteo */
  }
}

void draw(){
  background(20);
  /* draw meteo */
  sphereDetail(1/4); //set how many polygons of sphere 
  stroke(0); //if you use noStroke() then wireframe is disapear. 
  strokeWeight(1);
    /* draw meteo for 10ea */
    for (int i = 0; i<10; i++) {
      meteoArray[i].update(); //<-refer class part 
    }
    /* draw meteo for 10ea */
  /* draw meteo */
}

/* set class for meteo */
class meteo {
  /* grammar....  for setting up which variables do you use */
  float xpos, ypos, zpos, rotation, 
        meteoSize, meteoSpeedX, meteoSpeedY, 
         meteoSpeedZ;
  meteo (float x, float y, float z, float r, 
         float sizeM, float speedX, float speedY, 
         float speedZ) {
    xpos = x;
    ypos = y;
    zpos = z;
    rotation = r;
    meteoSize = sizeM;
    meteoSpeedX = speedX;
    meteoSpeedY = speedY;
    meteoSpeedZ = speedZ;
  }
  /* grammar....  for setting up which variables do you use */
  
  /* set functions of class you can use for draw using this kind of command 
                                                    classname.functionname(); */
  void update() {
    xpos = xpos + meteoSpeedX;
    ypos = ypos + meteoSpeedY;
    zpos = zpos + meteoSpeedZ;
    rotation = rotation + 0.1;    
    if (xpos > width + meteoSize || ypos > height + meteoSize) {
      xpos = random(-50, 0);
      ypos = random(-50, 0);
      rotation = random(-90, 90);
      meteoSize = random(10, 20);
      meteoSpeedX = random(0, 2);
      meteoSpeedY = random(0, 2);
      meteoSpeedZ = random(-2, 2);
    }
    pushMatrix();
    translate(xpos, ypos);
    rotateZ(rotation);
    fill(random(0, 255), random(0, 255), random(0, 255));
    sphere(meteoSize);
    popMatrix();
  }
  /* set functions of class */
}
