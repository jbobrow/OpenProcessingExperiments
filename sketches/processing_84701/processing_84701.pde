
void setup()
{size (500,500);}

void draw()
{background(#080000);
noStroke();
// haut droit
fill(#DB1818,80);
rect(30,30,50,50);
scale(1.5);
rect(20,20,50,50);
scale(1.0);
rect(10,10,50,50);
 
// angle 45
fill(#DB1818,80);
translate(70,56);
rotate(radians(45));
scale(0.65);
rect(30,30,50,50);
scale(1.5);
rect(20,20,50,50);
scale(1.0);
rect(10,10,50,50);

//deuxième figure à angle 45 qui s'ajoute à la première
translate(10,-10);
scale(0.65);
rect(30,30,50,50);
scale(1.5);
rect(20,20,50,50);
scale(1.0);
rect(10,10,50,50);

//
translate(35,-120);
fill(#DB1818,80);
translate(70,56);
rotate(radians(25));
scale(1.10);
rect(30,30,50,50);
scale(1.5);
rect(20,20,50,50);
scale(1.0);
rect(10,10,50,50);
translate(10,-10);
scale(0.65);
rect(30,30,50,50);
scale(1.5);
rect(20,20,50,50);
scale(1.0);
rect(10,10,50,50);

}


