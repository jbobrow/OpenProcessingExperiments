
float x;
float y;

size(400,400);
smooth();

//implentation de l'"origine au coin supérieur gauche
x = 0; 
y = 0;

background(100); //couleur arrière plan: gris

//Gazon
stroke(50,100,20); //vert
int z = 0; // initialisation
while ( z < width ) { // tant que Z est plus petit que la largeur
line(z,+y+350,z,width); // barreaux 
strokeWeight(1); // grosseur des barreaux
z = z + 4; // incrementation
}


//corps du monstre
fill(155,156,2); //RVB
noStroke();
beginShape();
curveVertex(x+39+90,  y+157);
curveVertex(x+39+90,  y+157);
curveVertex(x+41+90,  y+195);
curveVertex(x+53+90,  y+220);
curveVertex(x+70+90,  y+241);
curveVertex(x+85+90,  y+253);
curveVertex(x+111+90, y+263);
curveVertex(x+138+90, y+267);
curveVertex(x+172+90, y+270);
curveVertex(x+207+90, y+266);
curveVertex(x+232+90, y+261);
curveVertex(x+255+90, y+244);
curveVertex(x+264+90, y+227);
curveVertex(x+243+90, y+227);
curveVertex(x+229+90, y+237);
curveVertex(x+216+90, y+242);
curveVertex(x+205+90, y+241);
curveVertex(x+171+90, y+252);
curveVertex(x+118+90, y+251);
curveVertex(x+68+90,  y+226);
curveVertex(x+59+90,  y+163);
curveVertex(x+77+90,  y+178);
curveVertex(x+96+90,  y+172);
curveVertex(x+114+90, y+179);
curveVertex(x+140+90, y+172);
curveVertex(x+157+90, y+185);
curveVertex(x+207+90, y+170);
curveVertex(x+227+90, y+187);
curveVertex(x+250+90, y+159);
curveVertex(x+238+90, y+133);
curveVertex(x+216+90, y+117);
curveVertex(x+173+90, y+104);
curveVertex(x+94+90,  y+110);
curveVertex(x+39+90,  y+157);
curveVertex(x+94+90,  y+265);
endShape();



//bras du monstre
beginShape();
curveVertex(x+21,  y+207.0);
curveVertex(x+23,  y+210.0);
curveVertex(x+30,  y+214.0);
curveVertex(x+133, y+195.0);
curveVertex(x+133, y+200.0);
curveVertex(x+31,  y+216.0);
curveVertex(x+13,  y+220.0);
curveVertex(x+7,   y+206.0);
curveVertex(x+15,  y+212.0);
curveVertex(x+16,  y+194.0);
curveVertex(x+21,  y+205.0);
curveVertex(x+22,  y+206.0);
endShape();


//langue du monstre
fill(155,10,25);
beginShape();
curveVertex(x+175, y+235.0-23);
curveVertex(x+159, y+251.0-23);
curveVertex(x+180, y+220.0-23);
curveVertex(x+195, y+212.0-23);
curveVertex(x+204, y+215.0-23);
curveVertex(x+195, y+231.0-23);
curveVertex(x+175, y+235.0-23);
curveVertex(x+159, y+251.0-23);
curveVertex(x+191, y+215.0-23);
endShape();


//yeux du monstre
stroke(1);
strokeWeight(1);
fill(256,256,256);
ellipse(x+300 ,y+140,30,30);
fill(0,0,0);
ellipse(x+300 ,y+140,3,3);
fill(256,256,256);
ellipse(x+250 ,y+130,75,65);
fill(0,0,0);
ellipse(x+265 ,y+145,3,3);



                
                
