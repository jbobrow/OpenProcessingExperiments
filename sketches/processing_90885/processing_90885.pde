

/*Je déclare deux variables déterminant les dimensions des rectanges 
constituant la forme*/
float largerect=10;
float longrect=120;

//Une variable détermine le carré (blanc) au centre de la forme
float taillecarre=90;

//Une variable détermine le décalage des "franges"
float decalage=15;


void setup(){
size(500,500);
noStroke();
}
void draw(){
  background(255);
  fill(0);
  translate(250,250);
  
  for(int j =0; j<2; j++){

    pushMatrix();
  for (int i=0;i<2; i++){
    
  rect(0,-decalage,largerect,taillecarre+2*decalage);
  rect(20,-decalage,largerect,taillecarre+2*decalage);
  translate(longrect/2,0);
  
  }
  
  popMatrix();
  
  rotate(radians(-90));
  translate(-90,0);
  
  }
  
fill(255);
 rect(0,0,90,90);
  
}




