
float x = 50.0;
float y = mouseY;
float y2 = 50;
int i = 0;
void setup(){
size(600, 600);
background(150);

}


void draw(){
//background(150);
  fill(200, 50);
rect(0, 0, 600, 600);
y = mouseY;
noStroke();
ellipseMode(RADIUS);
fill(90, 190, 200);

ellipse(x+mouseX-300, y2-400+mouseY, 20, 20);
ellipse(x+mouseX-100, y2-400+mouseY, 20, 20);
ellipse(x, y2-300+mouseY-100, 2, 2);
ellipse(x-100, y2-300+mouseY-100, 2, 2);
//ellipse(x, y2-100+mouseY-200, 2, 2);


println( mouseX + ", y: " + mouseY );
x = width/2 + 50 * sin( float(frameCount)/20 );
y2 = height/2 + 50 * cos( float(frameCount)/20 );

//ellipse( x, y2, 50, 50 );
println( x );
i+=1;
println(i);
}


