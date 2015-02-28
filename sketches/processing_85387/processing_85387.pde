
void setup()
{
  size(900,900);
  smooth();
}

void draw()
{
background(255);
stroke(100,23,131);
noFill();
strokeWeight(15);
/* donc  tu fais une gradation de complexité des formes. 
élargissement du vocabulaire formel puis aboutissementn au moucharabié
*/

rect(90,40,194,194);



 translate(0,200);
 
stroke(100,23,131);
noFill();
// les 4gros
strokeWeight(15);
point(195,195);
rect(90,90,90,90);
rect(195,90,90,90);
rect(90,195,90,90);
rect(195,195,90,90);

//les quatre moyens
strokeWeight(10);
quad (135,90,180,135,135,180,90,135);
quad(240,195,285,240,240,285,195,240);
quad(240,90,285,135,240,180,195,135);
quad(135,195,180,240,135,285,90,240);

//les quatre petits
strokeWeight(05);
quad(113,115,113,156,158,156,158,115);

translate(105,0);
quad(113,115,113,156,158,156,158,115);

translate(0,105);
quad(113,115,113,156,158,156,158,115);

translate(-105,0);
quad(113,115,113,156,158,156,158,115);

 stroke(100,23,131);
 noFill();
//rect(120,120,150,150);

/*
stroke(100,23,131);
line(120,120,270,270);
line(120,270,270,120);
*/


stroke(100,23,131);
noFill();
translate (250,-140);
scale(1.2);
//triangle extérieur
strokeWeight(15);
triangle(120,110,195,185,270,110);
triangle(110,120,185,195,110,270);
triangle(120,280,195,205,270,280);
triangle(280,120,205,195,280,270);

//triangle intérieur
strokeWeight(10);
triangle(160,150,195,110,230,150);
triangle(150,160,110,195,150,230);
triangle(195,280,230,240,160,240);
triangle(280,195,240,230,240,160);

//triangle extreme intérieur
strokeWeight(05);
triangle(195,240,210,260,180,260);
triangle(240,195,260,180,260,210);
triangle(150,195,130,180,130,210);
triangle(195,150,180,130,210,130);


// droite première ligne
translate(240,0);
strokeWeight(15);
triangle(120,110,195,185,270,110);
triangle(110,120,185,195,110,195);
triangle(195,280,195,205,270,280);
triangle(280,120,205,195,280,270);
strokeWeight(10);
translate(10,0);
quad(135,195,180,240,135,285,90,240);

translate(-490,240);

strokeWeight(15);
triangle(110,120,185,195,110,195);
triangle(195,280,195,205,270,280);
strokeWeight(10);
translate(-88,3);
rect(195,195,85,85);

// gauche deuxième ligne
translate(width/1.88, height/2.33);
rotate(PI/-1.0);
strokeWeight(15);
triangle(110,120,185,195,110,195);
triangle(195,280,195,205,270,280);
strokeWeight(10);
translate(-88,3);
rect(195,195,85,85);
scale(0.9);
translate(230,-77);
quad(135,195,180,240,135,285,90,240);

// milieu deuxième ligne
stop();
 translate(-660,-180);
 scale(2); 
 triangle(195,280,195,205,270,280);
 strokeWeight(7);
quad(278,276,240,239,240,195,278,195);

translate(159,136);
scale(0.28);
 triangle(195,280,195,205,270,280);
 


scale(1.9);
translate(-280,0);
//triangles imbriqués
stroke(100,23,131);
noFill();
triangle(120,110,195,185,270,110);
triangle(110,120,185,195,110,270);
triangle(120,280,195,205,270,280);
triangle(280,120,205,195,280,270);

//triangles milieu

triangle(195,170,145,120,245,120);
triangle(195,220,145,270,245,270);
triangle(220,195,270,145,270,245);
triangle(170,195,120,145,120,245);

//triangles centre

triangle(170,130,195,155,220,130);
triangle(130,168,155,195,130,220);
triangle(195,235,170,260,220,260);
triangle(235,195,260,170,260,220);

//1ere ligne milieu
translate(-35,190);
scale(2);
 quad(278,276,240,239,240,195,278,195);
translate(width/1.90, height/1.90);
rotate(PI/-1.0);
 quad(278,276,240,239,240,195,278,195);
 
//haut droite
translate(270,145);
scale(0.5);
rect(195,195,85,85);
scale(0.5);
translate(100,284);
rect(195,195,85,85); 
translate(-90,0);
rect(195,195,85,85); 
scale(0.5);
translate(192,100);
rect(195,195,85,85); 
translate(0,-90);
rect(195,195,85,85); 
translate(0,-90);
rect(195,195,85,85); 
translate(0,-90);
rect(195,195,85,85); 
translate(0,-90);
rect(195,195,85,85); 
translate(0,-90);
rect(195,195,85,85); 

scale(0.5);
translate(190,100);
rect(195,195,85,85); 
translate(90,0);
rect(195,195,85,85); 
translate(90,0);
rect(195,195,85,85);
translate(90,0);
rect(195,195,85,85);
translate(90,0);
rect(195,195,85,85); 
translate(90,0);
rect(195,195,85,85); 
translate(90,0);
rect(195,195,85,85); 
translate(90,0);
rect(195,195,85,85); 
translate(90,0);
rect(195,195,85,85); 
translate(90,0);
rect(195,195,85,85); 
translate(90,0);
rect(195,195,85,85); 
translate(90,0);
rect(195,195,85,85); 
translate(90,0);
rect(195,195,85,85); 
translate(90,0);
rect(195,195,85,85); 
translate(90,0);
rect(195,195,85,85); 
 
}
