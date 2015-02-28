
// Déclaration variable
float x;
float y;


void setup() {
  size(400,400);
  frameRate(30);
  smooth();
  noStroke();

//centre monstre
x=width*0.5;
y=height*0.8;

}

void draw() {
        background(127); 
        
  

//pieds
fill(0);
arc(245,y+50, 40, 40, 0, PI+QUARTER_PI); //inspiré du cours
arc(130,y+48, 40, 40, 0, PI+QUARTER_PI);
arc(190,y+55, 40, 40, 0, PI+QUARTER_PI);

//tronc
fill(102,0,0);
ellipse(x,y-40,380,190);

fill(143,0,0);
ellipse(x,y-40,350,190);

//oeil gauche
  fill (0);
  ellipse (x-50, y-170, 130, 130);
  
//contour blanc   
    fill(255); 
    ellipse(x-50,y-170,125,100);
  
//contour noir (Boucle for)
for(int i=0; i<=85; i++)
  {
  fill(0+i*2.5);
  ellipse(x-40,y-175, 85-i,85-i);
  }
  
 
//pupille
fill(255);
ellipse(x-50, y-177, 15, 15);

fill(255);
ellipse(x-62,y-200, 20,20);

//fin oeil gauche


//oeil droit
fill(0);
ellipse(x+26,y-170,90,90);

  
//contour blanc  
    fill(255); 
    ellipse(x+25,y-170,85,75);

  
//contour noir (Boucle For)
  for(int i=0; i<=65; i++)
  {
  fill(0+i*2.5);
  ellipse(x+34,y-173, 65-i,65-i);
  }

//pupille
 fill(255);
ellipse(x+20, y-165, 12, 12); 

fill(255);
ellipse(x+13, y-185, 18, 18); 

// fin oeil droit

 

//bouche
  fill(0);
  beginShape();
  curveVertex(x-40,y-100);
  curveVertex(x-60,y-65);
  curveVertex(x+50,y-65);
  curveVertex(x+20,y-100);
  curveVertex(x-40,y-100);
  curveVertex(x-60,y-65);
  curveVertex(x+70,y-65);
  endShape();
  
  //dent
  fill(255);
  rect(189,215,20,30,10);
  

//sourcils

//sourcil gauche   
fill(0);
pushMatrix();
   translate(x-180,y-290);
   rotate(PI*0.25);
   rect(80,-80,108,15,7);
   popMatrix();
   
//sourcil droit   
   fill(0);
   pushMatrix();
   translate(x+70,y-390);
   rotate(PI*3/4);
   rect(100,-85,75,15,7);
   popMatrix();
   
    

   
//affichage curseur
text(mouseX+"=x/y="+mouseY,mouseX+5,mouseY);





     
}



