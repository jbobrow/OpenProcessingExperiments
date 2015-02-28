
PImage bg,boots;

void setup(){
bg=loadImage("1221.jpg");//define the background with loadimage that has been inserted
size(bg.width,bg.height);//address the window size same as the loadimage
imageMode(CENTER);//set the image in the center
}

void draw(){
background(bg);//use the loadimage as the background
fill(20,190,153,224); //define the colour for the text
textSize(40);//define colour size
text("VOICE OUT",500,320);//type the text


smooth();//smmoth the edge
noStroke();//no line for the ellipse
fill(0);//set the colour value of the ellipse
ellipse(0,10,300,300);//draw the size and position of ellipses 
ellipse(0,310,300,300);
ellipse(0,610,300,300);
ellipse(0,610,300,300);
ellipse(300,10,300,300);
ellipse(600,10,300,300);
ellipse(900,10,300,300);
ellipse(300,310,300,300);
ellipse(300,610,300,300);
ellipse(600,610,300,300);
ellipse(600,910,300,300);
ellipse(900,310,300,300);
ellipse(900,610,300,300);

noFill();//withour filling colour for the ellipses
stroke(255);//with white lines 
ellipse(600,310,300,300);
ellipse(600,310,250,250);
ellipse(600,310,220,220);
ellipse(600,310,210,210);
ellipse(600,310,200,200);
ellipse(600,310,150,150);
ellipse(600,310,120,120);
ellipse(600,310,110,110);
ellipse(600,310,100,100);


tint(255, 50, 0, 100);//tint to orange tone,alpha to 110
image(bg, 150, 200, 520,400);//address the size of the alpha cover 
tint(200, 150,0,120); 
image(bg,400,500,900,200);
}


