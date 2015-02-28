
void setup() {
 size (600,600);
 background (50);
 smooth (); 
}

void draw() {
  randomSeed(mouseX);
  
  //Schleife
  for (int i=0; i<=width; i=i+50){
  for (int j=0; j<=height; j=j+50){
  
    circles(i,j);
    }
  }
}

//Funktion
void circles(int x, int y){
  int k = 10;
  stroke(50);
  
  
  fill(255,random(255),random(255)); 
  ellipse(x,y,k,k);
  ellipse(x+k,y+k,random(-40,40), random(-40,40));
  ellipse(x-k,y-k,random(-15,15), random(-15,15));
}

