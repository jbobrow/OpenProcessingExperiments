
size(400,400);
background(255);
smooth();

float spacing = 40;

for (int i=1; i<9; i++){
  line(i*spacing, spacing, spacing, height-i*spacing);
  line(spacing, i*spacing, width-i*spacing, spacing);
}
