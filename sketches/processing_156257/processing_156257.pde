
Formes [] formes;
int x = 0;

void setup(){
  formes = new Formes[20];
  for( int i = 0; i < 19; i++){
    formes[i] = new Formes(random(1280), random(720), random(100), int(random(250)), int(random(1)), new int[10],  new int[10], 0, 0, random(360));
  }
  size( 1280, 720,P2D);
  frameRate(30);
  smooth();
}

void draw(){
  
  background(0);
  for( int i = 0; i < 19; i++){
  formes[i].draw();
  }
 // saveFrame("caré_######.png");
}

class Formes {
  float wdth;
  float hght;
  float rand;
  float taille;
  int poly;
  int posDebrisX [];
  int posDebrisY [];
   float a;
   float b;
   float randomRot;
       boolean explose;
  Formes( float wdth, float hght, float rand, int taille, int poly, int posDebrisX [], int posDebrisY [], float a, float b, float randomRot) {
    this.wdth = wdth ;
    this.hght = hght ;
    this.rand = rand ;
    this.taille = taille;
    this.poly = poly ;
    this.posDebrisX = posDebrisX;
    this.posDebrisY = posDebrisY;
    this.a = a;
    this.b = b;
    this.randomRot = randomRot;
  }
  
  void setup(){
    explose = true;
  }
  void draw() {
    pushMatrix();
    translate( wdth, hght);
    rotate(radians(a + randomRot));
    rectMode(CENTER);
    fill(a*20, 200);
    stroke(b*10);


    if ( mousePressed == true || explose == true) {
      
      explose = true;
      
      //0
      pushMatrix();
      posDebrisY[0] = posDebrisY[0] - 9;
      translate(posDebrisX[0], posDebrisY[0]);
      quad(-10*taille /20, -10*taille /20, 10*taille /20, -10*taille /20, 5*taille /20, -7*taille /20, 0*taille /20, 0*taille /20);
      popMatrix();


      //1
      pushMatrix();
      posDebrisY[1] = posDebrisY[1] - 9;
      posDebrisX[1] = posDebrisX[1] - 3;
      translate(posDebrisX[1], posDebrisY[1]);
      quad(-10*taille /20, -10*taille /20, -10*taille /20, -4*taille /20, -6*taille /20, 0*taille /20, 0*taille /20, 0*taille /20);
      popMatrix();

      //2
      pushMatrix();
      posDebrisY[2] = posDebrisY[2] - 1;
      posDebrisX[2] = posDebrisX[2] + 9;
      translate(posDebrisX[2], posDebrisY[2]);
      quad(5*taille /20, -7*taille /20, 10*taille /20, -1*taille /20, 5*taille /20, 2*taille /20, 0*taille /20, 0*taille /20);
      popMatrix();

      //3
      pushMatrix();
      posDebrisY[3] = posDebrisY[3] - -9;
      posDebrisX[3] = posDebrisX[3] - 0;
      translate(posDebrisX[3], posDebrisY[3]);
      quad(-10*taille /20, 0*taille /20, 0*taille /20, 7*taille /20, -2*taille /20, 3*taille /20, 0*taille /20, 0*taille /20);
      popMatrix();

      //4
      pushMatrix();
      posDebrisY[4] = posDebrisY[4] - 3;
      posDebrisX[4] = posDebrisX[4] - 9;
      translate(posDebrisX[4], posDebrisY[4]);
      quad(-10*taille /20, 0*taille /20, 0*taille /20, 7*taille /20, -10*taille /20, 7*taille /20, -10*taille /20, 1*taille /20);
      popMatrix();

      //5
      pushMatrix();
      posDebrisY[5] = posDebrisY[5] -5;
      posDebrisX[5] = posDebrisX[5] - 5;
      translate(posDebrisX[5], posDebrisY[5]);
      quad(10*taille /20, 7*taille /20, 0*taille /20, 7*taille /20, -2*taille /20, 3*taille /20, 0*taille /20, 0*taille /20);    
      popMatrix();

      //6
      pushMatrix();
      posDebrisY[6] = posDebrisY[6]  +5;
      posDebrisX[6] = posDebrisX[6]  +3;
      translate(posDebrisX[6], posDebrisY[6]);
      quad(10*taille /20, -10*taille /20, 10*taille /20, -1*taille /20, 8*taille /20, -4*taille /20, 9*taille /20, -8*taille /20);
      popMatrix();

      //7
      pushMatrix();
      posDebrisY[7] = posDebrisY[7] +3;
      posDebrisX[7] = posDebrisX[7] - 4;
      translate(posDebrisX[7], posDebrisY[7]);
      quad(10*taille /20, -1*taille /20, 10*taille /20, 7*taille /20, 2*taille /20, 1*taille /20, 5*taille /20, 2*taille /20);
      popMatrix();
    } 
    else { 
         a= cos( ((frameCount) + rand)/17) * 14;
        b= sin( ((frameCount) + rand)/10) * 10;
    if ( poly== 0) {
     
        rect(0, 0, taille, taille);
    }
          else if( poly >0){
        ellipseMode(CORNER);
        ellipse( 0, 0, taille, taille);
    }
    
      }
    
   
    popMatrix();
  }
}

