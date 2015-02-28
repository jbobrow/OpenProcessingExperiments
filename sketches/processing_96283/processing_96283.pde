
//Berta Aracil López - Informàtica P2_b - Grup 02 GEDI


//declaració de variables
int movX;

//configuració de la pàgina
void setup()
{
  size(800,500);
  movX=width;
}


//funcions del dibuix
void draw()
{
  noCursor(); //amaga el cursor
  background(120,210,255); //color de fons
  
  //núvol
  fill(9,50,120,90);
  movX=movX-2; //equació de moviment del núvol
  
  ellipse(movX,height/5,70,40);
  ellipse(movX+20,height/6,70,40);
  ellipse(movX-20,height/6,70,40);
  ellipse(movX-40,height/5,70,40);
  ellipse(movX+40,height/5,70,40);
  
  
  //tiges
  stroke(43,155,20);strokeWeight(3);
  line(width/5,height/1.5,width/5,height);
  line(width*(4/5),height/1.5,width*(4/5),height);
  line(width/2,height/1.8,width/2,height);
  
  
  //flors
  noStroke();
  fill(150+mouseY,50+mouseX,15+mouseY); //colors variants de les flors
  
  ellipse(width/5,height/1.5,30,30);
  ellipse(width/2,height/1.8,50,50);
  ellipse(width*(4/5),height/1.5,30,30);
  
  //pètals
  fill(150+mouseY,50-mouseX,15+mouseY,80);
  ellipse(width/5,height/1.5,70,70);
  ellipse(width/2,height/1.8,100,100);
  ellipse(width*(4/5),height/1.5,70,70);
  
  
  //abella
  noStroke();fill(250,255,25);
  ellipse(mouseX,mouseY,50,40);
  
    //ulls
    stroke(0);strokeWeight(2); fill(255);
    ellipse(mouseX-20,mouseY-10,20,20); ellipse(mouseX-20,mouseY+10,20,20);
    noStroke(); fill(0);
    ellipse(mouseX-20,mouseY-10,10,10); ellipse(mouseX-20,mouseY+10,10,10);
    
    //cos
    stroke(0);
    line(mouseX,mouseY+16,mouseX,mouseY-16);
    line(mouseX+5,mouseY+16,mouseX+5,mouseY-16);
    line(mouseX+10,mouseY+14,mouseX+10,mouseY-14);
    line(mouseX+15,mouseY+12,mouseX+15,mouseY-12);
    triangle(mouseX+25,mouseY+5,mouseX+25,mouseY-5,mouseX+30,mouseY);
    
    //ales
    fill(10,60,150,80); noStroke();
    ellipse(mouseX+15,mouseY+10,45,25);ellipse(mouseX+15,mouseY-10,45,25);
}


