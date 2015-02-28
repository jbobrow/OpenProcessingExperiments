
int x=0,y=0;//assign 
float r,g,b,a;

void setup(){
  size(500,500);//set the window size
  frameRate(13);//speed of the frames shown
  background(0);//set backgound colour to black
  smooth();//smoothly draw the image
}

void draw(){
 textSize(20);//set the size of text
 text("Searching and colouring the path",100,70);//texting and address its position
 ellipse(250,250,300,300);//draw a circle
 ellipse(250,250,290,290);//draw another circle inside
 ellipse(250,250,270,270);
 ellipse(250,250,260,260);
 ellipse(250,250,250,250);
 ellipse(250,250,240,240);
 ellipse(250,250,220,220);
 ellipse(250,250,210,210);
 ellipse(250,250,200,200);
 ellipse(250,250,190,190);
 ellipse(250,250,180,180);
 ellipse(250,250,170,170); 
 ellipse(250,250,160,160);
 ellipse(250,250,140,140);
 ellipse(250,250,130,130);
 ellipse(250,250,120,120);
 ellipse(250,250,120,120);
 ellipse(250,250,60,60);
 ellipse(250,250,50,50);
 ellipse(250,250,70,70);
 ellipse(250,250,80,80);
 ellipse(250,250,90,90);
 line(250,250,x,y);//line with variable x and y 
 line(250,250,x-70,y-70);
 line(250,250,x-140,y-140);
 line(250,250,x-210,y-210);
 line(250,250,x-280,y-280);
 x=x+2;//increase x by 1

 fill(0,5);//various change of colour within the range
 r=random(255);//set a random choose of colour range
 g=random(150);//let green combination of colour will be shown
 b=random(255);
 a=random(255);
 stroke(r,g,b,a);//set the colour for the lines and borders drawn around the shapes
 println(x);//check for the producing data
 
}
 


