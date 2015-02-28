
float sizea = 70;
float sizeb = 60;
float sizec = 50;
float sized = 30;
float xpos;
float ypos;
float col1 = 44;
float col2 = 63;
float col3 = 255;
void setup(){
  background(0);
  size(700,400);
  smooth();

}

void draw(){
  

  background(0);
  fill(col1,col2,col3,100);
  noStroke();

  ellipse(350,200,sizea,sizea);
  ellipse(350,200,sizeb,sizeb);
  ellipse(350,200,sizec,sizec);
  ellipse(350,200,sized,sized);
  sizea = mouseX/ 3 + 90;
  fill(col1,col2,col3,150);
  sizeb = mouseX/ 3 + 80;
  fill(col1,col2,col3,200);
  sizec = mouseX/ 3 + 70;
  fill(col1,col2,col3,250);
  sized = mouseX/ 3 + 55;
  
  col1 = mouseX/55 + 40;
  col2 = mouseX/55 + 40;
}

