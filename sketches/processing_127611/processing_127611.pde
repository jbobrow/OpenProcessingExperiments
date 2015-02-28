
//
// Sierpinski animé par Vanlindt Marc pour www.vanlindt.be
// -------------------------------------------------------
//

//
// Variables
//
    float rot;                // variable qui servira à indiquer l'angle de rotation
    float boxsize = 100;      // variable indiquant la taille de la boite d'origine
    float minboxsize = 10;    // Taille minimale avant fin des itérations
    float a = 0.04;           // variable servant à indiquer la vitese de rotation

//
// Taille de l'écran
// 640*360 : Car sinon, c'est vraiment trop lent... :(
//
    void setup()
    {
      size(640, 360, P3D);
    }

//
// lance l'affichage
//
    void draw()
    {
      background(255);                //Fond blanc
      translate(width/2, height/2);   // L'objet est centré.
      rot+=a;                         // Incrémentaion de la valeur de rotation
      if(rot>30){a=-a;}               // Si la rotation dépasse 90° il part dans l'autre sens
      if(rot<-30){a=-a;}              // Si la rotation dépasse -90° il part dans l'autre sens
      rotateX(rot);                 // Rotation axe X
      rotateY(rot);                 // Rotation axe Y
      rotateZ(rot);                 // Rotation axe Z
      if(mousePressed)            // Inverse le sens si on appuie sur le bouton de la souris 
      {
        a=-a;                      // Inverse la valeur de a, modifiant le sens de rotation
      }
      box(boxsize);                //affichela boite
      sierp(boxsize);              // appelle la fonction Sierp avec la valeur de la taille de la boite
    }
 
// 
// Appel aux itérations
// float h : h prenant la valeur de la boxsize courante
//
    void sierp(float h) {        // H prend la valeur boxsize        
    if (h > minboxsize)           // La fonction continue uniquement si la taille de la boite est supérieure à la taille minimale autorisée (minboxsize)
      {
        h *= 0.5;              // La nouvelle valeur de h, la taille de la boite, est de la moitié de la précédente.
        
        pushMatrix();          // Appel aux coordonnées de la boite précédente
        translate(h+h*rot/2*(rot/2),0,0);    // Effectue un mouvement 
        rotateX(rot);  // Effectue une rotation
        box(h);    // Affiche à cet endroit une nouvelle avec la nouvelle taille
        sierp(h);  // On relance l'opération à partir de ce nouvel endroit jusqu'à minboxsize
        popMatrix(); // On affiche
        
        pushMatrix(); // Pour chaque étape, cf juste au-dessus. Il ya 6 étapes en tout car pour chaque boite, une nouvelel 
        translate(-h-h/2*(rot/10),0,0); // est crée en X +1 & -1, Y +1 & -1 et Z +1 & -1, donc 6 en tout.
        rotateX(-rot);
        box(h);
        sierp(h);
        popMatrix();
 
        pushMatrix();
        translate(0, h+h/2*(rot/10),0);
        rotateY(rot);
        box(h);
        sierp(h); 
        popMatrix();
   
        pushMatrix();
        translate(0, -h-h/2*(rot/10),0);
        rotateY(-rot);
        box(h);
        sierp(h);
        popMatrix();
   
        pushMatrix();
        translate(0, 0, h+h/2*(rot/10));
        rotateZ(rot);
        box(h);
        sierp(h); 
        popMatrix();
   
        pushMatrix();
        translate(0, 0,-h-h/2*(rot/10));
        rotateZ(-rot);
        box(h);
        sierp(h);
        popMatrix();
      }
   }

