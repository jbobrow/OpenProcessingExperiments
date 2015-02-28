
Satelite[] sat1=new Satelite[10];
void setup() {
  background(0);
  size(900,450);
  smooth();
  noCursor();
  for(int i=0;i<sat1.length;i++) {
    sat1[i]=new Satelite(random(-1,1),random(-1,1),random((width/2)*-1,width/2),random((height/2)*-1,(height/2)),random(50,200));
  }
}
void draw() {
  codeArqaissa();
}
void codeArqaissa() {
  noStroke();
  fill(0,20);
  rect(0,0,width,height);
  pushMatrix();
  translate(width/2,height/2);
  for(int i=0;i<sat1.length;i++) {
    sat1[i].showUp();
  }
  if(mousePressed==true)nuevoSatelite(random(width),random(height));
  popMatrix();
}
void nuevoSatelite(float rCx_,float rCy_) {
  float rCx_1=rCx_;
  float rCy_1=rCx_;
  Satelite[] sat2=new Satelite[10];
  for(int i=0;i<sat2.length;i++) {
    sat2[i]=new Satelite(random(-10,5),random(-5,10),random(-1*rCx_1,rCx_1+10),random(-1*rCy_1,rCy_1+10),random(50,200));
    sat1=(Satelite[])append(sat1, sat2[i]);
  }
}
///////////
class Satelite {
  //variables de clase
  float posicionX,posicionY,velocidadX,velocidadY,sentidoX,sentidoY,
  vida,uno,dos,tres,cuatro,cinco,seis,siete,ocho,nueve,diez,
  rUno,rDos,rTres,rCuatro,rCinco,rSeis,rSiete,rOcho,rNueve,rDiez,panza;
  float enfermedad=random(90,210); //tiempo de vida
 //particula 
  Satelite(float velocidadX,float velocidadY,float posicionX,float posicionY, float panza) {
    this.posicionX=posicionX;
    this.posicionY=posicionY;
    this.velocidadX=velocidadX;
    this.velocidadY=velocidadY;
    this.sentidoX=random(-2,3);
    this.sentidoY=random(-4,5);
    this.vida=0;
    this.panza=panza;
  }
  //visualizacion
  void showUp() {
    this.posicionX+=random((this.velocidadX*this.sentidoX)-10,(this.velocidadX*this.sentidoX)+10);
    this.posicionY+=random((this.velocidadY*this.sentidoY)-10,(this.velocidadY*this.sentidoY)+10);
    if(this.vida<enfermedad) {
      uno=noise(rUno)*50;
      dos=noise(rDos)*5;
      tres=noise(rTres)*50;
      cuatro=noise(rCuatro)*50;
      cinco=noise(rCinco)*50;
      seis=noise(rSeis)*45;
      siete=noise(rSiete)*45;
      ocho=noise(rOcho)*25;
      nueve=noise(rNueve)*20;
      diez=noise(rDiez)*20;
      strokeWeight(1);
      stroke(255,seis);
      fill(255,seis);
      ellipse(posicionX+uno,posicionY+tres,dos,dos);
      ellipse(posicionX-cuatro,posicionY+cinco,dos,dos);
      ellipse(posicionX+tres,posicionY-cinco,dos,dos);
      ellipse(posicionX-cuatro,posicionY-uno,dos,dos);
      ellipse(posicionX,posicionY+tres,dos,dos);
      ellipse(posicionX,posicionY-cinco,dos,dos);
      ellipse(posicionX+uno,posicionY,dos,dos);
      ellipse(posicionX-cuatro,posicionY,dos,dos);
      stroke(255,map(siete,0,90,50,200));
      noFill();
      bezier(posicionX+uno,posicionY+tres,posicionX+ocho,posicionY-ocho,posicionX-ocho,posicionY+ocho,posicionX-cuatro,posicionY-uno);
      bezier(posicionX-cuatro,posicionY+cinco,posicionX-ocho,posicionY+ocho,posicionX+ocho,posicionY-ocho,posicionX+tres,posicionY-cinco);
      bezier(posicionX,posicionY+tres,posicionX+ocho,posicionY+ocho,posicionX-ocho,posicionY-ocho,posicionX,posicionY-cinco);
      bezier(posicionX+uno,posicionY,posicionX-ocho,posicionY-ocho,posicionX+ocho,posicionY+ocho,posicionX-cuatro,posicionY);
      stroke(255,seis);
      if (vida%3000>=0 && vida%3000<=21) {
        fill (random(100,255),random(50,200),0,random(200,255));
      } 
      else {
        fill(0,panza,random(100,255),random(150,200));
      }
      ellipse(posicionX+random(10),posicionY+random(10),nueve,nueve);
      ellipse(posicionX-random(10),posicionY-random(10),diez,diez);
    }
    rUno   += random (1.0);
    rDos   += random (1.0);
    rTres  += random (1.0);
    rCuatro+= random (1.0);
    rCinco += random (1.0);
    rSeis  += random (1.0);
    rSiete += random (1.0);
    rOcho  += random (1.0);
    rNueve += random (1.0);
    rDiez  += random (1.0);
    vida++;
  }
}
                                
