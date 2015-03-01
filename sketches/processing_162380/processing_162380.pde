
//By Sophie Lejot
  // Modifié par Tifaine L
 
float x,y,l,h,z,w;

 
void setup () {
 
  size(640,640);

  noFill(); //pas de remplissage
  smooth() ; //lissage

  stroke(255) ; // couleur de contour
  strokeWeight(2) ; // epaisseur du contour

  l = 20 ;
  h = 20 ;
  z = 40 ;
  w = 40 ;
  
}
 
 
void draw() {


  // condition pour que les ronds se transforment en carrés
  if (mousePressed == true) { //si la souris est pressée :
    
    background (255); // Fond blanc : permet d'effacer les ronds
    
    // Petits rectangles verts
    for (int i=10; i<height; i+=60) { // condition de repetition)
    for (int j=10; j<width; j+=60) {
      fill(0,255,0);
      rect(i,j,l,h);
    }
    }
    
    // Rectangles bleus 
    for (int x=30; x<600; x+=60) { // condition de repetition)
    for (int y=30; y<600; y+=60) {
      fill(0,255,255);
      rect(x,y,z,w);
    }
    }
  } 
  else { // par défaut :
  
    background (255);
    
    // Ronds verts
    for (int i=23; i<height; i+=60) { // condition de repetition)
    for (int j=23; j<width; j+=60) {
      fill(0,255,0);
      ellipse(i,j,l,h); 
    }
    }
      
    // Ronds bleus
    for (int x=50; x<height; x+=60) { // condition de repetition)
    for (int y=50; y<width; y+=60) {
     fill(0,255,255);
     ellipse(x,y,z,w);
    }
    }
  } 
 
}



