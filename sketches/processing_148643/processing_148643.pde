
int square = 0;
int counter = 100;
void setup(){
size(500,500);
background(#FFFFFF);

}
void draw(){
ellipse(mouseX,mouseY,counter,counter);
if(mousePressed == true){
counter = counter + 1;
}
//addasquare
rect(square,square,square,square);
square = square + 1;
}
