
int petitpanier = 60;
int grandpanier= 120;

int pX= 125;
int pY = 125;

void setup(){

size(600,600);
background(#507DFF);

fill(#7C0002,80);
strokeWeight(6);
ellipse(50,50,100,petitpanier);

petitpanier = (40+grandpanier);
strokeWeight(4); 
frameRate(8); //12
}

void draw(){
background(#507DFF);
 // if(mousePressed){
  
background(pX,pY,grandpanier,petitpanier);

  ellipse(pX,pY,grandpanier,petitpanier);
  
  ellipse(mouseX,mouseY,grandpanier,petitpanier);
  

 // }
pX=mouseX;
pY=mouseY;

}



