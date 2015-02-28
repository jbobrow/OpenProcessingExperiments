

void setup (){


size(400,  500);
background(#9FEFA7);
}
void draw() {  
  //pelo
  stroke(#7D5423);
  fill (#7D5423);
  rect (120,105,150,50);
  //peinado
  fill (#9FEFA7); 
  
  beginShape();
  vertex(125,105);
  vertex(130,115);
  vertex(135,105);
  vertex(140,115);
  vertex(145,105);
  vertex(150,115);
  vertex(155,105);
  vertex(160,115);
  vertex(165,105);
  vertex(170,115);
  vertex(175,105);
  vertex(180,115);
  vertex(185,105);
  vertex(190,115);
  vertex(195,105);
  vertex(200,115);
  vertex(205,105);
  vertex(210,115);
  vertex(215,105);
  vertex(220,115);
  vertex(225,105);
  vertex(230,115);
  vertex(235,105);
  vertex(240,115);
  vertex(245,105);
  vertex(250,115);
  vertex(255,105);
  vertex(260,115);
  vertex(265,105);

  endShape();
  
  //entradas
  fill(#FFFF0D);
    ellipse (135,145,25,15);
 ellipse (255,145,25,15);
  
  //cara parte cuadrada
    stroke(#FFFF0D);
  fill(#FFFF0D);
  rect (120,145,150,120);
  fill(#FFFFFF);
  
  //cara parte redonda
   noStroke();
    fill(#FFFF0D);
  ellipse(195,260,149,130);
   
       
       
       
  //patillas
   stroke(#7D5423);
   fill(#7D5423);
   //izq
   rect (120,135,10,70);
   //der
   rect (260,135,10,70);

   
//cejas
fill (#7D5423);

//IZQ
rect(160,155,23,7);
triangle(160,155,147,165,160,162);

//DER
rect(207,155,23,7);  

triangle(230,155,244,165,230,162);
  //ojos
  stroke(0);
  fill (#FFFFFF);
  //izq
   ellipse (165,200,50,50);
   //der
   ellipse (220,200,50,50);
   
   //punto ojo
    stroke(0);
   fill (#339F35);
   //izq
   ellipse (165,200,30,30);
   //der 
   ellipse (220,200,30,30);
   //punto mas interno
      //izq
   stroke(0);
   fill (0);
   ellipse (165,200,10,10);
   //der 
   ellipse (220,200,10,10);
   
  //orejas
   noStroke();
  fill(#FFFF0D);
 ellipse (270,220,25,55);
  ellipse (120,220,25,50);
 //agujerooreja
 fill(0);
  ellipse (270,225,5,10);
    ellipse (120,225,5,10);
  //nariz



       stroke(0);
        fill(#E9E931);
        line(187,214,180,240);
        line(198,214,205,240);

           //tabique bajo
                     stroke(0);
                   fill(#E9E931);
                 ellipse (185,245,12,12);
                ellipse (200,245,12,12);
                    //fosas
                    fill(0);
                    
            ellipse (185,245,6,6);
            ellipse (200,245,6,6);

   
  //boca
 noStroke();
  fill(#FFACBA);
  ellipse (195,284,50,48);
  //dientes
  stroke(0);
  fill(#FFFFFF);
  rect(208,268,8,10);
  rect(200,268,10,10);
  rect(190,268,10,10);
  rect(180,268,10,10);
  rect(172,268,8,10);
  
 //dientes abajo
  rect(170,290,10,10);
  rect(180,290,10,10);  
  rect(190,290,10,10);
  rect(200,290,10,10);
  rect(210,290,10,10);

  
   //labios
   fill(#FF0202);
   ellipse (194,301,60,10);
       //superior
        noStroke();
        
  ellipse (185,265,30,10);
 ellipse (205,265,30,10);
 
 //perilla
 stroke(0);
 fill (#7D5423);
 rect(185,320,20,10);
 //bocadillo texto
 fill (#FFFFFF);
 ellipse (336,120,125,70);
 ellipse (330,180,20,20);
 ellipse (310,220,20,20);
  ellipse (290,260,20,20);
 //texto
 fill(0);
 textSize(12);
text("Pero esto que es!!",285,125);

//bordes negros

println(mouseX+","+mouseY);
}


