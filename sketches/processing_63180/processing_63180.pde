
void setup() {
   //largeur, hauteur du sketch
   //size(800, 600);
   // Size of canvas (width,height)
   size(width,height);
   //couleur de fon du sketch
   background(255);
   //antialiasing des lignes
   smooth();
   //frameRate(10);
}
float Mspeed;

void draw() {
   Mspeed=abs(mouseX-pmouseX);
   if (mousePressed == true) {
      //Une ligne:
      //Coordonnées du point d'origine: X=le bord gauche soit 0 sur l'axe X   ///////  Y= hauteur de la souris sur l'axe Y,
      //Coordonnées du point d'arrivée: X= bord droit soit 800 sur l'axe Y    ///////  Y= valeur de la position X de la souris
      
      //   strokeWeight(0.1+Mspeed/20);
      stroke(0);
      line(mouseX, mouseY, width, mouseX); 
      line(mouseX, mouseY, 0, mouseX); 
      float taille_ellipse1=random(150,200);
      float taille_ellipse2=random(100,150);
      float taille_ellipse3=random(50,100);
      float taille_ellipse4=random(200,400);
      noStroke();
      fill(255, 10);
      ellipse(mouseX,mouseY, taille_ellipse4,taille_ellipse4);
      
      fill(255, 20);
      ellipse(mouseX,mouseY, taille_ellipse1,taille_ellipse1);
      fill(255, 30);
      ellipse(mouseX,mouseY, taille_ellipse2,taille_ellipse2);
      fill(255, 60);
      ellipse(mouseX,mouseY, taille_ellipse3,taille_ellipse3);
      
      
   }
   if (keyPressed == true) {
      //saveFrame(); 
      background(255);
   }
   
   //fermeture de draw
}
