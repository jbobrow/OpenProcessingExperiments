


void setup() //configuració a la pàgina
{
size(600,600); //dimensions del quadre
}

void draw() // inici de la funció del dibuix
{
  
background(mouseX-200,mouseY-250,101); // canvi de color segons la posició del ratolí representat si està més o menys content segons on mira

stroke(255,255,255);strokeWeight(10);line(0,20,600,20);
stroke(255,255,255);strokeWeight(20);line(0,70,600,70);
stroke(255,255,255);strokeWeight(5);line(0,100,600,100);
stroke(255,255,255);strokeWeight(30);line(0,180,600,180);
stroke(255,255,255);strokeWeight(18);line(0,230,600,230);
stroke(255,255,255);strokeWeight(40);line(0,300,600,300);
stroke(255,255,255);strokeWeight(5);line(0,340,600,340);
stroke(255,255,255);strokeWeight(30);line(0,380,600,380);
stroke(255,255,255);strokeWeight(7);line(0,450,600,450);
stroke(255,255,255);strokeWeight(40);line(0,530,600,530);
stroke(255,255,255);strokeWeight(5);line(0,575,600,575);


//fons del background 


stroke(0);strokeWeight(3);
fill(0);ellipse(300,270,400,460);
fill(188,188,188);ellipse(300,300,400,500);
noStroke();
fill(230,230,230);ellipse(300,330,350,435);
stroke(0);
noFill();
arc(80,550,130,100, PI+QUARTER_PI, TWO_PI);
arc(81,540,160,130, PI+QUARTER_PI, TWO_PI);
//dibuix de l´ull
stroke(0);
noFill();
arc(430, 71, 70, 70, PI, PI+QUARTER_PI);
arc(410, 55, 70, 70, PI, PI+QUARTER_PI);
strokeWeight(5);
arc(390, 45, 70, 95, PI, PI+QUARTER_PI);
strokeWeight(5);
arc(360, 40, 70, 110, PI, PI+QUARTER_PI);
strokeWeight(6);
arc(335, 40, 70, 110, PI, PI+QUARTER_PI);
strokeWeight(7);
arc(308, 40, 70, 110, PI, PI+QUARTER_PI);
strokeWeight(5);
arc(281, 50, 70, 110, PI, PI+QUARTER_PI);
strokeWeight(3);
arc(255, 59, 70, 110, PI, PI+QUARTER_PI);
//celles de l´ull
noStroke();
fill(53,181,211);ellipse(mouseX,mouseY,150,150);
fill(0);ellipse(mouseX,mouseY,80,80);
fill(227,250,255);ellipse(mouseX-13,mouseY-24,20,25);
//formes de l interior de l ull

noCursor();
//per evitar que surtir el cursor a la pantalla

}


