
import processing.serial.*;

String portName = "/dev/tty.usbmodem411";

Serial serial;

int photo;
int potentiometre;
int boutton;


void setup() {
  size(500, 500, P3D);

  // Affiche les noms des ports.
  println(Serial.list());

  // Creer une instance de la classe Serial avec
  // une vitesse de 57600 baud:
  serial = new Serial(this, portName, 57600);

  // Indiquer a l'instance serial de lancer la fonction serialEvent()
  // lorsque l'octet 13 est recu. L'octet 13 est envoye par
  // l'Arduino pour indiquer la fin du message
  serial.bufferUntil(13);
}

// Definir une fonction pour recevoir les donnees du port serie:
void serialEvent(Serial p) {

  // Lire le message.
  String chaine = p.readString();

  // Separer les elements du message
  // selon les espaces:
  String[] tableauDeChaines = splitTokens(chaine);

  // S'assurer qu'il y a bien deux mots
  // dans le message et les appliquer aux variables :
  if ( tableauDeChaines.length == 2 ) {
    String premier = tableauDeChaines[0];
    int deuxieme = int(tableauDeChaines[1]);
    // On peut "router" les messages en comparant le premier Ã©lÃ©ment :
    if ( premier.equals("potentiometre") ) {
      potentiometre = deuxieme;
    } else if ( premier.equals("boutton")) {
      boutton = deuxieme;
    } else if ( premier.equals("photo")) {
      photo = deuxieme;
    }
  }
}

void draw() {
  background(photo+100);

  textAlign(CENTER, CENTER);
  //text( "Potentiometre : " + potentiometre, width * 0.5, height * 0.5);
  if (boutton == 1)
  {
    translate(width/2, height/2, 0); 
    rotate((potentiometre/1023)*100);
    noFill();
    box(100);
  } else if (boutton == 0)
  {
    translate(width/2, height/2, 0); 
    rotate(potentiometre);
    sphereDetail(5);
    noFill();

    sphere(100);
  }
}

