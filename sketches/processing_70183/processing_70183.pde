
//Variables de posición
int posx= 500;
int posy= 400;

//variable color violeta con canal alfa
color c= color(145, 120, 144, 150);
//variable color gris
color g= color(120,119,119);

void setup(){
  size(1200, 700);
   background(235, 235, 234);
   smooth();
   
}
void draw(){
   
    //figuras base
    noStroke();
    smooth();
    fill(g, 30);
    quad( 0, 0, 1200, 0, 1200, 300, 0, 100);
    quad( 0, 0, 1200, 0, 1200, 100, 0, 300);
    
    //pirámide (triángulos)
    stroke(100);
    strokeWeight(0.5);
    fill(c);
    triangle(600, 108, 600, 500, 372, 423);
    triangle(600, 108, 600, 500, 828, 423);  
    
    //rectángulos
    fill(g, 30);
    rect(50, 500, 10, 100);
    rect(1150, 500, 10, 100);
    fill(c);
    stroke(255);
    
 
    //Líneas de fuga
    for(int i=0; i<=1200; i= i+20){
      line(i,0, 600, 700);
    }
    for(int i=0; i<=1200; i= i+20){
      line(i,700, 600, 0);
    }
    //Arcos
    noStroke();
    fill(255);
    arc(550, 300, 50, 50, HALF_PI, PI + HALF_PI);
    arc(550, 350, 50, 50, HALF_PI, PI + HALF_PI);
    arc(650, 300, 50, 50, PI + HALF_PI, TWO_PI);
    arc(650, 300, 50, 50, 0, HALF_PI);
    arc(650, 350, 50, 50, PI + HALF_PI, TWO_PI);
    arc(650, 350, 50, 50, 0, HALF_PI);
    
    //Figura con mas vértices
    fill(g, 30);
    beginShape();
    vertex(231, 524);
    vertex(595, 626);
    vertex(958, 524);
    vertex(1044, 647);
    vertex(146, 647);
    endShape(CLOSE);
    
   //Elipses
    ellipse(237, 248, 44, 44);
    ellipse(177, 296, 28, 28);
    ellipse(268, 365, 56, 56);
    ellipse(914, 248, 44, 44);
    ellipse(974,296, 28, 28);
    ellipse(882, 365, 56, 56);
    
    //Cuadriláteros
    quad(0, 567, 32, 567, 89, 648, 0, 648);
    quad(1168, 567, 1200, 567, 1200, 648, 1111, 648);
    
    //triángulo interactivo
    
    fill(255);
    triangle(mouseX+50, mouseY, mouseX-50, mouseY, mouseX, mouseY-86.6);
    }
    
