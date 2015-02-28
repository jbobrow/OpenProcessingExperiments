
void setup(){
 smooth();
  background(/*225,245,243*/0);
  size(500, 500);
}
void draw(){

mouseX=100;
mouseY=100;
float x=20;//mouseX;
float y=40;//mouseY;
float n=5;//3+random(8); // nombre de cotes du polygone
float R=40;//+random(50); // rayon du polygone 
float r=4*R/2; // rayon de l'etoile polygonale

stroke(0,45);
strokeWeight(4/5);
fill(35,137,203,56);
float pisn=PI/n;
translate(width/2+r,height/2-r);
//for(int j=0;j</*n*5*/1;j++){forme simple
for(int j=0;j<=n*5;j++){
// dessin des n sommets du polygone
beginShape();
for(int k=0;k<n;k++) {
if (n%2==0){ // cas du polygone a un nombre pair de sommets
  vertex(x+R*cos(k*2*pisn-pisn),y-R*sin(k*2*pisn-pisn));
  vertex(x+r*cos(k*2*pisn-2*pisn),y-r*sin(k*2*pisn-2*pisn));
}else{ // cas du polygone a un nombre impair de sommets
  vertex(x+R*cos(k*2*pisn-2*pisn),y-R*sin(k*2*pisn-2*pisn));
  vertex(x+r*cos(k*2*pisn-pisn),y-r*sin(k*2*pisn-pisn));
}
}
endShape(CLOSE);
// dessin des n sommets du polygone
translate(x-10,y-10);
rotate(PI/5); 
//rotate(23*PI/53);
scale(0.8,1.2);
noLoop();
}
}


