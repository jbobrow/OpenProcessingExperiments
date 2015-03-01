
// x and y positions
int[] xpos = new int[25];
int[] ypos = new int[25];
void setup() {
size(600,600);
smooth();
// Initialize
for (int i = 0; i < xpos.length;i++ ){
xpos[i] = 0;
ypos[i] = 0;
}
}
void draw() {
background(255);
// Shift array values
for (int i = 0; i < xpos.length-1; i++ ) {
xpos [i] = xpos[i + 1];
ypos[i] = ypos[i + 1];
}
// New location
xpos[xpos.length-1] = mouseX;
ypos[ypos.length-1] = mouseY;
// Draw everything
for (int i = 0; i < xpos.length; i++ ) {
noStroke();
butterfly(xpos[i],ypos[i],-30+i*25,245-i*20,220-i*1,log(5*i+3)/7);
}
}
void butterfly(float x, float y, float r,float g, float b, float a){
noFill();
stroke(r,g,b);
bezier(x,y-a*50,x+a*10,y-a*70,x+a*20,y-a*75,x+a*40,y-a*80);
bezier(x,y-a*50,x-a*10,y-a*70,x-a*20,y-a*75,x-a*40,y-a*80);
fill(r,g,b);
bezier(x,y-a*50,x+a*10,y-a*25,x+a*10,y+a*25,x,y+a*50);
bezier(x,y-a*50,x-a*10,y-a*25,x-a*10,y+a*25,x,y+a*50);
bezier(x+a*5,y-a*25,x+a*25,y-a*58,x+a*65,y-a*60,x+a*75,y-a*60);
bezier(x-a*5,y-a*25,x-a*25,y-a*58,x-a*35,y-a*60,x-a*75,y-a*60);
bezier(x-a*75,y-a*60,x-a*67,y-a*10,x-a*55,y+a*3,x-a*20,y+a*10);
bezier(x+a*75,y-a*60,x+a*67,y-a*10,x+a*55,y+a*3,x+a*20,y+a*10);
bezier(x+a*20,y+a*10,x+a*40,y+a*10,x+a*55,y+a*50,x+a*50,y+a*50);
bezier(x-a*20,y+a*10,x-a*40,y+a*10,x-a*55,y+a*50,x-a*50,y+a*50);
bezier(x+a*50,y+a*50,x+a*50,y+a*55,x+a*15,y+a*48,x+a*5,y+a*30);
bezier(x-a*50,y+a*50,x-a*50,y+a*55,x-a*15,y+a*48,x-a*5,y+a*30);
ellipse(x+a*45,y-a*80,a*7,a*7);
ellipse(x-a*45,y-a*80,a*7,a*7);
triangle(x+a*10,y-a*25,x+a*75,y-a*60,x+a*20,y+a*10);
triangle(x-a*10,y-a*25,x-a*75,y-a*60,x-a*20,y+a*10);
triangle(x+a*20,y+a*10,x+a*5,y+a*30,x+a*50,y+a*50);
triangle(x-a*20,y+a*10,x-a*5,y+a*30,x-a*50,y+a*50);
triangle(x-a*20,y+a*10,x-a*5,y+a*30,x-a*10,y-a*25);
triangle(x+a*20,y+a*10,x+a*5,y+a*30,x+a*10,y-a*25);
}





