
float counter =  5;
float counter2 = 15;
float counter3 = 2;
float counter4 = 1.4;
float counter5 = 0;
float counter6 = 300;
float counter7 = 1;
float counter8 = 2;

void setup()
{
  
  colorMode(HSB, 360, 100, 100);
  background(10,90,0);
  size(400, 400);
  
}

void draw()
{
  pushMatrix();
frameRate(25000);
popMatrix();
  counter2 += 0.2;
  counter += 0.2;
  counter3 +=0.2;
  counter4 +=0.2;
  counter5 +=0.01;
  counter6 +=0.5;
  counter7 +=0.1;
  counter8 +=0.1;


  float b = map(sin(counter), -1, 1, 100, 300); 
  float c = map(sin(counter2), -1, 1, 100, 300);
  float d = map(sin(counter3), -1, 1, 100, 300);
  float e = map(sin(counter4), -1, 1, 100, 300);
  float a = map(sin(counter), -1, 1, 1, 360);
  float f = map(sin(counter6), -1, 1, 1, 700);
  float g = map(sin(counter5), -1, 50, 0, 110);
float h = map(sin(counter7), -1, 1, 20, 40);
  float i = map(sin(counter8), -1, 1, 20, 40);



  pushMatrix();


  noStroke();
  translate(height /2, width /2);

  fill(55, f, f, g);
  ellipse(0, 0, 50, 50);
//  fill(250, 100, 100, g);
//  ellipse(-20, -20, 50, 50);
//
//  fill(0, 100, 100, g);
//  ellipse(15, -15, 50, 50);
//  fill(190, 100, 100, g);
//  ellipse(-15, 15, 50, 50);
  popMatrix();

  pushMatrix();
  fill(a, a, f);
  ellipse(c, b, 12, 12);
  

 ellipse(c/4, b/4, 5, 5);
  ellipse(c/4, b/4, 5, 5);
 
ellipse(e/4, d/4, 5, 5);

ellipse(c/4+300, b/4+300, 5, 5);

ellipse(e/4+300, d/4+300, 5, 5);

  ellipse(e, d, 12, 12);
  popMatrix();
  
  fill(190,100,100);
ellipse(50,50,5,5);
ellipse(350,350,5,5);

}

