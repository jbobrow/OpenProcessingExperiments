
float x;
float y;


void setup() {
        size(400,400); // La taille de la fenetre.
        frameRate(30); // Le nombre d'images par seconde.
        smooth(); // Lisser les formes dessinees.
        noLoop();
        noStroke();
       
        
        
        
        
}

void draw() {

//---------Main droite----------
fill(0);
ellipse(350,120,45,58);
//----------Main gauche-----------
fill(0);
ellipse(65,120,45,58);
//-------------Jambe droite----------
fill(0);
beginShape();
curveVertex(222,240);
curveVertex(235, 279);
curveVertex(310, 341);
curveVertex(312, 256);
curveVertex(266,198);
endShape(CLOSE);
//----------Jambe gauche-------------
fill(0);
beginShape();
curveVertex(64,300);
curveVertex(140,279);
curveVertex(69,315);
curveVertex(80,256);
curveVertex(124,198);
endShape(CLOSE);
//----------Visage-------------
fill(0);
ellipse(210,180,300,300);


//----------Dents--------------
translate(150,200);
fill(0);
stroke(255);
beginShape(TRIANGLE_STRIP);
vertex(30, 75);
vertex(40, 20);
vertex(50, 75);
vertex(60, 20);
vertex(70, 75);
vertex(80, 20);
vertex(90, 75);
endShape();
noStroke();
//----------Yeux*-------------
          //Oeil gauche
          translate(45,-130);
          fill(255);
          ellipse(65,44,60,60);
          fill(255,0,0);
          ellipse(75, 44, 30, 30);
          fill(255);
          ellipse(81,39, 6, 6);
          // Oeil droit
          translate(-50,-5);
          fill(255);
          ellipse(20,50, 60, 60);
          fill(255,0,0);
          ellipse(30,50, 30, 30);
          fill(255);
          ellipse(36, 45, 6, 6);
//-----------Nez----------------
ellipse(67,110,24,56);
//----------Corne droite---------------
fill(161,13,255);
translate(145,-100);
rotate(PI/5);
triangle(30,75,58,20,86,75);
//----------Corne gauche--------------
translate(-85,80);
rotate(PI/3.7);
triangle(30,75,58,20,86,75);
//-------------Boutons(droit)----------------

translate(8,17);
stroke(188,152,123);
point(195, -120);
point(205, -100);
point(190, -100);
point(185, -107);
point(195, -110);
point(210, -110);
point(185, -120);
point(208, -121);
//------------Boutons(gauche)----------------
translate(-15, 158);
point(195, -120);
point(205, -100);
point(190, -100);
point(185, -107);
point(195, -110);
point(210, -110);
point(185, -120);
point(208, -121);






//*Source : Processing: A Programming Handbook for Visual Designers and Artists 
//Par Casey Reas,Ben Fry (21-02) (Yeux) (22-03)
}
