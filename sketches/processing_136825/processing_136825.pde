
int randomX;
int randomY;
int alpha;
int randomH;
int randomW;
int triangle;


void setup(){
 
size(740,900);
background(165,150,135);
noStroke();
}

void draw(){

}
 
 
void mouseMoved () {
  
 stroke(255); 
 fill(255);
 line(mouseX,mouseY);

    
  //generate random rectangle location
  randomX = int(random(740));
  randomY = int(random(900));
  
  randomX1 = int(random(101));
  randomY1 = int(random(101));
    
  //generate random alphas
 alpha = int(random(100,255));
 triangle = int(random(100,100,100)); 
  
  stroke(r, g, b);
  fill (r, g, b);
  line(randomX, randomY, alpha);

}

