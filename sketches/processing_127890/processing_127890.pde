
float rot; float rota; float rotb; // rot est utilisé comme compteur principal. rota est utilisé pour la rotation de la boite de gauche, rotb pour celle de droite.
float rotcamx =0; float rotcamy =0; float rotcamz =0; // variables utilisées pour placer la caméra
float modifcouleur = 4; float couleur; // variables utiliées pour modifier les couleurs.
float iteration = 2; //Nombre d'itérations... Le nombre réel est de ce nombre +1
float boxsize = 80; float minboxsize =boxsize*pow(0.707,iteration); float hauteur=boxsize; float modifhauteur=0.707107;
float a = 0.02;
float pi = 3.141592654;
float modifl =0; float modifh=0;

void setup()
{
    size(800,800, P3D);
}

void draw()
{
    background(250,128,0);

    
    

    text("Pavé numérique : déplacer la forme",5,15);
    text("A-E : Rotation axe Z",5,30);
    text("Q-D : Rotation axe Y",5,45);
    text("Z-S : Rotation axe X",5,60);
    text("+ et - : Change la valeur de redimensionnement en profondeur",5,75);
    text("Boutons souris : rotations sur tous les axes en même temps",5,90);
    text("Barre espace : inverse le sens de rotation ",5,105);
    text("0 : remet tout à zéro",5,120);
    text("Nombre d'itérations : "+(iteration+2),5,180);
    text("Nombre d'objets : "+(pow(2,iteration+2)-1),5,195);
    text("[ & ] : Change la vitesse de rotation (actuellement : "+float (int(a*500))/10+")",5,135);
    text("/ & * : Modifie le nombre d'itérations",5,150);
    text("O & P : (dé)zoomer",5,165);

    
    text("Pavé numérique",6,15);
    text("A-E",6,30);
    text("Q-D",6,45);
    text("Z-S",6,60);
    text("+ et -",6,75);
    text("Boutons souris",6,90);
    text("Barre espace",6,105);
    text("0 :",6,120);
    text("Nombre d'itérations",6,180);
    text("Nombre d'objets",6,195);
    text("[ & ]",6,135);
    text("/ & *",6,150);
    text("O & P",6,165);
   
    translate((width/2)+modifl, (height/2)+height/10+modifh);

    //
    // Placement de la caméra
    //
      
    rotateX(rotcamx);
    rotateY(rotcamy);  // La caméra est placée en fonction de "rotcam" qui est à 0 par défaut et augmente si on appuie sur le bouton de la souris.
    rotateZ(rotcamz);
      
    //
    // Vérifications de l'appui des touchesq     
    //
   if (mousePressed && (mouseButton == LEFT)) {
       rotcamx+=0.05;
       rotcamy+=0.05;
       rotcamz+=0.05;
    }  

   if (mousePressed && (mouseButton == RIGHT)) {
       rotcamx-=0.05;
       rotcamy-=0.05;
       rotcamz-=0.05;
    }  


    if (keyPressed) 
    {
        if (key == '+') {modifhauteur+=0.01;}
        if (key == '-') {modifhauteur-=0.01;}
        if (key == '[') {a-=0.01;keyPressed = false;}
        if (key == ']') {a+=0.01;keyPressed = false;}
        if (key == '*') {iteration+=1; minboxsize =boxsize*pow(0.707,iteration);keyPressed = false;}
        if (key == '/') {iteration-=1; minboxsize =boxsize*pow(0.707,iteration);keyPressed = false;}                  
        if (key == '8') {modifh-=4;}
        if (key == '2') {modifh+=4;}
        if (key == '4') {modifl-=4;}
        if (key == '6') {modifl+=4;}
        if (key == '7') {modifl-=4; modifh-=4;}
        if (key == '9') {modifl+=4; modifh-=4;}
        if (key == '1') {modifl-=4; modifh+=4;}
        if (key == '3') {modifl+=4; modifh+=4;}
        if (key == 'q' || key == 'Q') {rotcamy-=0.05;}
        if (key == 'd' || key == 'D') {rotcamy+=0.05;}
        if (key == 'z' || key == 'Z') {rotcamx+=0.05;}
        if (key == 's' || key == 'S') {rotcamx-=0.05;}
        if (key == 'a' || key == 'A') {rotcamz-=0.05;}
        if (key == 'e' || key == 'E') {rotcamz+=0.05;}
        if (key == 'o' || key == 'O') {boxsize+=1;minboxsize =boxsize*pow(0.707,iteration);hauteur=boxsize;}
        if (key == 'p' || key == 'P') {boxsize-=1;minboxsize =boxsize*pow(0.707,iteration);hauteur=boxsize;}
        if (key == '0') {rotcamx=0;rotcamy=0;rotcamz=0;rot=0;modifl=0;modifh=0;modifhauteur=0.707107;}
        if (key == ' ') {a = -a;keyPressed = false;}
    }

    //
    // Scriptage des évènements. 2 pi radians = 360° -> 2pi radians = un tour complet du cube.
    //
    rot+=a; // incrémente de "a" la variable de rotation principale

    if (rot<2*pi)      // Tant que la rotation est inférieure à 2pi radians, seul le cube de droite bouge
    {
        rota=rot;
        rotb=0; 
    }

    if (rot>2*pi)    // Dés que la rotation est supérieure à 2pi radians, seul le cube de gauche bouge
    {
        rotb=rot;
        rota=0; 
    }

    if (rot>4*pi)  // Dés que la rotation est supérieure à 4pi radians, les deux cubes bougent.
    {
        rotb=rot;
        rota=rot; 
    }
    if (rot>6*pi) // Dés que la rotation est supérieure à 6pi radians, les deux cubes bougent dans le même sens.
    {
        rota=rot;
        rotb=-rot;
    }
    if (rot>8*pi) // Dés que la rotation est supérieure à 8pi radians, le cube de droite va deux fois plus lentement que celui de gauche.
    {
        rota=rot;
        rotb=rot/2;
    }
    if (rot>12*pi) // Dés que la rotation est supérieure à 12pi radians, les deux cubes vont dans le même sens, mais clui de droite va deux fois plus lentement.
    {
        rota=rot;
        rotb=-rot/2;
    }
    if (rot>16*pi) // Dés que la rotation est supérieure à 16pi radians, il remet une valeur à 0, ce qui fait redémarrer l'animation.
    {
        rot=0;
    }

     
    fill(128+boxsize/2,128-boxsize/4,0);     
    box(boxsize);   
    dragon(boxsize, hauteur);
}
 
void dragon(float h, float hauteur) 
{          
    if (h > minboxsize)     
    { 
        h *= 0.707107;
        hauteur *= modifhauteur;
        
        pushMatrix();        
            translate(-h/0.707/2,-h*0.707*2,0);
            rotateZ(-pi*5/4-rota);
            fill(128+h/2,128-h/4,0);     
            box(h,h,hauteur);
            dragon(h, hauteur);  
        popMatrix();

        pushMatrix();        
            translate(h/0.707/2,-h*0.707*2,0);
            rotateZ(pi*5/4+rotb);
            fill(128+h/2,64+h/4,0);    
            box(h,h,hauteur);    
            dragon(h, hauteur);  
        popMatrix();
}
}

