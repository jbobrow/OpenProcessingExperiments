
/* my first sketch ever
 * simple tweak of Recursive Tree by Daniel Shiffman.  
 * Renders a simple tree-like structure via recursion. 
 * The branching angle is calculated as a function of 
 * the horizontal mouse location. Move the mouse left
 * and right to change the angle.
 * modification par replica3363
 * pour ce look 70's tree
 */
 
float theta;   
/*
// to use openGL on android
// android renderer is slower
  public String sketchRenderer() {
    return P3D;
  }
*/

void setup() {
  //size(800, 800, P3D); // for linux that P3D stucks windows export
  //size(720, 1280);     // for my android
  size (800,800);        // for web applet 
  colorMode(HSB,60);
}

void draw() {
  background(0);
  frameRate(30);
  stroke(255);
  // Let's pick an angle 90 to 450 degrees based on the mouse position
  // le 0 a 90 degré d'origine trop limité esthétiquement
  // je préfere de 90 à 450
  float a = 90 + (mouseX / (float) width) * 360f;
  // Conversion radians
  theta = radians(a);
  // vertical mouse position
  float b = (height - mouseY);
  // centre of l'ecran
  translate(width/2,height);
  // height of mouse
  translate(0, - b);
  //translate(0, - height/2);
  // recursion!
  branch(b);

}

void branch(float h) {
  // control iteration number by vertical mouse position
  // pour controller le nombre de recursions par position verticale de la souris
  // j'en fais dépendre le facteur de longueur de branchement
  h *=((mouseY) / (float) height);
  // limit recursion depth to avoid cpu overload, stop recursion to height/30
  // je limite la profondeur de récursion pour éviter de tanker la fluidité
  // je stoppe la récursion à une longueur de branche de height/30 pixels
  if (h > (height/30)) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    // thicknes depends of h
    //épaisseur du trait dépend de h
    strokeWeight(h/20);
    // color too
    // couleur du tracé dépend aussi de h
    stroke(h,h,h);
    line(0, 0, 0, -h);  // trace branch
    // ellipse fill color
    // couleur de remplissage des ellipses
    fill(h,h,0); // zero breaks symmetry le 0 permet de casser la symmétrie des couleurs
    //ellipse(0,-h,h,h); // first attempt too perfect - premiere tentative, trop parfait !
    ellipse(h,-h,h,h);   // here circles drift from the tree - ici les cercles dérivent de l'arbre 
    translate(0, -h);    // go to end of branch - Va au bout de la branche
    branch(h);           // recursive call - appel recursif pour faire 2 nouvelles branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    stroke(h,h,h);
    line(0, 0, 0, -h);
    fill(h,h,h);
    //ellipse(0,-h,h,h); // premiere tentative, trop parfait !
    ellipse(h,-h,h,h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}
