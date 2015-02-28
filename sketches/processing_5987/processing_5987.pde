


int num=16;
Module[][] knoten;

class Module {//----------------------------------klassendef. module
  float x, y ;
  int zeile,spalte;
  // es handelt sich um die Knoten des Netzes mit Verbindung zu den vier nachbarn

  Module(int zeilex,int spaltey,float xx, float yy) {//logische stelle im netz und xy-koordinaten

    float x = xx;
    float y = yy;
    int zeile=zeilex;
    int spalte=spaltey;
  }

  void update() {//--------------------------------module.update
    float fx,fy;
    for ( zeile = 1; zeile < num-1; zeile++) {
      for ( spalte = 1; spalte < num-1; spalte++) {
        if(mousePressed==true){
          knoten[zeile][spalte].x=(800*knoten[zeile][spalte].x +mouseX)/801;
          knoten[zeile][spalte].y=(800*knoten[zeile][spalte].y +mouseY)/801;
        }
        //soweit anziehung maus, nun federkraft:

        //entkopplung der x- und y-koordinaten - insofern physikalisch unkorrekt

        fx=-(abstx(zeile,spalte,zeile+1,spalte)+abstx(zeile,spalte,zeile-1,spalte)+abstx(zeile,spalte,zeile,spalte+1)+abstx(zeile,spalte,zeile,spalte-1))*0.01;
        fy=-(absty(zeile,spalte,zeile+1,spalte)+absty(zeile,spalte,zeile-1,spalte)+absty(zeile,spalte,zeile,spalte+1)+absty(zeile,spalte,zeile,spalte-1))*0.01;
        knoten[zeile][spalte].x= knoten[zeile][spalte].x+fx;
        knoten[zeile][spalte].y= knoten[zeile][spalte].y+fy;
      }
    }
  }
  float abstx(int a, int b,int c, int d){//-----distanz der x-werte zweier gitterpunkte (zeile/spalte - zeile/spalte

    float dis;
    dis=(knoten[a][b].x-knoten[c][d].x);
    if(abs(dis)<30){
      dis=dis*5;
    }

    dis=0.0001*pow(dis,3);

    return dis;
  }
  float absty(int a, int b,int c, int d){//-----distanz der  y-werte zweier gitterpunkte (zeile/spalte - zeile/spalte
    float dis;
    dis=(knoten[a][b].y-knoten[c][d].y);

    if(abs(dis)<30){
      dis=dis*5;// das macht den memory-effekt - einmal zusammen haften die punkte
    }
    dis=0.0001*pow(dis,3);
    return dis;

  }
}


void zeichne() {//------------------------------zeichne das netz und die Punkte
  for ( int zeile = 1; zeile < num-1; zeile++) {
    for ( int spalte = 1; spalte < num-1; spalte++) {
      ellipse(knoten[zeile][spalte].x,knoten[zeile][spalte].y,5,5);
      stroke(0);
      line(knoten[zeile][spalte].x,knoten[zeile][spalte].y,   knoten[zeile-1][spalte].x,knoten[zeile-1][spalte].y);
      line(knoten[zeile][spalte].x,knoten[zeile][spalte].y,   knoten[zeile][spalte-1].x,knoten[zeile][spalte-1].y);


    }
  }
}

void setup() //---------------------------------------------------setup
{
  size(600, 600);
  background(255);
  stroke(0);
  smooth();
  boolean fest;
  noFill();
  knoten = new Module[num][num];

  for (int i = 0; i < num; i++) {
    for (int j = 0; j < num; j++) {
      knoten[i][j] = new Module(i,j,1,1);
      // knoten[i][j].zeile = i; 
      //  knoten[i][j].spalte = j; 
      knoten[i][j].y = 50*i-50; 
      knoten[i][j].x = 50*j-50; 
    }
  }
}

void draw() //---------------------------------------------draw
{
  background (255);
  // knoten[2][2].zeichne();
  zeichne();
  for (int i = 1; i < num-1; i++) {
    for (int j = 1; j < num-1; j++) {
      knoten[i][j].update();

    }
  }

}
















