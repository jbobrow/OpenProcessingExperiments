
size(512, 512    );
background(255);
stroke(0);
for(int i = 0; i < height; i += 2)
  line(0, i, width, i);
for(int i = 0; i < width; i += 2)
  line(i, 0, i, height);
