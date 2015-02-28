

//definim tipus de variables
float x;
float y;
float z;
int ample;
int alt;
float reduccio;
float angle;
float time;

void setup(){
  size(500,500);
z=0;
  smooth();// no volem que la forma que farem quedi tancada
  angle=0;
  reduccio=0;
  time=0;
  ample=10;
  alt=10;
}

void draw(){
  x=mouseX;//fem que l'elipse que fa de cursor es mogui acompasada amb el mouse
  y=mouseY;
  background(255);
  fill(0);
ellipse(x,y,ample,alt);
 
 stroke(mouseX-125,mouseX-mouseY,mouseY-250);//fem que les formes tinguin una dimàmica de colors
 strokeWeight(5); 
   noFill();
   textSize(80);
   pushMatrix();//l'acció que farem a continuació la volem només per un cas en concret
translate(250,250);//traslladem el punt 0,0 al centre de la finestra
rotate(angle);//així farem girar la figura següent al voltant del centre de la pantalla
  beginShape();
  vertex(25+z,25+z);
  vertex(25+z,-25-z);
  vertex(-25-z,-25-z);
  vertex(-25-z,75+z);
  vertex(75+z,75+z);
  vertex(75+z,-75-z);
  vertex(-75-z,-75-z);
  vertex(-75-z,125+z);
  vertex(125+z,125+z);
  vertex(125+z,-125-z);
  vertex(-125-z,-125-z);
  vertex(-125-z,175+z);
  vertex(175+z,175+z);
   endShape();//les variables z que li hem donat són per estrenyer la figura en funció d'aquesta
  popMatrix();
  time+=0.01;//la variable temps paricipa en les condicions següents
  z=z-0.025;
  angle +=0.001;
  reduccio-=0.001;

  if(((time<=10)&&(x>240)&&(x<260)&&(y<260)&&(y>240))==true){//si el cursor és al centre de la pantalla abans que la variable temps arribi a 10, aparaixerant unes lletres indicant que has guanyat
    fill(255);
    strokeWeight(50);
    text("YOU WIN!!!",50,250);
    z=1000;
    ample=10000;
    alt=10000;
    time=0;//fem que la variable temps torni a zero perquè no ens pugui sortir que hem perdut si abans hem guanyat
    
  }

    if(!((x>240)&&(x<260)&&(y<260)&&(y>240))&&(time>10)==true){//si no es compleix la posició anterior del cursor i la vareiable temps es més gran a 10 doncs apareixen unes lletres indicant que has perdut
    fill(255,0,0);
    strokeWeight(50);
    text("YOU LOSE...",40,250);
    z=1000;
    ample=10000;
    alt=10000;
    }
    if(mousePressed){//si cliquem el botó del ratolí les variables tornen al seu valor inicial, però cal que no tinguem situat el cursor al mig de la pantalla, perquè sino activaria la condició de victoria
    z=0;
    ample=10;
    alt=10;
    time=0;
      }
    }
//el problema que no he pogut solucionar, és que l'elipse no pogués atravessar les linies que formaven el laberint, si se'n pot dir així.



