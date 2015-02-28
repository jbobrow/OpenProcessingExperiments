

float diam;
int colorTone = 0; // 0:gray 1:red 2:green 3:blue

void setup() {
  size(800,600);//set the size of the graph
  
}

void draw() {
  background(255); // set the background color to be white
  diam = random(12);//set the size of the random diam to be 12 
  
// referring to nested for() loops can be used to
// generate two-dimensional patterns
for (int a = 20; a <= 600; a += 30) {
  for (int b = 20; b<= 600; b += 30) {
    stroke(0,190,0);//set the color of stroke be green
    triangle(a, b,a-30 ,b-40,a,b);//draw triangles in a special line form
    frameRate(2);//set the frameRate to be 2 
    
//referring to class exercise_code week2_conditional_example_02
if (colorTone==0) { // gray
    fill(0, random(255));
  }
  else if (colorTone==1) { // red
    fill(random(255), 0, 0, random(255));
  }
  if(colorTone==2) { // green
    fill(0, random(255), 0, random(255));
  }
  if (colorTone==3) { // blue
    fill(0, 0, random(255), random(255));
  } 
  
  ellipse(random(width), random(height), diam, diam);
}

    
  }
}


  

  
  



