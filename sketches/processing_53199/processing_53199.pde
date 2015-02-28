
// set the screen size, the colour of background, and add smothness to the line
void setup(){
size(250,250);
background(255);
smooth();
}

void draw(){
stroke(0);
//create lines that start at 0 and add up 20 every time.
for(int i=0; i<250; i+=20){
//creating the line that start from 0, one that add up to left side and the other add up to the right side. 
line(0,i,150,150);
line(i,0,150,150);
//create horizontal line above the two lines.
line(i,0,0,i);
}
}
                
                                
