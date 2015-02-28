


int num = 300;
float [] moon = new float [num];
float [] planet = new float [num];
float [] displacement = new float [num];
float [] moonSpeed = new float [num];
float [] moonSize = new float [num];
float [] speed = new float [num];
float [] Psize = new float [num];
float frameReset = 0;



float cameraX, cameraY;

void setup() {
  noStroke ();
  size(400,400,P3D);
  lights();

  for (int i = num - 1; i >= 0; i --) {
    speed[i] = random(-20, 20);
    moonSpeed[i] = random(-10, 10);
    Psize[i] = random(5, 15);
    displacement[i] = random (50, 300);
    moonSize[i] = Psize[i]/4 + random(-5, 5);
    planet [i] = 0;
    moon [i] = 0;
  }
}



void draw() {
  
  background (0);

  //translate the coordinates
  translate(width/2,height/2,0);

  //camera
  cameraX = radians(map(mouseX, 0, width, 180, 45));
  cameraY = radians(map(mouseY, 0, height, 45, 180));
  camera(500 * cos(cameraX * 2),-100,500 * sin(cameraY * 2),0,0,0,1,1,-1);

  fill(255,50,10);
  sphere(50);

  //sun
  for (int i = 0; i < num - 1; i++) {
    pushMatrix();
    rotateY(planet[i]*-PI/6*0.01);
    planet[i]+= speed[i];

    //earth
    fill(displacement[i],150,255);
    translate(displacement[i],0,0);
    rotateZ(moon[i]*PI/6*0.1);
    rotateX(moon[i]*PI*.03);
    sphere(Psize[i]);
    moon [i] += moonSpeed[i];



    //moon
    fill(200,200,150);
    translate(Psize[i]*2,0,0);
    sphere(moonSize[i]);


    popMatrix();
  }
  
  frameReset++;
  if (frameReset == 2){
    num = 2;
  }
}


void mousePressed () {
  num++;
}




