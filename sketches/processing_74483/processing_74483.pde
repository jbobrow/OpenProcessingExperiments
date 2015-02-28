

class Mover {

  // Our object has two PVectors: location and velocity
  PVector acceleration;
  PVector location;
  PVector velocity;
  PVector mouse;
  int ellipsize = 5;

  float col;
  float hcol;

  Mover() {
    location = new PVector(random(width), random(height));
    acceleration =new  PVector(random(25), random(25));
  }

  void update() {
    // Motion 101: Locations changes by velocity.
   // acceleration = new PVector(random(25), random(25)); /// accㅇㅔ
    velocity = new PVector(random(-5, 5), random(-5, 5));
    velocity.add(acceleration);
    location.add(velocity);

    if (ellipsize>8) {
      ellipsize=5;
    }
    if (ellipsize<2) {
      ellipsize=5;
    }
    
    col = random(120, 180);
    hcol = random(100, 250);
    
  }

  void display( ) {
    noStroke();
    colorMode(RGB);
    //fill(col);
    //fill(col,40,90,hcol);
    fill( 10, 100 + location.x/width*150,location.y/height*100,hcol); // ㅍㅡㄹㄹㅔㄱㅅㅡ ㅂㅕㄴㅅㅜ
    ellipse(location.x, location.y, ellipsize, ellipsize);
  }

  void checkLocation() {
    mouse = new PVector ( mouseX, mouseY);
    PVector s = new PVector(0, 0);
    s=PVector.sub(location, mouse);
    if ( s.mag() < 80)
    {
      ellipsize = ellipsize+2; 
      location = new PVector(random(width), random(height));
      //location = new PVector(width/2, height/2);
    } 

    if ( s.mag() > 370)
    {

      ellipsize = ellipsize - 2; 
      //   location = new PVector(mouseX,mouseY);
      location = new PVector(width/2, height/2);
      //location = new PVector(random(width), random(height));
      
       //ellipse(location.x, location.y, ellipsize-10, ellipsize-10);
    }
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } 
    else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } 
    else if (location.y < 0) {
      location.y = height;
    }
  }

  //  void reset(){
  //location = new PVector(random(width), random(height));
  //this.update();
  //  }
}

int accX = 0;
int accY = 4;
int accZ = 10; // acc* 160-210

int piezoIn = 0;
int piezoThres = 200; 

void setup() {
  size(700, 700);
  smooth();
  frameRate(40);
  // Make Mover object array
  for (int i = 0; i < n; i++)
  {
    mover[i] = new Mover();
  }

  for (int i=0; i<flexIn; i++) {
    flexMover[i] = new fMover();
  }
}

void draw() {
  background(0);

  noStroke();
  fill(255, 15);
  rect(0, 0, width, height);

  circleMover();
  updateMover();
  checkFlex();
 // connFlex();
  delay(50);
}


int flexIn = 100;// 160 - 200
fMover[] flexMover=new fMover[flexIn];

void checkFlex() {
  for (int i = 0; i < flexIn ; i++)
  {
    // flexMover[i] = new fMover();
    flexMover[i].update();
    flexMover[i].display();
    flexMover[i].checkEdges();
  }
}

void connFlex() {
  for (int k = 0; k<(flexIn-1); k++)
  {
    float px= flexMover[k].location.x;
    float py=flexMover[k].location.y;
    float x = flexMover[k+1].location.x;
    float y = flexMover[k+1].location.y;
    
    stroke(random(40,130));
    line ( mouseX, py , x, mouseY);
  }
}

int n =170; //ㅍㅡㄹㄹㅔㄱㅅㅡㅂㅕㄴㅅㅜ
Mover[] mover =new Mover[n];

void circleMover(){
 float radi;
 
  for (int k = 0; k< n ; k =k+5)
  {
    PVector mid = new PVector ( width/2, height/2);
    PVector flex = mover[k].location;    
    PVector s = new PVector(0,0);
    s = PVector.sub(flex, mid);
    
//    radi = (radi + s.mag())/(k+1);
    radi = s.mag();
    println(radi);
    noFill();
    stroke(random(22,42));
    ellipse(mid.x+random(-5,5), mid.y+random(-5,5), 700-2*radi,700-2*radi);
   // ellipse(mid.x+random(-5,5), mid.y+random(-5,5),  0.5*radi*cos(TWO_PI*random(-1,1)) ,  0.5*radi*sin(TWO_PI*random(-1,1)));
  }
 //radi = 0;  
}
void updateMover() {
   PVector rota = new PVector (25* cos(frameCount%23), 25*sin(frameCount%11));
   
  // Call functions on Mover object.
  for (int i = 0; i < n; i++)
  {
    mover[i].update();
    mover[i].display();
    mover[i].checkEdges();
    mover[i].checkLocation();
    if ((frameCount%12)==0){
        mover[i].acceleration = rota;
    }
  }
  // PVector init = new PVector (random (width), random(height));
  //  if (mousePressed)
  //  {
  //    for (int i = 0; i < n; i++)
  //    {
  //      mover[i].location =init;
  //      mover[i].ellipsize=16;
  //    }
  //  }  //Random Floating
}


