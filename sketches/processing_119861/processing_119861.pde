
int CambioColor;
void setup(){
size(1000,500);
background(158,40,28);
stroke(83,83,83);
frameRate(600);
//lineas horizontales
line(0,50,1000,50);line(0,49,1000,49);line(0,51,1000,51);
line(0,99,1000,99);line(0,100,1000,100);line(0,101,1000,101);
line(0,149,1000,149);line(0,150,1000,150);line(0,151,1000,151);
line(0,199,1000,199);line(0,200,1000,200);line(0,201,1000,201);
line(0,249,1000,249);line(0,250,1000,250);line(0,251,1000,251);
line(0,299,1000,299);line(0,300,1000,300);line(0,301,1000,301);
line(0,349,1000,349);line(0,350,1000,350);line(0,351,1000,351);
line(0,399,1000,399);line(0,400,1000,400);line(0,401,1000,401);
line(0,449,1000,449);line(0,450,1000,450);line(0,451,1000,451);
//lineas verticales 1,3,5,7,9
line(199,0,199,50);line(200,0,200,50);line(201,0,201,50);
line(399,0,399,50);line(400,0,400,50);line(401,0,401,50);
line(599,0,599,50);line(600,0,600,50);line(601,0,601,50);
line(799,0,799,50);line(800,0,800,50);line(801,0,801,50);//
line(199,100,199,150);line(200,100,200,150);line(201,100,201,150);
line(399,100,399,150);line(400,100,400,150);line(401,100,401,150);
line(599,100,599,150);line(600,100,600,150);line(601,100,601,150);
line(799,100,799,150);line(800,100,800,150);line(801,100,801,150);//
line(199,200,199,250);line(200,200,200,250);line(201,200,201,250);
line(399,200,399,250);line(400,200,400,250);line(401,200,401,250);
line(599,200,599,250);line(600,200,600,250);line(601,200,601,250);
line(799,200,799,250);line(800,200,800,250);line(801,200,801,250);//
line(199,300,199,350);line(200,300,200,350);line(201,300,201,350);
line(399,300,399,350);line(400,300,400,350);line(401,300,401,350);
line(599,300,599,350);line(600,300,600,350);line(601,300,601,350);
line(799,300,799,350);line(800,300,800,350);line(801,300,801,350);//
line(199,400,199,450);line(200,400,200,450);line(201,400,201,450);
line(399,400,399,450);line(400,400,400,450);line(401,400,401,450);
line(599,400,599,450);line(600,400,600,450);line(601,400,601,450);
line(799,400,799,450);line(800,400,800,450);line(801,400,801,450);//
//lineas verticales 2.4.6.8.10
line(99,50,99,100);line(100,50,100,100);line(101,50,101,100);
line(299,50,299,100);line(300,50,300,100);line(301,50,301,100);
line(499,50,499,100);line(500,50,500,100);line(501,50,501,100);
line(699,50,699,100);line(700,50,700,100);line(701,50,701,100);
line(899,50,899,100);line(900,50,900,100);line(901,50,901,100);//
line(99,150,99,200);line(100,150,100,200);line(101,150,101,200);
line(299,150,299,200);line(300,150,300,200);line(301,150,301,200);
line(499,150,499,200);line(500,150,500,200);line(501,150,501,200);
line(699,150,699,200);line(700,150,700,200);line(701,150,701,200);
line(899,150,899,200);line(900,150,900,200);line(901,150,901,200);//
line(99,250,99,300);line(100,250,100,300);line(101,250,101,300);
line(299,250,299,300);line(300,250,300,300);line(301,250,301,300);
line(499,250,499,300);line(500,250,500,300);line(501,250,501,300);
line(699,250,699,300);line(700,250,700,300);line(701,250,701,300);
line(899,250,899,300);line(900,250,900,300);line(901,250,901,300);//
line(99,350,99,400);line(100,350,100,400);line(101,350,101,400);
line(299,350,299,400);line(300,350,300,400);line(301,350,301,400);
line(499,350,499,400);line(500,350,500,400);line(501,350,501,400);
line(699,350,699,400);line(700,350,700,400);line(701,350,701,400);
line(899,350,899,400);line(900,350,900,400);line(901,350,901,400);//
line(99,450,99,500);line(100,450,100,500);line(101,450,101,500);
line(299,450,299,500);line(300,450,300,500);line(301,450,301,500);
line(499,450,499,500);line(500,450,500,500);line(501,450,501,500);
line(699,450,699,500);line(700,450,700,500);line(701,450,701,500);
line(899,450,899,500);line(900,450,900,500);line(901,450,901,500);//




}

