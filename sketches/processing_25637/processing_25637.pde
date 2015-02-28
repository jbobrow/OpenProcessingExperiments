
//size(1280,720); //hd 16:9  (1.777777777777(8))
size(720,405); //16:9
background(255);
smooth();

//elipse
fill(255,0,0);
strokeWeight(4);
stroke(255,255,0);
ellipse(random(width), random(height), 50, 50);


strokeWeight(1);
//linha
stroke(0,255,255);
line(random(width), random(height), random(width), random(height));

//ponto
strokeWeight(10);
point(random(width), random(height));
strokeWeight(1);

//arco * radian(); converte valor radiano em graus
arc(random(width), random(height), 100, 100, radians(0), radians(random(360)));

//quadrilatero
noFill();
quad(random(width), random(height), random(width), random(height), random(width), random(height), random(width), random(height));

//rectangulo / quadrado
fill(random(255),random(255),random(255));
rect(random(width), random(height), random(width), random(height));

//triangulo
fill(random(255),random(255),random(255));
triangle(random(width), random(height), random(width), random(height), random(width), random(height));

saveFrame("shapes.jpg");

