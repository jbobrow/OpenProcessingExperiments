
size(500, 500);
stroke(255);
float change = random(10); //Using the Random Function, different results appear each time.
noFill();
smooth();
background(change);
for (int y = 0; y < width; y+= change) { for (int w = 1; w < width; w+=15) { ellipse(y, y, y, y); ellipse(500-y,500-y,y, y); ellipse(500-w, 500-w, w, w);
y=(int)(y+change); w=(int)(w+(change*change));
} }
