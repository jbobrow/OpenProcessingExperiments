
size(800,500);

// Variables for circle
int spacing = 10;
float y = height/2;

// Drawing the circles 
for(int x = 1; x<=70; x++) {
  ellipse(x*(spacing), y, spacing-2, spacing-2);
  y = random(y-15,y+15);
}
  
