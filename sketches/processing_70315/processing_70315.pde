
//variables
color fondo = color(255, 255, 242);
int x = 400;
int y = 400;
int d = 5;
int d2 = 10;
int d3= 15;

//seteo
void setup(){
  
  size (x, y);
  background(fondo);
  
}

//sección de dibujo

void draw(){
  
  for(int a = 0; a<= x; a = a + 40){
    for(int b = 5; b<= x; b = b + 80){
      for(int c = 13; c<= x; c = c + 60){
       
      fill(17, 103, 135, 1);
      noStroke();
      triangle(a, 0, b, 44, 45, c); 
      }
    }
  }


//figuras

fill(255, 47, 119, 35); //rosada
ellipse(170, 240, 110, 110);
ellipse(170, 240, 50, 50);
ellipse(170+d, 240+d, 60, 60);
ellipse(170+d*2, 240+d*2, 60, 60);
ellipse(170+d*2, 240+d*2, 50, 50);
ellipse(170+d*2, 240+d*2, 40, 40);

fill(255, 148, 6, 40); //naranjo
quad(35, 284, 165, 337, 82, 390, 28, 337);
quad(35, 284+d3, 165, 337+d3, 82, 390, 28, 337+d3);
quad(35, 284+d3, 165, 337, 82, 390+d3, 28, 337+d3);
quad(35, 284, 165, 337+d3, 82, 390+d3, 28, 337+d3);
quad(54, 312, 123, 340, 80, 368, 50, 340);

fill(30, 232, 19, 25); //verde
ellipse(330, 290, 90, 90);
ellipse(340, 290, 136, 136);
ellipse(330+d, 290+d, 90, 90);
ellipse(330+d*2, 290+d*2, 90, 90);
ellipse(330+d*2, 290+d*2, 70, 70);
ellipse(330+d*2, 290+d*2, 40, 40);

fill(97, 29, 168, 35); //morado
arc(x, 150, 50, 50, HALF_PI, PI+HALF_PI);
arc(x, 150, 100, 100, HALF_PI, PI+HALF_PI);
arc(x+d, 150+d, 60, 60, HALF_PI, PI+HALF_PI);
arc(x+d*2, 150+d*2, 60, 60, HALF_PI, PI+HALF_PI);
arc(x+d*2, 150+d*2, 50, 50, HALF_PI, PI+HALF_PI);
arc(x+d*2, 150+d*2, 30, 30, HALF_PI, PI+HALF_PI);


fill(228, 234, 17, 55); //amarillo

beginShape();
vertex(312, 80);
vertex(343, 164);
vertex(228, 145);
endShape();

beginShape();
vertex(245, 140);
vertex(335, 98);
vertex(327, 152);
endShape();

beginShape();
vertex(245, 140);
vertex(335, 98);
vertex(327, 152);
endShape();

beginShape();
vertex(235, 130);
vertex(325, 88);
vertex(317, 142);
endShape();

beginShape();
vertex(235+d2, 130);
vertex(325, 88+d2);
vertex(317, 142);
endShape();

beginShape();
vertex(235, 130+d2+5);
vertex(325, 88+d2*2);
vertex(317, 142);
endShape();

beginShape();
vertex(235, 130+d2*2);
vertex(325, 88+d2*3);
vertex(317, 142);
endShape();

fill(255, 41, 123, 55); //hexagono
beginShape();
vertex(360, 30);
vertex(387, 45);
vertex(388, 77);
vertex(360, 94);
vertex(333, 78);
vertex(332, 46);
endShape();

beginShape();
vertex(360+d2, 30+d2);
vertex(387+d2, 45+d2);
vertex(388+d2, 77+d2);
vertex(360+d2, 94+d2);
vertex(333+d2, 78+d2);
vertex(332+d2, 46+d2);
endShape();

beginShape();
vertex(360+d3, 30+d3);
vertex(387+d3, 45+d3);
vertex(388+d3, 77+d3);
vertex(360+d3, 94+d3);
vertex(333+d3, 78+d3);
vertex(332+d3, 46+d3);
endShape();


stop();
}
