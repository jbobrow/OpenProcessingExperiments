
float i = 0; 
PImage img;
void setup() {
  size(500, 500);
  img = loadImage("carlhaas.jpg");
  img.filter(BLUR);
}
 
void draw() { 
     println (mouseX +"," + mouseY);
     image(img, 0, 0, width, height);
     
     pushMatrix();
     fill(230, 0, 0);
     quad(234, 292, random(250, 275), random(400, 425), random(175, 200), random(400, 425), random(250, 275), random(250, 275));
     popMatrix();
     
     scale(0.5);
     translate(247,20);
     
     
     
     

     
     pushMatrix();
     translate(250,250);
     fill(230,200,0);
     ellipse(0, 0, 300,360);
     popMatrix();
     
     pushMatrix();
     translate(250,300);
     fill(240,170,0);
     ellipse(0, 0, 300,360);
     popMatrix();
     
     pushMatrix();
     translate(250,260);
     fill(230, 200, 200);
     ellipse(0, 0, 300,360);
     popMatrix();
     
     pushMatrix();
     translate(100,250);
     fill(231, 200, 200);
     ellipse(0, 0, 30, 70);
     popMatrix();
     
     pushMatrix();
     translate(400,250);
     fill(231, 200, 200);
     ellipse(0, 0, 30, 70);
     popMatrix();
     
     pushMatrix();
     translate(250,370);
     fill(231, 100, 100);
     ellipse(0, 0, 100, 20);
     popMatrix();
     
     line(200, 370, 300, 370);
     

     fill(0,0,220);
     triangle(210, 110, 250, 2, 290, 110);

     
     
     pushMatrix();
     translate(200,225);
     fill(255);
     ellipse(0, 0, 50, 50);
     popMatrix();
     
     pushMatrix();
     translate(300,225);
     fill(255);
     ellipse(0, 0, 50, 50);
     popMatrix();
     
     pushMatrix();
     translate(200,225);
     fill(0, 150, 150);
     ellipse(0, 0, 20, 20);
     popMatrix();
     
     pushMatrix();
     translate(300,225);
     fill(0, 150, 150);
     ellipse(0, 0, 20, 20);
     popMatrix();
     
     pushMatrix();
     translate(300,200);
     fill(240,201,0);
     ellipse(0, 0, 50, 10);
     popMatrix();
     
     pushMatrix();
     translate(200,200);
     fill(240,201,0);
     ellipse(0, 0, 50, 10);
     popMatrix();
     
     pushMatrix();
     translate(200,225);
     fill(0);
     ellipse(0, 0, 10, 10);
     popMatrix();
     
     pushMatrix();
     translate(300,225);
     fill(0);
     ellipse(0, 0, 10, 10);
     popMatrix();
     
     pushMatrix();
     fill(220,200,200);
     triangle(230, 310, 250, 250, 270, 310);
     popMatrix();
     
}
 


