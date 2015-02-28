
size(710, 500);

// Sets how far apart the circles are (10 given in problem)
int spacing = 10;

// Sets the possible variance in height (Set to 10 to resemble example)
int heightChange = 10;

int randomHeight = height / 2;
smooth();

background(255);
fill(255);
  
for(int i = 1; i < 71; i++){
  randomHeight = (int)random(-heightChange, heightChange) + randomHeight;
  ellipse(i * spacing, randomHeight, 5, 5);
}
