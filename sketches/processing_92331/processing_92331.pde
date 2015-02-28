
size(100,100);
background(255);

//top left hand pattern
noStroke();
smooth();
fill(99,178,227);
quad(20,40,40,40,50,50,30,50);//inner shape 1
quad(40,20,50,30,50,50,40,40);//inner shape 2
fill(177,211,240);
quad(10,30,30,30,40,40,20,40);//outer shape 1
quad(30,10,40,20,40,40,30,30);//outer shape 2

//top right hand pattern
noStroke();
smooth();
fill(177,211,240);
quad(60,20,60,40,50,50,50,30);//inner shape 1
quad(80,40,60,40,50,50,70,50);//inner shape 2
fill(99,178,227);
quad(70,10,70,30,60,40,60,20);//outer shape 1
quad(90,30,70,30,60,40,80,40);//outer shape 2

//bottom left hand pattern
noStroke();
smooth();
fill(177,211,240);
quad(30,50,50,50,40,60,20,60);//inner shape 1
quad(50,50,50,70,40,80,40,60);//inner shape 2
fill(99,178,227);
quad(20,60,40,60,30,70,10,70);//outer shape 1
quad(40,60,40,80,30,90,30,70);//outer shape 2

//bottom right hand pattern
noStroke();
smooth();
fill(177,211,240);
quad(60,60,80,60,90,70,70,70);//outer shape 1
quad(60,60,70,70,70,90,60,80);//outer shape 2
fill(99,178,227);
quad(50,50,70,50,80,60,60,60);//inner shape 1
quad(50,50,60,60,60,80,50,70);//inner shape 2

////criss cross
smooth();
stroke(255);
strokeWeight(1);
strokeCap(SQUARE);
line(20,20,80,80);
line(80,20,20,80);
line(50,20,50,80);
line(20,50,80,50);

//outer triangles
noStroke();
fill(99,178,227);
triangle(10,40,20,50,10,60);
triangle(40,10,60,10,50,20);
triangle(80,50,90,40,90,60);
triangle(50,80,60,90,40,90);
smooth();
stroke(99,178,227);
strokeWeight(1);
strokeCap(SQUARE);
line(30,50,20,50);
line(50,20,50,30);
line(70,50,80,50);
line(50,70,50,80);

//The centre square draws on top of pattern
noStroke();
smooth();
fill(255);
quad(50,40,60,50,50,60,40,50);

//top left outer square & mid lines
smooth();
stroke(99,178,227);
strokeWeight(1);
strokeCap(SQUARE);
line(20,20,30,30);
noStroke();
fill(99,178,227);
rect(10,10,10,10);

// top right outer square & mid lines
smooth();
stroke(99,178,227);
strokeWeight(1);
strokeCap(SQUARE);
line(80,20,70,30);
noStroke();
fill(99,178,227);
rect(80,10,10,10);

// bottom left square & mid lines
smooth();
stroke(99,178,227);
strokeWeight(1);
strokeCap(SQUARE);
line(30,70,20,80);
noStroke();
fill(99,178,227);
rect(10,80,10,10);

// bottom right square & mid lines
smooth();
stroke(99,178,227);
strokeWeight(1);
strokeCap(ROUND);
line(70,70,80,80);
noStroke();
fill(99,178,227);
rect(10,80,10,10);
rect(80,80,10,10);
















