
float xoffset = 10;
float yoffset = 10;

void setup() {
  size(800, 800);
  smooth();
}

void draw() {
  background(255, 225, 225);
  //  background (150, 150, 150);

  int i = 0;
  int j = 0;
  int k = 0;
  int l = 0;

  while (i < 200) // Follows Cursor
  {
    ellipseMode(CENTER); 
    stroke(255, 25+i*2, 25+i*2); //Red
    strokeWeight(1); 
    noFill();
    ellipse(mouseX, mouseY, i*i/8, i*i/8); // TO DO LIST....
    i = i + 1; // or i++
  }



  while (j < 200) // First surprise bump in North West quadrant
  {
    ellipseMode(CENTER); 
    stroke(j*10, j*15, 0);//Bright Green
    strokeWeight(1); 
    noFill();
    ellipse(2*(width/2 - mouseY), (2*(height/2 - mouseX)), j*j/8, j*j/8); // TO DO LIST....
    j = j + 1; // or i++
  }


  while (k < 200) // Opposite the cursor/mouse
  {
    ellipseMode(CENTER); 
    stroke(0, k*11, k*11);
    strokeWeight(1); 
    noFill();
    ellipse(width-mouseX, height-mouseY, k*k/8, k*k/8); // TO DO LIST....
    k = k + 1; // or i++
  }

  while (l < 200) // Second surprise bump in North West quadrant
  {
    ellipseMode(CENTER); 
    stroke(0, l*4, l*15);//Purple
    strokeWeight(1); 
    noFill();
    ellipse(2*(height/2 - mouseX), (2*(width/2 - mouseY)), l*l/8, l*l/8); // TO DO LIST....
    l = l + 1; // or i++
  }
}
