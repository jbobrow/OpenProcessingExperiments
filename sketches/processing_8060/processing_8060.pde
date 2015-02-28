


void setup(){ 
  
size(600,600); 
smooth();

//va déterminer la vitesse de l'action :
frameRate(30);

//épaisseur de la ligne :
strokeWeight (0.8);
} 
//_________________________________________
//_________________________________________


void draw() {

//le fond des blanc...   
  background(250); 
  
  

//Pour "a" (nom de variable au choix), on rentre 3 paramétres;  
 
  for (int 
  a=1;    //Sa valeur  (1)
  a<800;  //(800) va influer sur le nombre de lignes
  a++  )  //...ou bien a=a+1

 { 
  stroke (0); 
  line (frameCount/cos(a),0,frameCount/sin(a), width);
    
   
 }
}




//c'est fini!
//Quentin Aurat

