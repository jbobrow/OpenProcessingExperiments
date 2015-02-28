
size(450,450);
background(70,0,41);
smooth();

// cercle
fill(255,0,0);
noStroke();
ellipse(400,360,40,40);


//tot el que hi ha entre push i popMatrix queda afectat per girs
//(i trasllacions i escala si cal)
pushMatrix();


// quadrat
rotate(radians(8));
fill(255,170,0);
rect(100,100,200,200);

popMatrix();
//aqui s'acaba el girar

// amb gruix 5
// pinta una ratlla

strokeWeight(5);
stroke(165,0,205);
line(0,300,450,400);

stroke(165,0,105);
line(400,0,350,450);

stroke(165,100,105);
line(390,0,320,450);

stroke(165,150,105);
line(380,0,300,450);



