
//By Sophie Lejot

float x,y,l,h,z,w; 


void setup () {

size(640,640);
background(255);
noFill(); //pas de remplissage
smooth() ; //lissage
l = 20 ;
h = 20 ;
z=40;
w=40;


}



void draw() {
 fill(0,255,0);
  noStroke();
  //stroke() ; // couleur de contour
  //strokeWeight(5) ; //Ã©paisseur du contour

for (int i=23; i<height; i+=60) {// condition de rÃ©pÃ©tition)
for (int j=23; j<width; j+=60) {
  ellipse(i,j,l,h); 
}

}


for (int x=50; x<height; x+=60) {// condition de rÃ©pÃ©tition)
for (int y=50; y<width; y+=60) {
 fill(0,255,255);

  ellipse(x,y,z,w); 
}

}

}
 



