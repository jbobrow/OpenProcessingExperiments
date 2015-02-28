
 
 //LE MONSTRE, PAR XAVIER BÉGIN-LEBLANC-------------->>
 
 
 //Identification des variables du monstre;
PImage b;
float Xx = 200;
float Yy = 200;


void setup() {
    
  size(400,400);
  smooth();
  noStroke();
  b = loadImage("BckGround_POSSIBLE.jpg");
}
 
void draw () {
  
image(b, 0, 0);
  
  //______________________________________
  //Body Shape. __________________________
  //Position statique des éléments du Monstre
    //Head de la tortue Shape. 
  noStroke();
  fill(199, 255, 204);
  rect(Xx-105, Yy-130,231, 204);
  
  noStroke();
  fill(128, 206, 135);
  rect(Xx-76, Yy+74, 202, 66); 
  
  //______________________________________
  //Pattes gauche et droite.
  noStroke(); 
  fill(199, 255, 204);
  rect(Xx-66, Yy+140, 25, 36);
  rect(Xx+100, Yy+140, 25, 36);  
  
 //______________________________________
  //Bras Gauche et Droite
  noStroke(); 
  fill(199, 255, 204);
  rect(Xx-103, Yy+86, 27, 19);
  rect(Xx+126, Yy+86, 27, 19);

 //______________________________________  
 //Bandana
 fill(113, 1, 137);
 rect( Xx-105, Yy-104, 232, 71);
 
 //______________________________________
 //Les yeux. 
 
 //Lorsque les yeux se ferment en "X" pendant un clic
 if (mousePressed) 
 {  
 Xx =  random(195, 202);
 Yy = random(195, 202);
 
stroke(0); 
 strokeWeight(10); 
 line(Xx+5, Yy-46, 260, 123);
 line(Xx-90, Yy-81, 161, 137);
 
 }
 
 //Les yeux en position "Repos"
 else {
  
 fill(255);
 ellipse(Xx-60, Yy-60, 68, 68);
 ellipse(Xx+38, Yy-75, 85, 85);
 
 //Pupilles
 
    fill(0);
  fill(255);
  ellipse(Xx+38, Yy-75, 85, 85);
  
  // pupille droite suivant le curseur
  
  fill(0);
  float x1 = map(mouseX,0.5,width,238,338-75);
   float y1 = map(mouseY,0.5,height,125,225-75);
  ellipse(x1,y1,10,10);
 
 //Pupille gauche suivant aussi le curseur 
  fill(0);
  float x2 = map(mouseX,0,width,134,234-85);
   float y2 = map(mouseY,0,height,138,238-85);
  ellipse(x2,y2,40,40); 
 
 }

 //______________________________________  
 //La bouche sous la condition de la bouche fermée;
noStroke(); 
fill(0);
if (mousePressed) 
{  
  beginShape();
  curveVertex(207,254);
  curveVertex(207,254);
  curveVertex(234,235);
  curveVertex(267,254);
  curveVertex(267,254);
  endShape();
} 

//La bouche en position "statique sans clic"
else{
  beginShape();
  curveVertex(180,254);
  curveVertex(180,254);
  curveVertex(200,215); 
  curveVertex(234,210);
  curveVertex(267,254);
  curveVertex(267,254);
  endShape();
}
  
println(mouseX + "-" + mouseY);

}  



