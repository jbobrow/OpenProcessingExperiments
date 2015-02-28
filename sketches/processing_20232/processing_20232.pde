
//import processing.pdf.*;
void setup() {
  size(420,800);//,PDF,"6.pdf");

  background(255);
  int z=floor(random(30,200));
  int x=floor(random(200,300));
  
  noFill();
   beginShape();
    vertex(z+100,200);
    vertex(z+60,300);
    vertex(z+80,300);
    vertex(z+40,400);
    vertex(z+60,400);
    vertex(z+20,500);
    vertex(z+40,500);
    vertex(z,600);
    vertex(z+70,480);
    vertex(z+50,480);
    vertex(z+110,360);
    vertex(z+90,360);
    vertex(z+150,240);
    vertex(z+130,240);
    vertex(z+170,200);
    endShape();
   
    noFill();
     beginShape();
    vertex(x+100,200);
    vertex(x+60,300);
    vertex(x+80,300);
    vertex(x+40,400);
    vertex(x+60,400);
    vertex(x+20,500);
    vertex(x+40,500);
    vertex(x,600);
    vertex(x+70,480);
    vertex(x+50,480);
    vertex(x+110,360);
    vertex(x+90,360);
    vertex(x+150,240);
    vertex(x+130,240);
    vertex(x+170,200);
    endShape();
}




void draw() {
for(int x=50; x < 380; x+=25) {
    int y=floor(random(450,600));  

noFill();
    ellipse(x, floor(random(90,230)), floor(random(100,120)), floor(random(80,120))); 
 noFill();
 beginShape();
    vertex(x,180);
    vertex(x,y);
    vertex(x+8,y);
    vertex(x+8,180);
    endShape();

 }
//println("Finished.");
noLoop();

}

