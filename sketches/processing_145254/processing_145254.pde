
float counter = 0;

void setup() {size (500,500);
background(0);
}

void draw() {

if (mousePressed == true)
{
  translate(-5, height/2);
   
  for (int i=1; i<30; i++)
  {
    pushMatrix();
    translate(i*30, sin(counter+i)*80);
    ellipse(0, 0, 1, 1);
    fill(#B4ED94);
    noStroke();
    popMatrix();
     
    counter += 620;
  }

  }
}

