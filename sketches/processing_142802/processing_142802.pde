
//Math 2 Excercise 1

size(500, 500);
background(100);

for (int x = 0; x < 500; x+=4) {
float n = norm(x, 0, 500); 
float y = 1 - pow(n, 4); 
y *= 500; 
noStroke();
fill(0);
ellipse(x, y, 4, 4);
}