void draw(){
  if (mousePressed && (mouseButton ==RIGHT)){
    noStroke();
    fill (random(0,255),random(0,255),random(0,255));
  }
  if (mousePressed && (mouseButton == LEFT)){
  ellipse(random(mouseX-10, mouseX+10), random(mouseY-10,mouseY+10),3,3);
}
  if (keyPressed == true){
    background(158,40,28);
    stroke(83,83,83);
//lineas horizontales
line(0,50,1000,50);line(0,49,1000,49);line(0,51,1000,51);
line(0,99,1000,99);line(0,100,1000,100);line(0,101,1000,101);
line(0,149,1000,149);line(0,150,1000,150);line(0,151,1000,151);
line(0,199,1000,199);line(0,200,1000,200);line(0,201,1000,201);
line(0,249,1000,249);line(0,250,1000,250);line(0,251,1000,251);
line(0,299,1000,299);line(0,300,1000,300);line(0,301,1000,301);
line(0,349,1000,349);line(0,350,1000,350);line(0,351,1000,351);
line(0,399,1000,399);line(0,400,1000,400);line(0,401,1000,401);
line(0,449,1000,449);line(0,450,1000,450);line(0,451,1000,451);
//lineas verticales 1,3,5,7,9
line(199,0,199,50);line(200,0,200,50);line(201,0,201,50);
line(399,0,399,50);line(400,0,400,50);line(401,0,401,50);
line(599,0,599,50);line(600,0,600,50);line(601,0,601,50);
line(799,0,799,50);line(800,0,800,50);line(801,0,801,50);//
line(199,100,199,150);line(200,100,200,150);line(201,100,201,150);
line(399,100,399,150);line(400,100,400,150);line(401,100,401,150);
line(599,100,599,150);line(600,100,600,150);line(601,100,601,150);
line(799,100,799,150);line(800,100,800,150);line(801,100,801,150);//
line(199,200,199,250);line(200,200,200,250);line(201,200,201,250);
line(399,200,399,250);line(400,200,400,250);line(401,200,401,250);
line(599,200,599,250);line(600,200,600,250);line(601,200,601,250);
line(799,200,799,250);line(800,200,800,250);line(801,200,801,250);//
line(199,300,199,350);line(200,300,200,350);line(201,300,201,350);
line(399,300,399,350);line(400,300,400,350);line(401,300,401,350);
line(599,300,599,350);line(600,300,600,350);line(601,300,601,350);
line(799,300,799,350);line(800,300,800,350);line(801,300,801,350);//
line(199,400,199,450);line(200,400,200,450);line(201,400,201,450);
line(399,400,399,450);line(400,400,400,450);line(401,400,401,450);
line(599,400,599,450);line(600,400,600,450);line(601,400,601,450);
line(799,400,799,450);line(800,400,800,450);line(801,400,801,450);//
//lineas verticales 2.4.6.8.10
line(99,50,99,100);line(100,50,100,100);line(101,50,101,100);
line(299,50,299,100);line(300,50,300,100);line(301,50,301,100);
line(499,50,499,100);line(500,50,500,100);line(501,50,501,100);
line(699,50,699,100);line(700,50,700,100);line(701,50,701,100);
line(899,50,899,100);line(900,50,900,100);line(901,50,901,100);//
line(99,150,99,200);line(100,150,100,200);line(101,150,101,200);
line(299,150,299,200);line(300,150,300,200);line(301,150,301,200);
line(499,150,499,200);line(500,150,500,200);line(501,150,501,200);
line(699,150,699,200);line(700,150,700,200);line(701,150,701,200);
line(899,150,899,200);line(900,150,900,200);line(901,150,901,200);//
line(99,250,99,300);line(100,250,100,300);line(101,250,101,300);
line(299,250,299,300);line(300,250,300,300);line(301,250,301,300);
line(499,250,499,300);line(500,250,500,300);line(501,250,501,300);
line(699,250,699,300);line(700,250,700,300);line(701,250,701,300);
line(899,250,899,300);line(900,250,900,300);line(901,250,901,300);//
line(99,350,99,400);line(100,350,100,400);line(101,350,101,400);
line(299,350,299,400);line(300,350,300,400);line(301,350,301,400);
line(499,350,499,400);line(500,350,500,400);line(501,350,501,400);
line(699,350,699,400);line(700,350,700,400);line(701,350,701,400);
line(899,350,899,400);line(900,350,900,400);line(901,350,901,400);//
line(99,450,99,500);line(100,450,100,500);line(101,450,101,500);
line(299,450,299,500);line(300,450,300,500);line(301,450,301,500);
line(499,450,499,500);line(500,450,500,500);line(501,450,501,500);
line(699,450,699,500);line(700,450,700,500);line(701,450,701,500);
line(899,450,899,500);line(900,450,900,500);line(901,450,901,500);//

  }
     println(mouseX+","+mouseY);
}


