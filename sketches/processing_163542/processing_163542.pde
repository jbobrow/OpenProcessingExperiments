
int[] myArray = {3,1,2,2};

PVector zero = new PVector(0,0,0);
PVector i= new PVector(1,0,0);
PVector j= new PVector(0,1,0);

PVector translation = new PVector(2,2);

void setup() { 
size(200,200); 
}

void draw() {
background(0);
translate(100,100);

drawLine(i,color(255,0,0));
drawLine(j,color(0,255,0));

PVector point = new PVector((mouseX-width/2)/20, -(mouseY-height/2)/20,0);
drawLine(point,color(255));

}

function drawLine(PVector v, color c){
stroke(c);
line(0, 0 ,v.x*20, v.y*-20);

stroke(c,192);
line(translation.x*20, translation.y*-20, translation.x*20 + v.x*20, translation.y*-20 + v.y*-20);


}
