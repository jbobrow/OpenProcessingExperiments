
//miro

void setup() {
size(500,650);
background(150,250,0);

}

void draw() { 
//fondo
stroke(0);
strokeWeight(10);
fill(10,150,250);
quad(0,0,100,0,400,650,0,650);
//cisculos negros
fill(0);
ellipse(50,400,50,60);
ellipse(50,600,50,60);
ellipse(450,450,50,60);
//assterisco
stroke(250);
strokeWeight(8);
line(20,250,100,250);
line(60,200,60,300);
line(20,200,100,300);
line(20,300,100,200);
stroke(10,180,250);
strokeWeight(5);
line(20,250,100,250);
line(60,200,60,300);
line(20,200,100,300);
line(20,300,100,200);
//cabeza amarilla
stroke(0);
strokeWeight(10);
fill(0);
triangle(250,50,220,120,250,120);
fill(250,250,0);
triangle(150,100,325,100,250,300);
fill(0);
ellipse(300,150,30,30);
noFill();
bezier(150,100,80,100,70,120,80,180);
bezier(60,160,60,190,100,190,100,160);
line(220,120,250,50);
bezier(250,50,250,90,300,150,200,150);
bezier(325,100,450,150,470,200,425,320);
line(220,140,225,160);
line(420,300,470,305);
line(460,295,460,330);
line(450,330,490,335);
line(480,325,475,370);
fill(0);
ellipse(220,120,10,10);
//cuerpo rojo
fill(0);
quad(180,550,350,520,400,650,150,650);
fill(250,0,0);
quad(150,200,325,200,400,525,100,550);
line(180,550,195,500);
line(350,550,325,475);
fill(0);
triangle(200,200,290,200,250,300);
}
