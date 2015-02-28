
float gray = 0.0;
int[] x = {50, 61, 83, 69, 71, 50, 29, 31, 17, 39};
int[] y = {18, 37, 43, 60, 82, 73, 82, 60, 43, 39};
int[] x2 = new int[5];
int[] y2 = new int[5];


void setup(){ 
size(400,400);
for (int i = 0; i <400; i++)

{
float percent = (float)i / 400; 
stroke(255 * percent,0,255);
line(0,i,400,i);
}
for (int i = 0; i < 5; i++)
{
   // x2 [i] = (int)random(100,200); 
   // y2 [i] = (int)random(150,300);
}
}
void draw() {
  stroke(255);
for (int i = 0; i < 400; i += 20)

{
  line(0,i, 400, i);
 line(i,0,i,400); 
}

beginShape();
for (int i = 0; i < x.length; i++)
 {
   vertex(x[i], y[i]);
}
 endShape();
 
beginShape();
for (int i = 0; i < x2.length; i++)
 {
   vertex(x2[i], y2[i]);
}
 endShape();
 
   
  
  
 pushMatrix();
 rotate(radians(20)); 
 translate(20,50);
 drawShapes(0,0);
 popMatrix();
 
 pushMatrix();
 rotate(radians(30));
 translate(70,-90);
 drawShapes(0,0);
 popMatrix();
 
 pushMatrix();
 rotate(radians(80));
 translate(140,-70);
 drawShapes(0,0);
 popMatrix();
 
 pushMatrix();
 rotate(radians(90));
 translate(130,-180);
 drawShapes(0,0);
 popMatrix();
 
  pushMatrix();
 rotate(radians(40));
 translate(130,-80);
 drawShapes(0,0);
 popMatrix();
 
 
 
}

void drawShapes(float offset, float yoffset)
{
  beginShape();
for (int i = 0; i < x.length; i++)
 {
   vertex(x[i] + offset, y[i] + yoffset);
}
 endShape();
 
beginShape();
for (int i = 0; i < x2.length; i++)
 {
   vertex(x2[i] + offset, y2[i] + yoffset);
}
 endShape();

}


