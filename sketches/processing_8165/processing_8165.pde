
//le set : 
void setup() { 
  size (500, 500); 
  background(#151d27);  //notez bien, le fond n'est pas tout à fait noir.
  smooth(); 
  noCursor (); //pour vous forcer à suivre une direction precise
  strokeWeight(0.1);
  frameRate (60); //la vitesse 
} 
 
//ce qui va nous servir à dessiner :

void draw() { 
   
  stroke(255); 
   
  
 //si on appuis sur une touche, tout recomence, et on à une belle image dans son dossier.
  if (keyPressed == true) {  
 
  saveFrame(); 
  background(#151d27);  
}; 
 
  //Ici, on utilise, qu'une seule variable, plus pour des raisons pratiques.  
  float a = random ( mouseY+5, mouseX+100 ) ; 

  //la comande de ligne blanche, celles qui sont plein ouest.
  line ( 0, a, mouseX, mouseY );
  
  //aprés, on grise un peu les lignes à l'Est...(pour faire l'ombre)
  stroke (180) ;
  //est c'est finit: il suffit de mettre les coordonés opposés.
  line( 500, a, mouseX, mouseY );
  
  //NOTE : prenez votre temps pour dessiner une belle montagne.
  //Quentin Aurat
   
}; 



