
int x;
boolean jaw;
void setup(){
  size(500,500);
background(78);
x=425;
}

void draw(){
  background(78);
noStroke();
ellipseMode(CENTER);
ellipse(250,150,300,500);
rectMode(CENTER);
rect(250,250, 280, 100);
noStroke();
fill(135);
stroke(0);
triangle(150, 300, 110, 300, 150, 340);
triangle(350,300,390,300,350,340);
fill(189);
rect(250, x, 200, 75);
if(x>500){
      jaw=false;
    }
  if(x<425){
    jaw=true;
  }
  if(jaw==false){
    x=x-10;
  }
  if(jaw==true){
    x=x +10;
  }


fill(0);
noStroke();
strokeWeight(2);
stroke(134, 78, 9);
triangle(378,50,250,187,134,300);
fill(130);
strokeWeight(12);
noStroke();
stroke(0);
triangle(110,300, 150,387.5, 150, 535); 
triangle(390,300, 350, 387.5, 350, 535); 
fill(78,32,94);
strokeWeight(1);
ellipse(175,225, 100,100); 
ellipse(325, 225, 100,100); 
triangle(250,265, 215, 300, 285, 300);
fill(255);
}
