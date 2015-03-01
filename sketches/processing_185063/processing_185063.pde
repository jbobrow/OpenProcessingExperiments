
//Nick Kreuter
//DMS110 Hw 2
//2-8-14
//Snowman Character inspired from the snow

int x=320; //center x-position
int y=240; //center y-position
PImage Teeth; //http://www.clipartpanda.com/clipart_images/downloads-4125403
PImage Arm1; //http://www.mrsjonesroom.com/pix/winter/branch1.jpg
PImage Arm2; //http://www.mrsjonesroom.com/pix/winter/branch2.jpg


void setup(){ 
background(100,10,100); //defines background color
size(640,480); //size of window
print("setup done!"); //executes code from top to bottom
frameRate(100);
Teeth = loadImage("Teets.png");
Arm1 = loadImage("Arm1.jpg");
Arm2 = loadImage("Arm2.jpg");

}

void draw(){ //executed every frame
x = mouseX;
y= mouseY;
background(mouseX/3,mouseX/3,0);
println("start to draw");
stroke(10,10,10); // makes it so there is no overlapping 
rectMode(CENTER);
fill(255,255,255); // fills shape color
ellipse(x,y,100,100); // defines size of head
ellipse(x,y+125,150,150); //defines size of 

fill(0,0,0); //defines button color
ellipse(x,y+120,10,10); //defines buttons
ellipse(x,y+100,10,10);
ellipse(x,y+140,10,10);
rect(x,y-45,120,5); //hat
rect(x,y-70,50,50); //hat
fill(255,0,0); //eye color/hat color
ellipse(x-25,y-10,20,20); //x,y,h,w eyesize
ellipse(x+25,y-10,10,10); 

fill(250,140,0); //nose color
triangle(x-10,y,x+105,y,x,y+10); // nose
image(Teeth,x-20,y+10,50,30); //Teeth
image(Arm1,x+50,y+30,50,50);
image(Arm2,x-100,y+30,50,50);
}
//event function


