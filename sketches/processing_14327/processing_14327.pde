
int x= 300;
int y = 300;
int radius=15;


void setup(){
 size(600,600); 
  background(255); 
 smooth();
}
 

void draw(){
noStroke();


  float mapColorR = map(mouseX, 0, 600, 0, 255);
  float mapColorG = map(mouseY, 0, width, 0, 255);
  fill(mapColorR, mapColorG, 0);
  rect(0, 0, width, height);


fill(250,251,184);
ellipse(300,300,250,250);

noFill();
strokeWeight(5);
fill(204);
quad(300,0,0,160,260,600,600,240);
fill(207,244,80);
quad(240,0,60,140,320,460,500,200);

fill(254,186,2);
quad(260,240,480,100,500,120,280,280);

fill(156,3,200);
quad(280,320,300,380,380,320,360,260);

fill(134,209,252);
beginShape();
vertex(180, 180);
vertex(200, 240);
vertex(360, 140);
vertex(360, 100);
endShape();

int x =260;
int y =220;
int w =280;
int h =40;

if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y + h)){
  fill(4,36,140);
}else{
  fill(71,113,250);}
rect(x,y,w,h);




strokeWeight(0);
  ellipseMode(RADIUS);
  float check = dist(x,y,mouseX,mouseY);
  if(check <radius) {
    fill(253,67,67);
    radius++;
  }
  else {
    fill(125);
  }
  ellipse(x,y,radius,radius);
}
 
void mousePressed() {
  radius=15;



}





