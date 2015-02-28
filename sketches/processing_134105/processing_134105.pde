
//******************RUN IN PROCESSING*************************
//IN OPEN PROCESSING ENVIRONMENT DOESN'T WORK WELL!

float inc=0.0;

Tentacolo[] tentacolo;
Head head;
//jitter
Jelly[] jellies;
Jelly jelly;
float counter;
int numJellies=23;

void setup() {
  frameRate(60);
  float xInt=14;
  float yInt=20;
  size(1000, 600  );

  jellies=new Jelly[numJellies];
  for (int i=0; i<numJellies; i++) {
    jelly = new Jelly( i, i*random(-3, 3)*xInt + 40, i*random(-1, 2 )*yInt +40);
    jellies[i] = jelly;
  }
}

void draw() {
  background(180);
  
  //background(#C4F3FF);

  for (int i = -800; i < width+600; i=i+3) {
    strokeWeight(15);
    stroke(100, random(100, 250), random(200, 25), 20);
    line(i, 0, random(width), height);
  }

  counter++;

  //Movement Jellyfish
  for (int i=0; i<numJellies; i++) {
    jellies[i].move();
    jellies[i].update();
  }
  
  //stroke(#14B428,110);
  stroke(#00C118,110);
  inc+=0.1;
  float angle= sin(inc)/10 + sin(inc*1.2)/20;
  alga(18,9, angle/1.3);
  alga(33,12,angle);
  alga(44,10,angle/1.3);
  alga(62,5,angle);
  alga(88,7, angle*2);
  
  alga(100,9, angle/1.3);
  alga(133,12,angle);
  alga(144,10,angle/1.3);
  alga(162,5,angle);
  alga(188,7, angle*2);
  
  alga(218,9, angle/1.3);
  alga(233,12,angle);
  alga(244,10,angle/1.3);
  alga(262,5,angle);
  alga(288,7, angle*2);
  
  alga(318,9, angle/1.3);
  alga(333,12,angle);
  alga(344,10,angle/1.3);
  alga(362,5,angle);
  alga(388,7, angle*2);
  
  alga(400,9, angle/1.3);
  alga(50,12,angle);
  alga(270,10,angle/1.3);
  alga(150,5,angle);
  alga(500,7, angle*2);
  alga(300,7, angle*2);
}
  

void alga(int x, int units, float angle){
  pushMatrix();
  translate(x,260);
  for (int i=units; i>0; i--){
    //scale(0.9);
    strokeWeight(i);
    line(0,0,0,-8);
    translate(0,-8);
    rotate(angle);
    
  }
  popMatrix();
}
class Head {
  float c=15;
  float x,y;

  Head(float _x, float _y) {
    x=_x;
    y=_y;
  }


  void display() {
    arch(c);
  }


    void arch(float curvature) {
      pushMatrix();
      // translate((width/2)+65, ((height/4)*3)-25);
      translate(x-50, y-60);
      float y=90.0;
      float sw=(65.0 - curvature)/4.0;
      strokeWeight(sw);
      //noFill();
      fill(255,0,255,40);
      beginShape();
      vertex(15.0, y);
      bezierVertex(15.0, y-curvature, 30.0, 55.0, 50.0, 55.0);
      bezierVertex(70.0, 55.0, 85.0, y-curvature, 85.0, y);
      //scale(1, 1);
      endShape();
      popMatrix();
    }
  
}

class Jelly {
  //float xInt=140;
  //float yInt=40;
  float xInt;
  float yInt;
  int id;
  int i =0;

  Tentacolo[] tentacolo;
  Head head;

  Jelly( int _id, float _x, float _y) {
    xInt=_x;
    yInt=_y;
    id = _id;

    // float xInt=140;
    //float yInt=40;
    tentacolo= new Tentacolo[8];
    head= new Head(xInt, yInt); 
    for (int i=0;i<tentacolo.length; i++) {
      tentacolo[i]=new Tentacolo(xInt, yInt+15, 15);
    }

    println( id + ":  " +  xInt + ", " + yInt );
  }

  void move() {
    if(xInt<width){

      xInt += random(0, 30);
      yInt += random(-20, 10);
    }
    else{
      xInt=-20;
     
    }
  }


  void update() {
    scale(1.04);
    pushMatrix();
    translate(xInt, yInt);
    head.display();
    for (int i=0;i<tentacolo.length; i++) {

      tentacolo[i].update();
      tentacolo[i].display();
      //movement Tentacols
      tentacolo[i].moveTentacols();
    }
    popMatrix();
  }
}

class Tentacolo {
  PVector[] points;
  PVector singlePoint;
  float distance=30;
  int risoluzione;
  float distanceMovement;
  float distanceTot=0;
  float wiggle = 8;
  float x, y;

  //resolution è il numero di punti che ho sul tentacolo

  Tentacolo( float _x, float _y, int _resolution) {
    risoluzione=_resolution; 
    x = _x;
    y = _y;
    points= new PVector[_resolution];


    points[0]= new PVector(random(-wiggle, wiggle), random(8, 10));

    for (int i=1; i< _resolution; i++) {

      float lastX = points[i-1].x;
      float lastY = points[i-1].y;  

      points[i]= new PVector(lastX+random(-wiggle, wiggle), lastY+random(8, 10));
    }
  }

  void moveTentacols() {
    for (int i=1; i<risoluzione;i++) {
     
      distanceMovement = random(-1.5,1.5);
      points[i].x += distanceMovement;
      points[i].x = constrain(points[i].x, -25, 25);
      
      
      /*
      if (distanceTot> -10 || distanceTot<10 ) {
        constrain()
        points[i].x += distanceMovement;
        distanceTot += distanceMovement;
        println("Distanza Aggiunta!");
        println("distanceMovement: " + distanceTot);
        
      }else{
        distanceTot -= distanceMovement;
      println("Distanza MAX RAGGIUNTA!!");
        
      }*/
     
    } 
  }

    void update() {
    }

    void display() {
      strokeWeight(0.75);

      pushMatrix();
      translate(x, y);
      noFill();
      strokeWeight(5);
      stroke(255, 0, 255, 30);
      beginShape();
      curveVertex(points[0].x, points[0].y);  //primo punto nell'array
      //curveVertex(0, 0);  //primo punto nell'array
      for (int i=0; i< risoluzione; i++) {
        //ellipse(points[i].x, points[i].y, 4, 4);
        curveVertex(points[i].x, points[i].y);
      }
      // end controlpoint
      curveVertex(points[risoluzione-1].x, points[risoluzione-1].y); //ultimo punto nell'array
      endShape();
      popMatrix();
    }
  }




