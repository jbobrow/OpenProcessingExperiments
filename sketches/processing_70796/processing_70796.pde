

//Eric Beasley//GAM240 Assignment 2
//September 10, 2012


background(0);
size(800,800);


//ellipse(400, 400, 470, 570); //face


ellipse(500, 360, 100, 60); //eyes
ellipse(300, 360, 100, 60);


bezier(10, 10, 10, 10, 10, 10, 10, 10); // nose

fill(random(200),random(200),random(200));

/*for (int l = 0; l < 40; l++) {
float i = random(500);
fill(random(200),random(200),random(200));
triangle(random(10)*100, random(10
)*10, random(500), random(10)*10, random(10)*10, random(10)*10);
}*/

//for the face
for (int l = 0; l < 50; l++) {
float i = random(200)+300 , j = random(200)+300;
fill(random(200),random(200),random(200));
ellipse(i,j, (random(150)+150), (random(200)+200));
}

//for the eyes
for (int l = 0; l < 10; l++) {
float i = random(20)+275 , j = random(20)+300;
fill(random(200),random(200),random(200));
ellipse(i,j, (random(30)+80), (random(40)+30));

float a = random(20)+475 , b = random(20)+300;
fill(random(200),random(200),random(200));
ellipse(a,b, (random(30)+80), (random(40)+30));
}

//for the nose
for (int l = 0; l < 10; l++) {
float i = random(25)+325 , j = random(25)+400, m = i+random(50), n = j+random(50);
float o = m+random(50), p = n+random(50);
fill(random(200),random(200),random(200));
triangle(i, j, i+100, j-50, i+100, j+50);
}

//for the mouth
for (int l = 0; l < 10; l++) {
float i = random(20)+275 , j = random(20)+500;
fill(random(200),random(200),random(200));
rect(i, j,(random(30)+120), (random(40)+30));
}



