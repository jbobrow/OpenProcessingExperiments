
int compteur;

void setup() {
  size(800,800);
  compteur = 0;
}
  void draw() {
    compteur = 0;
    fill(200,200,200);
  while (compteur< 100){
  compteur++;
  stroke(random(100000));
  ellipse(compteur*8,100,100,100);
    rect(100,100,100,200);
    ellipse(random(800),random(800),10,100);
    
    
   
 
    }
    
      
  }          
                
