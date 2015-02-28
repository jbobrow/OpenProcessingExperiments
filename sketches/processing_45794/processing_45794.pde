
/*por Eduardo H Obieta
 hackpact de arte generativo
 www.artegenerativo.laad.com.mx
 */
//constelaciones
//VARIABLES

int gota=800, tmin=1, tmax=3;
float px[], py[], vel[], dirx[], diry[], tam[];
//SET
void setup() {
  size(800, 400);
  background(0);
  smooth();
  //DEFINIR
  px=new float[gota];
  py=new float[gota];
  vel=new float[gota];
  dirx=new float[gota];
  diry=new float[gota];
  tam=new float[gota];
  //INICIAR
  for (int p=0; p<gota; p++) {
    px[p]=random(-width/2, width/2);
    py[p]=random(-height/2, height/2);
    vel[p]=random(tmin, tmax-2);
    tam[p]=random(tmin, tmax);
  }
}
//DRAW
void draw() {
  //mapeo  
  float m=map(mouseX, 0, width, -4, 4);
  //trasladar
  pushMatrix();
  translate(width/2, height/2);
  noStroke();
  //DIBUJAR
  fill(0);
  rect(-width/2, -height/2, width, height);
  for (int i=0; i<gota-1; i++) {
    vel[i]=1+mouseY*0.003;
    //OBJETOS
    stroke(255, 40+random(tmax*15));
    strokeWeight(tam[i]);
    point(px[i], py[i]);
    //POSICIONES  
    px[i]+=dirx[i];
    py[i]+=vel[i];
    float varia=5;
    dirx[i]=m*noise(varia)*1.5;
    if (px[i]>width/2) {
      px[i]=-width/2+random(0.01, 2);
    }
    if (px[i]<-width/2) {
      px[i]=width/2-random(0.01, 2);
    }
    if (py[i]>height/2) {
      py[i]=-height/2+random(0.01, 2);
      px[i]=random(-width/2, width/2);
    }
    if (py[i]<-height/2) {
      py[i]=height/2-random(0.01, 2);
    }
  }
  stroke(255, 45);
  strokeWeight(0.75);

  for (int i=0; i<gota/60-1;i++) {
    line(px[i], py[i], px[i+1], py[i+1]);
  }
  line(px[0], py[0], px[gota/60-1], py[gota/60-1]);

  //LIBERA
  popMatrix();
}


