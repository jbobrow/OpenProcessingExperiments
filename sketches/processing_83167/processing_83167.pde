
boolean dessine;
float centreX;
float centreY;
float maxRadius = 50;// rayon du cercle qui contient les formes
int nbrSommets = 3;//nombre de sommet initial
float a = 0; //angle de distribution relatif au nombre de sommets, équivalent à vertex ();
float r = 0;
float v = 0.0;
float s = 0.0;
float timer = 0;
float R, G, B, A;
void setup () {
size(1000, 1000);
centreX = width/2;
centreY = height/2;
noFill ();
background(255);
R = 200;
G=123; B=78; A=40;
}
void draw () {
if (mousePressed) {
dessine();// Il faut maintenir le click
}
if (keyPressed) {
if (key == ' ') {
background(255);
}
}
}
void dessine () {
pushMatrix ();
stroke(R, G, B, A);//couleur du contour de la forme
translate(centreX, centreY);
rotate(r);
r= r+0.09; //rotation
v = v + 0.70; //vitesse
s = cos(v)*10; //"zoom" et "dézoom" sur la forme en fonction de la vitesse de la forme
scale(s);
beginShape();//enregistre le nombre de sommet d'une forme
for (int i = 0; i < nbrSommets; i++) {
vertex(cos(a)*maxRadius, sin(a)*maxRadius);// les formules cos(a)*maxRadius = cos(angle)*rayon du cercle qui contient les formes = position x du premier point du vertex. Sin(a)*maxRadius = position y du vertex 
a += TWO_PI/nbrSommets; //angle est définit par 2PI/ le nombre de sommets
}
if (abs(s) <= 1) {
if (timer == 0) {
println("coucou");
R = random(255);
G = random(255);
B = random(255);
nbrSommets =(int) random(3, 10) ;
}
timer++;
}
else {
timer=0;
}
if (key == 's') { //image sauvegarder si la touche "s" est pressé
save("image.jpg");
}
println(timer+ " " + abs(s));
endShape(CLOSE);// termine l'enregistrement de la forme
popMatrix();
}


