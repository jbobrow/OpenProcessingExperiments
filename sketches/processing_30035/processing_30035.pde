
float angle=0;
float step=0.01;

void setup() {
 size(200,200);
smooth();
}
void draw() {
 float r = 75;
 float x = (width/2)+ r*cos(angle); // både x og y er + 100 (hhv width/2 og height/2), 
 //for at rykke cirklens centrum ind i midt af billedet.
 float y = (height/2)+ r*sin(angle); 
 point(x,y);
 angle += step;
} 

