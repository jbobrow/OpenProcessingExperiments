
size(400,400);
background(200);

stroke(100);

//Grande Bordure
fill(0);
rectMode(CENTER);
rect(200,200,150,250);

//Petite Bordure
noFill();
rectMode(CENTER);
rect(200,200,100,200);

//Traits verticaux
line(125,75,150,100);
line(275,75,250,100);
line(125,325,150,300);
line(275,325,250,300);

for(int  i = 100; i < 300; i = i + 1) {
  stroke((211+i)%255, 201, 206);
  line (150, i, 250, i);
} 


