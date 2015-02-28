
//Ana Carolina Luiz Rahal S53 UTFPR
//Primetime Nursey School-StÃºdio MK27
float theta;   
// Neve
int pingos=400;
float [] chuvax;
float [] chuvay;

void setup() {
  size(400, 400);
  //neve
  stroke(255);
  chuvax = new float[pingos];
  chuvay = new float[pingos];
  for (int i=0; i<pingos; i++)
  {
    chuvax[i] = floor(random(width));
    chuvay[i] = floor(random(height));
  }
}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66;

  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state

    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}

int ceu;

void draw() {
  //background(41, 213, 227);
    stroke(153);

  background (0, 0, 255);
 
  // ceu
  ceu= 21+mouseX/10;
  background(0, 0, ceu++);
  
  pushMatrix();
  stroke(191,203,197);

  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = (mouseX / (float) width) * 90f;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width*4/5.0, height);
  // Draw a line 120 pixels
  line(0, 0, 0, -140);
  // Move to the end of that line
  translate(0, -140);
  // Start the recursive branching!
    scale(0.5);
  branch(120);
  popMatrix();

  
  fill(255);
  rect(50, 300, 249, 50);
  //x,y,largura,altura
  //retÃ¢ngulo da base

  fill(191, 193, 193);
  rect(0, 350, 400, 50);
  //calÃ§ada

  fill(153);
  for (int i = 50;i < 300; i = i+3) {
    line(i, 300, i, 350);
  }
  //linhas repetidas do retÃ¢ngulo da base

  fill(255);
  rect(50, 180, 210, 120);
  rect(52, 182, 206, 118);
  //retÃ¢ngulo superior

  fill(234, 247, 97);
  rect(66, 239, 150, 60);
  //reÃ¢ngulo verde limÃ£o

  fill(153);
  for (int i = 50;i < 256; i = i+9) {
    line(i, 182, i, 300);
  }
  //linhas repetidas do retÃ¢ngulo superior

  fill(234, 247, 97);
  rect(260, 192, 40, 45);
  //retangulo lateral

  fill(255);
  strokeWeight(1);
  line (50, 270, 68, 270);
  line(50, 272, 68, 272);
  //parte reta da rampa

  line(68, 270, 216, 298);
  line(68, 272, 216, 300);
  //parte inclinada da rampa

  line(216, 298, 260, 298);
  line(216, 300, 260, 300);
  //final da rampa

  line(0, 350, 400, 350);//chÃ£o

  //HOMEM
  fill(0);
  pushMatrix();
  translate(mouseX/2.5, mouseX/15);
  ellipse(68, 248, 5, 5);
  //rosto
  rect(65, 250, 5, 12);
  //tronco
  rect(65, 262, 4, 10);
  //pÃ©
  popMatrix();

  stroke(255);
  for (int i=0; i<pingos; i++)
  {
    point(chuvax[i], chuvay[i]);
    chuvay[i]=chuvay[i]+random(-0.1, 0.5);
    chuvax[i]=chuvax[i]+random(-0.1, 0.1);
    if (chuvay[i]>height)
    {
      chuvax[i] = floor(random(width*1.5));
      chuvay[i] = 0;
      floor(random(height));
    }
  }
}

