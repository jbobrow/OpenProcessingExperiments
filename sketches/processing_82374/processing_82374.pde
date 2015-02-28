
float inc;
float r;
float dis;
void setup() {
  size(400,400);
  smooth();
   noStroke();
   rectMode(CENTER);
   strokeCap(ROUND);
   inc = 1;
   r = 0;
}


void draw() {
   background(0);

   //sun
   fill(200,200,0);
   translate(width/2,height/2);
   ellipse(0,0,100,100);
   fill(200,100,50);
   rect(0,0,70,70);

   pushMatrix();
   rotate(radians(r));
   //earth
   fill(0,200,200);
   translate(100,0);
   rotate(radians(2*r));
   ellipse(0,0,20,20);

   //moon
   fill(255);
   translate(40,0);
   ellipse(0,0,10,10);
   popMatrix();


   //marsrotate(r*.76)
   pushMatrix();
   rotate(radians(r *.76));
   fill(255,0,0);
   translate(150,0);

   ellipse(0,0,20,20);
   popMatrix();

   r = r + inc;
   //inc = mouseX/20;

}

