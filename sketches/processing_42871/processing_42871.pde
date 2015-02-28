
float x;
float easing = 0.03;

void setup() {
smooth();
size (700,350);
background (4,0,190);
  
}

void draw() {
smooth();
background(255);
 // ANIM FOND
 //strokeWeight(0.5);
 noStroke();

for(int a=0; a<75;a++){ //Le pas des carrés H
   for(int b=0; b<50;b++){
    // fill(random(10,150), random(10,150),random(0,15));// Couleur
     fill(random(155,255),random(155,255),0);
     float perimetre = random(5,20);
     rect(a*10, b*10, random(perimetre), random(perimetre)); // Le pas des carrés V
  }
 }
 stroke(250);
  println(mouseX); // Write the X coordinate to the file
  println(mouseY); // Write the Y coordinate to the file
  
  // easing
  float targetX = mouseX; 
 x += (targetX -x) * easing;
 
 // Selon position de la souris par rapport à la moitié écran
  if (mouseX > x) {
  x +=80 * easing;
}
if (mouseX < x){
x -= 80 * easing;
}

// COU
strokeWeight(3);
stroke(0,0,51);
line (x+20,115,x+20,175); //cou
line (x+25,115,x+25,175); //cou
line (x+30,115,x+30,175); //cou
// TETE
fill(0,255,255);
ellipse (x+25,100,60,60);// tete

// ANTENNE + Intérieur Tête
stroke(255,10,10);
strokeWeight(3);
line (x+25,70,x+random(10,30),20);
fill(random(0,125),random(0,125),0);
ellipse (x+25,100,30,30);
fill(0);
ellipse (x+25,100,10,10);

//CORPS
strokeWeight(2);
fill(0);
rect (x,175,50,100);
line (x,203,x,203);
fill(0,random(200,255),102);
rect (x,193,40,60);
strokeWeight(3);

strokeWeight(2);
fill(0);
line (x,203,x,203);
strokeWeight(1);
fill(0,153,255);
rect(x,203,10,50);
arc(x+25,276,35,35,0,PI);
strokeWeight(2);
stroke(255);
strokeJoin(MITER);
arc(x+25,278,20,20,0,HALF_PI);
 strokeWeight(2);
 stroke(random(0,125),random(0,125),0); //Duplication traits corps
 for (int i = 250; i > 192; i -= 5) {
   line (x, i, x+10, i); 
   } 
   
  
}



