

//left-click with the mouse at different places, try the right mousebutton to restart
//- key and + key control, if the lines vanish or not
void setup() 
{
  size(800, 600);
  background(255);
  smooth();

}

float x1=100,x2=200,x3=300,x4=600;
float y1=300,y2=300,y3=300,y4=300;
float cx1,cx2,cx3,cx4;
float cy1,cy2,cy3,cy4;
float r1=50,r2=100,r3=50,r4=100;
float t1=1,t2=1,t3=1,t4=-1;
float mx=20,my=20;
float fakt=2*PI/100;
int z1=1,z2=1,z3=1,i=-1,trans=30;

// beim Lösen der Maustaste werden Startbedingungen neu gesetzt
void mouseReleased(){
  mx=(-400+mouseX)/4;//abhängig von Mausposition verschieben sich die Ankerpunkte
  my=(-300+mouseY)/3;
  x1=200.0-2*mx;
  y1=300.0-my;
  x2=333.0+mx+random(-30,30);
  y2=300.0+my+random(-30,30);
  x3=466.0+mx+random(-30,30);
  y3=300.0+my+random(-30,30);
  x4=600.0+2*mx;
  y4=300.0+my;
  // r und t bestimmen (in Polarkoordinaten) die Kontrollpunkte
  r1=random(0,300);
  r2=random(0,300);
  r3=random(0,300);
  r4=random(0,300);
  t1=random(0,2*PI);
  t2=random(0,2*PI);
  t3=random(0,2*PI);
  t4=random(0,2*PI);

  stroke(random(150,180),random(80,100),random(10,70));
}

// die + und die -Taste steuern die Stärke der Löschung alter Linien
void keyPressed(){
  if(key=='+'){
    trans=trans+1;
    constrain(trans,0,255);
  } 
  if(key=='-'){
    trans=trans-1;
    if(trans<0){
      trans=0;
    }
  }
}

void draw() 
{ 
  if (mousePressed==true){
    //solange Maustaste gedrückt werden die Linien mit ständig veränderten Paramtern gezeichnet
    //Schrittweite ist ein Hundertstelkreis - 2*Pi/100
    //z ist  1 oder -1 und bestimmt, wie sich die Kontrollpunkte drehen


    i=i+1;
    if(i>100){
      i=-1;  
    }
    fill(255,trans);
    rect(0,0,800,600);//Verschwinden lassen der alten Linien
    //Unmsetzen auf kartesische Koordinaten

    cx1=r1*sin(t1+z2*i*fakt);
    cy1=r1*cos(t1+z2*i*fakt);
    cx2=r2*sin(t2+z1*i*fakt);
    cy2=r2*cos(t2+z1*i*fakt);
    cx3=r3*sin(t3+z2*i*fakt);
    cy3=r3*cos(t3+z2*i*fakt);
    cx4=r4*sin(t4+z3*i*fakt);
    cy4=r4*cos(t4+z3*i*fakt);
    // println(z1+" "+z2+" "+z3);


    // drei Einzelkurven, die wegen genau entgegengesetzer Kontrollpunkte
    // ohne Knick zusammen passen

    noFill();
    bezier(x1,y1,x1+cx1,y1+cy1,x2+cx2,y2+cy2,x2,y2);
    bezier(x2,y2,x2-cx2,y2-cy2,x3+cx3,y3+cy3,x3,y3);
    bezier(x3,y3,x3-cx3,y3-cy3,x4+cx4,y4+cy4,x4,y4);

    //bei Rechtsclick wird die Zeichenfläche gelöscht
    if (mouseButton==RIGHT){
      fill(255);
      rect(0,0,800,600);
      i=0;

      //außerdem werden die z-Werte neu auf 1 oder -1 gesetzt,
      // die bestimmten, wie herum die Kontrollpunkte wandern.
      //die etwas umständliche Form mit "if" vermeidet Probleme mit
      //int-float-Umwandlungen
      z1=int(random(0,2));
      if(z1==0){
        z1=1;
      }
      else{
        z1=-1;
      }
      z2=int(random(0,2));
      if(z2==0){
        z2=1;
      }
      else{
        z2=-1;
      }
      z3=int(random(0,2));
      if(z3==0){
        z3=1;
      }
      else{
        z3=-1;
      }
    }
  }
}













