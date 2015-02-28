
import processing.pdf.*;

size(1000,1000);
beginRecord(PDF,"triangulos.pdf");

fill(240,142,15,25);
beginShape(TRIANGLE_FAN); //leer lista como si cada uno fuera un triangulo
vertex(75,30);
vertex(10,20);
vertex(10,20);
vertex(90,60);
vertex(90,70);
vertex(50,40);
endShape();

beginShape(TRIANGLE_FAN);
fill(15,219,240,40);
vertex(750,300);
vertex(100,200);
vertex(750,500);
vertex(200,600);
vertex(900,700);
vertex(350,850);
endShape();

endRecord();

