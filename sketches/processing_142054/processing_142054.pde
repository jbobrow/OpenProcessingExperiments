
import twitter4j.*;  // import de la bibliothèque twitter4j
import java.util.List;  // import pour l'execption de list Array
PImage img;
String texte = ""; // chaine de caractére du flux twitter
int compteur = 0; // compteur de boucle


void setup() {
  size(960, 640);
  img = loadImage("Mal1.jpg");
  background(0);
  frameRate(500);
  //Récupération de la timeline Twitter
  ConfigurationBuilder cb = new ConfigurationBuilder(); // configuration du builder en fonction de l'app définie sur @dev.twitter.com
  cb.setDebugEnabled(true)
    .setOAuthConsumerKey("Fjf09aeM5ElXyAyjRVEbzQ") // Configuration de l'app twitter @dev.twitter.com
      .setOAuthConsumerSecret("QMxYBXZ6oCX8p5Lsh6jImX6txO4mEp3LLyaNWg")
        .setOAuthAccessToken("514410642-heuT9r0lYGT718FhJm6em1MVPBRrPUyIINKLVz3L")
          .setOAuthAccessTokenSecret("ErbY8iJKlRX2vOwmEzEKiGg89ZV5PGb83ke0ls4kWUVLa");// fin configuration
  TwitterFactory tf = new TwitterFactory(cb.build());
  Twitter twitter = tf.getInstance();

  List<Status> statuses = null;
  try {
    statuses = twitter.getHomeTimeline();
  }
  catch(TwitterException e) {
    println("Exception: " + e + "; statusCode: " + e.getStatusCode());
  }

  System.out.println("Showing home timeline.");
  for (Status status : statuses) { //Récupération des Tweets
    System.out.println(status.getUser().getName() + ":" +
      status.getText());
      texte = texte + status.getText(); //génération du flux de texte pour le Strings
  }
}

void draw() {
  compteur ++;
  if ( compteur >= texte.length()-1) { noLoop();} // Boucle stopee quand plus de tweets
  char lettre = texte.charAt(compteur); // génération de la chaine de caractere
  int x = int(random(img.width));  // Choix alétoire de la pixel en X
  int y = int(random(img.height)); // Choix alétoire de la pixel en Y
  color couleur = img.get(x, y); // récupération de la couleur de la pixel
  fill(red(couleur), green(couleur), blue(couleur));// génération de la lettre en fonction de la couleur récuperer
  float bx = x + random(-20, 20);
  float by = y + random(-20, 20);
  text(lettre, x, y); 
}

void keyPressed() {
  if (key == 's') saveFrame("resultat_" + millis() + ".png"); // sauvegarde de l'image en png
  if (key == 'p') noLoop(); // arret de la boucle
  if (key == 'q') loop(); // démarrage de la boucle
}



