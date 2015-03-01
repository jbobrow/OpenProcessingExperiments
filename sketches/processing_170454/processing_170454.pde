
float circulox;
int circuloy;
int dim;
float velocidad = 0.05;
int r = 100;
int g = 50;
int b = 200;

void setup (){
size (500,500);
background(255);
circulox = 150;
circuloy = 150;
dim = 100;
} //fin setup

void draw (){
noStroke();
fill(0,1);
rect(0,0, width, height);
//background (255);
//fill(circulox);

//ellipse(circulox, circuloy, dim, dim);
//ellipse(circulox, circuloy, dim, dim);

float dim2 = random (100);

fill (random(0,255), random(0,255), random(0,255), random(0,255));
//ellipse(random(500),random(500), dim2, dim2);
ellipse(mouseX + random (50), mouseY + random (50), dim2, dim2);

circulox = circulox + velocidad;
println(circulox);

} // fin draw

void mousePressed(){
background (255);
}

