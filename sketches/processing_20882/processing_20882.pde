
void setup() {
 size(200,200);
 colorMode(HSB, 200);
 frameRate(30);
}

void draw() {
  
  background(mouseY,mouseX,200);
  smooth();

noStroke();
fill(mouseX,10,mouseY,100);
triangle(90,80, 90,30, 30,70);    //cabeza

ellipseMode(CENTER);
fill(0);
ellipse(30,70, 10,7);             //nariz
fill(240,240,255,255);
ellipse(60,50, 10,15);            //ojo
fill(0);
ellipse(57,50, 7,7);               //iris
fill(44,mouseX,mouseY,150);
noStroke();
triangle(90,30, 80,20, 70,40);    //oreja

fill(mouseY,mouseX,mouseX,150);
triangle(width/2,height/2, 170,150, 170,100);  //cuerpo trasero
fill(200-mouseY,200-mouseX,mouseX,100);
triangle(width/2,height/2, 100,150, 170,100);  //cuerpo delantero

fill(mouseY,mouseX,mouseY);
ellipse(92,170,15,10);                  //garra delantera
ellipse(161,170,15,10);                 //garra trasera

stroke(200,mouseX,mouseY,190);
line(width/2,150, width/2,170);   //pata delantera
line(169,150, 169,170);           //pata trasera
strokeWeight(2);
line(width/2,height/2, 90,80);    //cuello
line(170,width/2, 175,80);        //cola
}

