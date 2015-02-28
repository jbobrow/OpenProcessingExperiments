
int x = 0;
int y = 20;
int a = 460;
int z = 0;
int radius = 10;
float white = 0;



void setup(){
  size(600, 600);

}

void draw(){
  background(white);
  stroke(0);
  strokeWeight(10);
  smooth();
  
 
strokeWeight(20);
ellipse(140,320,10,10);

strokeWeight(7);
line(170,225,280,100);

strokeWeight(3);
line(190,250,320,180);

strokeWeight(5);
line(210,268,560,280);



  
  line(x, y, x+600,y);
  
  y = y+2; 
  if (y > 600) {
    y = -100;
  }{
    strokeWeight(5);
    smooth();
  
    line(a, z, a, z+600);
  
    z = z; //<- 속
   if (z > 600) {
    z = -100;
  }

  }
  beginShape();
vertex(0,300);
vertex(140,200);
vertex(300,360);
vertex(140,600);
vertex(0,300);
endShape();


beginShape();
vertex(60,260);
vertex(180,240);
vertex(270,400);
vertex(70,440);
vertex(60,260);
endShape();
  
  
 beginShape();
vertex(140,250);
vertex(210,300);
vertex(140,420);
vertex(70,360);
vertex(140,250);
endShape(); 
  
  
   float d = dist (140, 320, mouseX, mouseY);
  if ( d < radius){
    fill(255,0,0);
  }else{ fill(255);
  }
 ellipse(140, 320, radius, radius); 
  
  
}


void mouseReleased(){
  white += 20;
}

