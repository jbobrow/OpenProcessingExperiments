
//centre du monstre (au centre du ventre)
float x;
float y;
//vert
color c = color(201, 223, 0);
//rouge
color r = color (191, 20 , 0);
//jaune
color j = color (253, 255, 0);

void setup(){ 
  size(400,400);
  frameRate(30);
  smooth();
  
//centre du monstre  
 x= width*0.5;
 y= height* 0.72;
}


void draw (){
  
 background(127);
    
//oeil gauche
  fill (255);
  stroke (0);
  strokeWeight(0.5);
  ellipse (x-12, y-248, 25, 25);
  
   //iris
    noStroke();
    fill(27,179,143); //couleur turquoise
    ellipse(x-14, y-249, 13, 13);
  
    //pupille
      fill(0);
      ellipse (x-14 ,y-249, 7, 7);
    
      //cercle de lumiere
        fill(255);
        ellipse (x-18, y-250, 3, 3);
        ellipse (x-16, y-249, 1, 1);
  
//oeil droit
  fill (255);
  stroke (0);
  strokeWeight(0.5);
  ellipse (x+12, y-248, 25, 25);
  
   //iris
     noStroke();
     fill(27,179,143);
     ellipse(x+15, y-249, 13, 13);
  
     //pupille
       fill(0);
       ellipse (x+15 ,y-249, 7, 7); 
  
      //cercle de lumiere
        fill(255);
        ellipse (x+18, y-250, 3, 3);
        ellipse (x+16, y-249, 1, 1);
  


//paupiere gauche
  fill(c);  
  noStroke();
  arc(x-12, y-251, 25, 25, radians(190), radians(370));
  
//paupiere droite
  arc(x+12, y-251, 25, 25, radians(170), radians(350));

//nez
  triangle (x, y-245, x+15, y-236, x-15, y-236);
  
  //narine
    stroke (0);
    strokeWeight(0.5);
    line (x+1, y-242, x+1, y-240);
    line (x-1, y-242, x-1, y-240);
  
//machoire
  noStroke();
  triangle (x, y-193, x-45, y-214, x+41, y-213);
     
//cou
  rect (x-4, y-211, 8, 140);
  
//bouche
 fill(r);
 noStroke();
 ellipse (x-2, y-217, 91, 20); 
 ellipse (x-2, y-228, 91, 20);
 noFill();
 stroke(c);
 strokeWeight (2);
 arc (x-2, y-228, 91, 20, radians(148), radians(390));
 arc(x-2, y-217, 91, 20, radians(-35), radians(210));
 
  //glotte
   noStroke();
   fill(148,20,0);
   ellipse (x-1, y-222, 15, 15);
   fill(223,0,48);
   ellipse (x-1,y-227, 2, 4);
   ellipse (x-1, y-225, 2, 3);
 
//dents de l'extérieur a l'interieur
//dent 1 haut gauche
  noStroke();
  fill(255);
  beginShape();
  curveVertex (x-38, y-234);
  curveVertex (x-38, y-234);
  curveVertex (x-38, y-229);
  curveVertex (x-35, y-223);
  curveVertex (x-34, y-229);
  curveVertex (x-31, y-236);
  curveVertex (x-31, y-236);
  endShape(CLOSE);

//dent 2 haut gauche
  noStroke();
  fill(255);
  beginShape();
  curveVertex (x-26, y-236);
  curveVertex (x-26, y-236);
  curveVertex (x-26, y-231);
  curveVertex (x-23, y-225);
  curveVertex (x-21, y-231);
  curveVertex (x-18, y-237);
  curveVertex (x-18, y-237);
  endShape(CLOSE);

//dent 3 haut gauche
  noStroke();
  fill(255);
  beginShape();
  curveVertex (x-14, y-237);
  curveVertex (x-14, y-237);
  curveVertex (x-15, y-232);
  curveVertex (x-11, y-225);
  curveVertex (x-9, y-232);
  curveVertex (x-6, y-238);
  curveVertex (x-6, y-238);
  endShape(CLOSE);

//dent 1 haut droit
  noStroke();
  fill(255);
  beginShape();
  curveVertex (x+26, y-236);
  curveVertex (x+26, y-236);
  curveVertex (x+30, y-229);
  curveVertex (x+31, y-223);
  curveVertex (x+34, y-229);
  curveVertex (x+34, y-234);
  curveVertex (x+34, y-234);
  endShape(CLOSE);

//dent 2 haut droit
  noStroke();
  fill(255);
  beginShape();
  curveVertex (x+14, y-237);
  curveVertex (x+14, y-237);
  curveVertex (x+17, y-231);
  curveVertex (x+19, y-225);
  curveVertex (x+22, y-231);
  curveVertex (x+22, y-236);
  curveVertex (x+22, y-236);
  endShape(CLOSE);

//dent 3 haut droit
  noStroke();
  fill(255);
  beginShape();
  curveVertex (x+1, y-238);
  curveVertex (x+1, y-238);
  curveVertex (x+4, y-232);
  curveVertex (x+6, y-226);
  curveVertex (x+9, y-236);
  curveVertex (x+9, y-237);
  curveVertex (x+9, y-237);
  endShape(CLOSE);

//dent 1 bas gauche
  noStroke();
  fill(255);
  beginShape();
  curveVertex (x-32, y-210);
  curveVertex (x-32, y-210);
  curveVertex (x-33, y-215);
  curveVertex (x-30, y-223);
  curveVertex (x-29, y-215);
  curveVertex (x-25, y-209);
  curveVertex (x-25, y-209);
  endShape(CLOSE);

//dent 2 bas gauche
  noStroke();
  fill(255);
  beginShape();
  curveVertex (x-20, y-209);
  curveVertex (x-20, y-209);
  curveVertex (x-20, y-214);
  curveVertex (x-17, y-221);
  curveVertex (x-16, y-214);
  curveVertex (x-13, y-208);
  curveVertex (x-13, y-208);
  endShape(CLOSE);

//dent bas droite
  noStroke();
  fill(255);
  beginShape();
  curveVertex (x+21, y-209);
  curveVertex (x+21, y-209);
  curveVertex (x+25, y-216);
  curveVertex (x+26, y-222);
  curveVertex (x+29, y-216);
  curveVertex (x+28, y-210);
  curveVertex (x+28, y-210);
  endShape(CLOSE);

//dent 2 bas droite
  noStroke();
  fill(255);
  beginShape();
  curveVertex (x+8, y-208);
  curveVertex (x+8, y-208);
  curveVertex (x+11, y-214);
  curveVertex (x+12, y-221);
  curveVertex (x+16, y-214);
  curveVertex (x+15, y-209);
  curveVertex (x+15, y-209);
  endShape(CLOSE);  
 
//pied gauche
  fill(c);
  ellipse (x-22, y+77, 10, 10);
  triangle (x-18, y+78, x-86, y+67, x-86, y+92);
  
  //lignes pied gauche
    stroke (j);
    strokeWeight(1.5);
    line (x-78, y+73, x-58, y+75);
    line (x-78, y+79, x-58, y+78);
    line (x-78, y+84, x-58, y+82);
  
    //griffes
      noStroke();
      fill (255);
      triangle (x-93, y+71, x-86, y+67, x-86, y+75);
      triangle (x-93, y+80, x-86, y+76, x-86, y+84);
      triangle (x-93, y+89, x-86, y+85, x-86, y+92);
  
//pied droit
  fill(c);
  ellipse (x+19, y+77, 10, 10);
  triangle (x+18, y+78, x+84,y+68, x+84, y+92);
    
  //lignes pied droite
    stroke (j);
    line (x+56, y+75, x+75, y+73);
    line (x+56, y+79, x+75, y+79);
    line (x+55, y+82, x+76, y+84);
    
    //griffes
      noStroke();
      fill (255);
      triangle (x+91, y+72, x+84, y+68, x+84, y+75);
      triangle (x+91, y+80, x+84, y+77, x+84, y+84);
      triangle (x+91, y+89, x+84, y+85, x+84, y+92);
    
//aille gauche (grosse)
strokeWeight(1);
fill(223, 255, 254);
stroke (173,222,217);
beginShape();
curveVertex (x-2, y-75);
curveVertex (x-2, y-75);
curveVertex (x-39, y-146);
curveVertex (x-76, y-189);
curveVertex (x-52, y-139);
curveVertex (x-2, y-75);
endShape(CLOSE);
line(x-4, y-78, x-67, y-175);
stroke(173,222,217);

//aille gauche (petite)
fill(223, 255, 254);
stroke (173,222,217);
beginShape();
curveVertex (x-3, y-75);
curveVertex (x-3, y-75);
curveVertex (x-46, y-103);
curveVertex (x-83, y-116);
curveVertex (x-52, y-95);
curveVertex (x-3, y-75);
endShape(CLOSE);
line(x-3, y-76, x-74, y-111);
stroke(173,222,217);

//aille droite (grosse)
fill(223, 255, 254);
stroke (173,222,217);
beginShape();
curveVertex (x+4, y-78);
curveVertex (x+4, y-78);
curveVertex (x+39, y-146);
curveVertex (x+76, y-189);
curveVertex (x+52, y-139);
curveVertex (x+4, y-78);
endShape(CLOSE);
line(x+4, y-78, x+68, y-175);
stroke(173,222,217);

//aille droite (petite)
fill(223, 255, 254);
stroke (173,222,217);
beginShape();
curveVertex (x+3, y-75);
curveVertex (x+3, y-75);
curveVertex (x+46, y-103);
curveVertex (x+83, y-116);
curveVertex (x+52, y-95);
curveVertex (x+3, y-75);
endShape(CLOSE);
line(x+3, y-76, x+74, y-111);
stroke(173,222,217);

//ventre (boucle dans le dégradé)
for(int i=0; i<=153; i++){
    noStroke();
    fill(201+i*0.5,223,0+i*0.2);
    ellipse (x, y-i*0.5, 153-i, 153-i);
}

  //taches sur le côté gauche du ventre
    fill(247,230,48);
    ellipse (x-61, y-39, 5,5);
    ellipse (x-57, y-33, 5,5);
    ellipse (x-65, y-31, 6,6);
    ellipse (x-61, y-26, 4,4);
    ellipse (x-69, y-26, 4,4);
    ellipse (x-69, y-24, 3,3);
    ellipse (x-64, y-20, 3,3);
    ellipse (x-71, y-18, 2,2);
    ellipse (x-65, y-13, 3,3);
    ellipse (x-70, y-12, 2,2);
    ellipse (x-66, y-7, 2,2);
    ellipse (x-74, y-6, 2,2);
    ellipse (x-70, y-4, 3,3);
    ellipse (x-74, y+1, 2,2);
    ellipse (x-71, y+3, 3,3);
    ellipse (x-74, y+6, 2,2);
    ellipse (x-70, y+7, 2,2);
    ellipse (x-73, y+11, 2,2); 

}
