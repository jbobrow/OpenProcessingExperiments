
// ##############################################################   //
//                                                                  //                                                                       
// ---------  |\    |        Universidad Industrial de Santander    // 
//     |      | \   |              Ing. Electrónica                 //
//     |      |  \  |         Autor: Jesús D. Bonilla Neira         // 
//     |      |   \ |            7 - 07 - 2014 ( 1.0 )              //
// ____|    . |    \|.           Musica en Processing               // 
//                                                                  //
// ##############################################################   //


/*  Código para la implementación de pistas de múscia en un programa de Processing 2.2.1, 
    usando la libreria de java Minim referencias ...
    *[ http://code.compartmental.net/tools/minim/ ]
    *[ http://code.compartmental.net/minim/ ] 
    * AudioPlayer player puede ser reemplazado por AudioPlayer groove
    se obtendrá en mismo funcionamiento
 */


import ddf.minim.*;    // se importa la libreria de minim.
Minim minim;           // se nombra y se carga la libreria.
AudioPlayer player;    // activamos el AudioPlayer para poder reproducir archivos en lo formatos de audio.
 
 
void setup() {                          // se establecen las condiciones iniciales.
  size(200, 200);                       // un marco aleatorio como se desee.
  background(#334DA7);                  // seleccionamos el color deseado.
  minim = new Minim(this);                // creamos un nuevo objeto minim.
  player = minim.loadFile("nombre_pista.wav", 2048);   //  Cargamos el archivo de música previamente ubicado en la carpeta junto al sketch.
}      // El archivo de musica puede ser .wav .mp3 . AIFF 
       // REEMPLAZAR (nombre_pista.mp3) por el nombre de la pista deseada y su respectiva extensión.

void draw() {
}

void keyPressed() {
  if ( key == 'a' ) player.loop();      // para reproducirlo pulsamos la tecla (A).
  if ( key == 's' ) player.pause();     // para pausarlo pulsamos la tecla (S). 
}          // una vez pausado al volver a oprimir la tecla (A) se reiniciará la pista.



