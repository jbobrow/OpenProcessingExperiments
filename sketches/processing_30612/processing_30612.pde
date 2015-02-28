
size (500,500); 
background (255);  
smooth(); 
noStroke();

// Padrão de zebra

for ( int i = 0; i < 2000; i = i +1)
{
 
    stroke (0);
    line(random(width), random(height), random(width), random(height) );
    stroke (255);
    line(random(25), random(height/2), random(25,50), random(height) );
    line(random(75,100), random(height/2), random(100,125), random(height*2) );
    line(random(150,175), random(height/2), random(175,200), random(height) );
    line(random(225,250), random(height*2), random(250,275), random(height/2) );
    line(random(300,325), random(height), random(325,350), random(height+i) );
    line(random(375,400), random(height/10), random(400,425), random(height) );
    line(random(450,475), random(height), random(475,500), random(height/2) );
}  

// Vertex sobreposto (corpo de zebra)

strokeWeight(0.5);
stroke (0);
fill(255);
translate(0,-25);
beginShape();
vertex(-5, 0);
vertex(500, 0);
vertex(500, 250);
vertex(430, 200);
vertex(490, 100);
vertex(400, 190);
vertex(480, 80);
vertex(380,180);
vertex(470,60);
vertex(360,170);
vertex(460,40);
vertex(340,160);
vertex(450,25);
vertex(280, 130);
vertex(220, 200);
vertex(200, 240);
vertex(160, 250);
vertex(140, 255);
vertex(120, 250);
vertex(100, 245);
vertex(70, 250);
vertex(50, 265);
vertex(40, 250);
vertex(55, 220);
vertex(70, 200);
vertex(90, 190);
vertex(115, 210);
vertex(135, 165); // ponto mais alto da cauda
vertex(95, 175);
vertex(65, 188);
vertex(45, 220);
vertex(32, 246);
vertex(35, 260);
vertex(40, 290);
vertex(50, 330);
vertex(-30, 530);
vertex(120, 380);
vertex(150, 600);
vertex(200, 380);
vertex(280, 370);
vertex(360, 580);
vertex(360, 370);
vertex(530, 610);
vertex(430, 350);
vertex(385, 280);
vertex(380, 250);
vertex(390, 275);
vertex(404, 287);
vertex(425, 290);
vertex(470, 282);
vertex(450, 280);
vertex(505, 295);
vertex(505, 550);
vertex(-5, 550); // canto inferior esquerdo
endShape(CLOSE);


