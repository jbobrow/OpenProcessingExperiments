
/*AMO WINDOWS*/
PFont tipo;
Tache tache;
float pix, piy, pfx, pfy;
int q=100, s, opac=255, comienza=0;

void setup() {
  size(1600, 800);
  background(0);

  pix=random(width);
  piy=random(height);
  pfx=random(width-pix);
  pfy=random(height-piy);
  tipo = loadFont("CourierNew36.vlw"); 
  textFont(tipo); 
  tache= new Tache();
}


void draw() {
  fill(0, 0, 200, 10);
  noStroke();
  rect(0, 0, width, height);

  fill(255, opac);
  pushMatrix();
  scale(0.4);
  text("Se ha encontrado un problema y Windows ha sido apagado para evitar daños al equipo.", 100, 70);
  text("Si esta es la primera vez que ve esta pantalla de error de detección, reinicie su equipo.", 100, 140);
  text("Si esta pantalla aparece otra vez, siga los siguientes pasos:", 100, 210);
  text("Compruebe que tiene el espacio en disco adecuado. Si un controlador está identificado en el mensaje de detención,", 100, 280);
  text("deshabilite el controlador o pregunte al fabricante por controladores actualizados. Pruebe a cambiar los adaptadores de video.", 100, 350);
  text("Compruebe con su proveedor de hardware si existen actualizaciones de la BIOS.", 100, 420);
  text("Deshabilite las opciones de memoria de la BIOS como caché o vigilancia.", 100, 490);
  text("Si necesita usar el modo a prueba de fallos para eliminar o deshabilitar componentes, reinicie su equipo,", 100, 560);
  text("presione la tecla F8 para seleccionar opciones de inicio avanzadas y seleccione el modo a prueba de errores.", 100, 630);
  text("Información técnica:", 100, 700);
  text("*** STOP: 0x0000008E (0x0000005, 0x8052BA34, 0xA89EAFEA, 0x00000000)", 100, 770);
  text("Empezando el volcado de memoria física", 100, 840);
  scale(1.2);
  text("Pulse TAB para iniciar", 100, 840);
  popMatrix();


  if (comienza ==1) {
    if (s%2==0) {
      opac-=10;
      evaluar();
      stroke(0, 0, 150);
      strokeWeight(1);
      point(pix, piy);
      fill(255, 10);
      rect(pix, piy, pfx, pfy);
      for (int i=0;i<30;i++) {
        rect(pix+i, piy+i, pfx-i, pfy-i);
      }
      stroke(120, 100);
      rect(pix, piy, pfx, pfy);
      fill(255);
      text("error", pix+50, piy+20);
      tache.dibuja();
    }
    s=s+second();
    println(second());
  }
}
void evaluar() {
  // frameRate(5);
  pix=random(width);
  piy=random(height);
  pfx=random(width-pix);
  pfy=random(height-piy);
}

class Tache {

  void dibuja() {
    stroke(0);
    strokeWeight(1.5);
    fill(100);
    rect(pix+5, piy+5, 20, 20);
    line(pix+7, piy+7, pix+22, piy+22);
    line(pix+7, piy+22, pix+22, piy+7);
  }
}


void keyPressed() {
  if (keyCode == TAB) {
    comienza =1;
  }
}


