

int x;
int y;


void setup(){ size(428,615);
background(255);
frameRate(30);



smooth();



}

void draw(){
  
x = int(random(428));
y = int(random(615));

PImage img2 = loadImage("kalman3.jpg");
color d = img2.get(x,y);
strokeWeight(5);
stroke(d);
point(x,y);

 
PImage img = loadImage("kalman2.jpg");
color c = img.get(mouseX, mouseY); 
fill(c);
stroke(c);
strokeWeight(5);
point(mouseX,mouseY);


if(mousePressed){
  background(img);
 
}


 




}
void mouseReleased(){ 
  background(255);

point(mouseX,mouseY);}


