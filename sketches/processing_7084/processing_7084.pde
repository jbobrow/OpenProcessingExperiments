
float x = width/2;   // x position du monstre
float y = 100;     // y position du monstre
float speed = 0;   // vitesse du monstre

// On donne une gravité au monstre pour que lorsqu'il rebondit, il puisse être capable de retomber.   
// On va lui donner une accélération de gravité très minime qui s'accumulera petit à petit.   
float gravity = 0.1;  


void setup() {
  size(256,256, P3D); //Ajout de l'élément P3D pour jouer avec la troisième dimension z.
  frameRate (70); // Ajout d'un taux d'images par seconde personnalisé si l'on veut faire bondir notre monstre plus vite ou plus lentement. 
}

void draw() {
background(255);
  
// Corps du monstre
lights();//ajout de lumière sur la surface 3D.
noStroke();//Sans contours.
fill(46,149,24); //remplir d'une couleur verte.
pushMatrix();
translate(x+width/2, y-10,-24);//position du corps dans l'espace, en x, en y, et en z.
sphere(60);//Création d'une sphère d'un diamètre de 60 pixels.
popMatrix();
  
//Chapeau du monstre.
noLights();//Ne pas ajouter de lumière à la surface 3D.
noStroke();//Sans contours.
fill(152,74,147);//Remplir d'une couleur mauve.
pushMatrix();
translate(x+width/2, y-88, -60);//position dans l'espace du chapeau.
rotateY(-7);//Rotation horizontale du chapeau.
box (55,140,-60);//Forme supérieure du chapeau.
//Bandeau sur le chapeau.
lights();//Ajouter de la lumière sur le bandeau.
fill(67,43,65);//remplir d'une couleur noire.
box (55,20,-60);//Forme du bandeau prenant place par-dessus la forme supérieur du chapeau.
popMatrix();
//Base du chapeau.
lights();//Ajouter de la lumière à la surface.
stroke(153,78,155);//Ajout d'un contour.
fill(64,49,64);//Remplir d'une couleur mauve.
ellipse(x+width/2,y-50,135,PI*2+50);//Forme de la base du chapeau dans l'espace.
//Trou dans le chapeau.
noStroke();//Sans contours
fill(28,23,28);//Remplir d'une couleur mauve foncée.
ellipse(x+width/2,y-50,65,PI*2+30);//Forme du trou du chapeau se situant à l'intérieur de l'éllipse précédente.
//oeil du monstre.
lights();//ajout de lumière à la surface.
noStroke();//sans contour
fill(235,255,18);//Remplir d'une couleur blanche
//translate(x+width/2,y-100,36);
translate(x+width/2,y-27,17); //position de l'oeil par rapport au corps du monstre.
sphere(23);//Donner à l'oeil un diamètre de 25.
//ellipse(x,67,40,25);
//Pupille du monstre
lights();//ajout de lumière à la surface.
noStroke();//sans contour
fill(0);//Remplir d'une couleur noire.
translate(x,-2,6); //position de l'oeil par rapport au corps du monstre.
sphere(18);//Donner à l'oeil un diamètre de 25.

y = y + speed;//ajoute la vitesse aux coordonées verticales du monstre.
  
if (y > 0.60 * height) { //Si le corps du monstre se trouve au 6/10 de la fenêtre en y,
  
    speed = speed * -1.0; //inverser la vitesse du monstre de -1 pour qu'il rebondisse.
    println(speed); //imprimer les coordonnées de la vitesse du monstre.
  } else {
  speed = speed + gravity;//Sinon, ajouter l'accélération de gravité au monstre. 
}
 
 }



