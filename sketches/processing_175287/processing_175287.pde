
void setup(){
size(500,500);
}
var y = 0;
 var x=0
 var speed = 15;
 
 void draw() {
 background(random(0,255),random(0,255),random(0,255));
 
 fill(33,33,33);
 ellipse(200,y,50,50);
 if (y>400) {
 speed= -10;
 }
 if (y<0) {
 speed= +10;
 fill(33,33,33);
 ellipse(x,200,50,50);
 if (x>400){
 speed= +10;
 }
 if (y<0) {
 speed= -10;
 }
 }
 
y = y+speed;
};
