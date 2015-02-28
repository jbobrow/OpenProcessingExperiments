
//set the size of screen,colour of backgroun, and smoothness of lines
void setup(){
size(250,250);
background(255);
smooth();
}
//Set the strok of lines.
void draw(){
stroke(0);
//sinc line has two points, the first point will start at (0,0) and as long i is less than 250, i will add up 20 every time.
for(int i=0; i<250; i+=20){
// horizontal lines and verticle lines on the right side.
line(i,0,250,i);
// horizontal lines and verticle lines on the left side.
line(i,250,0,i);
// lines  move 20 to the left side every time.
line(i,250,0,0);
// lines start at (0,0) and move 20 to the right side every time.
line(0,0,250,i);
}
}
                
                
