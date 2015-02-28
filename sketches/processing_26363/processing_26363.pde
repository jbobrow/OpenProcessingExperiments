
float x=50;//x value 
float y=50;//y value

void setup(){
size(500,500);
background(255);
}

void draw(){
  noStroke();
fill(random(150),random(150),random(150));
ellipse (width/2,height/2,x,y);
x = x+1;
y = y+1;
  noStroke();
fill(255);
ellipse (width/2,height/2,x/2,y/2);
x = x+1;
y = y+1;

}


void keyPressed () {

}
