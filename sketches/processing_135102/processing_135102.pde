
/*
Jaeseong Yi
Feb 20 2014
Creative Computing Section B
Benjamin Bacon
*/


void setup(){
  size(800,800);
  noStroke();
  background(255,255,255);
  smooth();
}

void draw(){
  

  
  int ellipse_x=round(map(mouseX,0,width,width,0));
  int ellipse_y=round(map(mouseY,0,height,height,0));
  int background_a=round(map(mouseX,mouseY,width,height,0));
  int r = round (map(mouseX,0,width,0,255));//red
  int g = round (map(mouseY,0,height,0,255));//green
  int b = round (map(mouseX-mouseY,0,width-height,0,255));//blue
  int t = round (map(mouseX+mouseY,0,width+height,50,100));//transparency
  int r1 = round(map(mouseX+mouseY,0,width+height,150,255));//background red
  int g1 = round(map(mouseX+mouseY,0,width+height,80,255));//background green
  int b1 = round(map(mouseX+mouseY,0,width+height,150,170));//background blue
  int d = int(random(0,100));
  int d1= int(random(0,100));


background(r1,g1,b1);
noStroke();
fill(r,g,b,t);



//first line of ellipse
ellipse(ellipse_x,100,50,50);
ellipse(ellipse_x-100,100,50,50);
ellipse(ellipse_x-200,100,50,50);
ellipse(ellipse_x-300,100,50,50);
ellipse(ellipse_x-400,100,50,50);
ellipse(ellipse_x-500,100,50,50);
ellipse(ellipse_x-600,100,50,50);
ellipse(ellipse_x-700,100,50,50);
ellipse(ellipse_x-800,100,50,50);
ellipse(ellipse_x+100,100,50,50);
ellipse(ellipse_x+200,100,50,50);
ellipse(ellipse_x+300,100,50,50);
ellipse(ellipse_x+400,100,50,50);
ellipse(ellipse_x+500,100,50,50);
ellipse(ellipse_x+600,100,50,50);
ellipse(ellipse_x+700,100,50,50);
ellipse(ellipse_x+800,100,50,50);

//second line of ellipse
ellipse(ellipse_x,300,50,50);
ellipse(ellipse_x-100,300,50,50);
ellipse(ellipse_x-200,300,50,50);
ellipse(ellipse_x-300,300,50,50);
ellipse(ellipse_x-400,300,50,50);
ellipse(ellipse_x-500,300,50,50);
ellipse(ellipse_x-600,300,50,50);
ellipse(ellipse_x-700,300,50,50);
ellipse(ellipse_x-800,300,50,50);
ellipse(ellipse_x+100,300,50,50);
ellipse(ellipse_x+200,300,50,50);
ellipse(ellipse_x+300,300,50,50);
ellipse(ellipse_x+400,300,50,50);
ellipse(ellipse_x+500,300,50,50);
ellipse(ellipse_x+600,300,50,50);
ellipse(ellipse_x+700,300,50,50);
ellipse(ellipse_x+800,300,50,50);

//third line of ellipse
ellipse(ellipse_x,500,50,50);
ellipse(ellipse_x-100,500,50,50);
ellipse(ellipse_x-200,500,50,50);
ellipse(ellipse_x-300,500,50,50);
ellipse(ellipse_x-400,500,50,50);
ellipse(ellipse_x-500,500,50,50);
ellipse(ellipse_x-600,500,50,50);
ellipse(ellipse_x-700,500,50,50);
ellipse(ellipse_x-800,500,50,50);
ellipse(ellipse_x+100,500,50,50);
ellipse(ellipse_x+200,500,50,50);
ellipse(ellipse_x+300,500,50,50);
ellipse(ellipse_x+400,500,50,50);
ellipse(ellipse_x+500,500,50,50);
ellipse(ellipse_x+600,500,50,50);
ellipse(ellipse_x+700,500,50,50);
ellipse(ellipse_x+800,500,50,50);

//fourth line of ellipse
ellipse(ellipse_x,700,50,50);
ellipse(ellipse_x-100,700,50,50);
ellipse(ellipse_x-200,700,50,50);
ellipse(ellipse_x-300,700,50,50);
ellipse(ellipse_x-400,700,50,50);
ellipse(ellipse_x-500,700,50,50);
ellipse(ellipse_x-600,700,50,50);
ellipse(ellipse_x-700,700,50,50);
ellipse(ellipse_x-800,700,50,50);
ellipse(ellipse_x+100,700,50,50);
ellipse(ellipse_x+200,700,50,50);
ellipse(ellipse_x+300,700,50,50);
ellipse(ellipse_x+400,700,50,50);
ellipse(ellipse_x+500,700,50,50);
ellipse(ellipse_x+600,700,50,50);
ellipse(ellipse_x+700,700,50,50);
ellipse(ellipse_x+800,700,50,50);

//first row of ellipse
ellipse(ellipse_y,200,90,90);
ellipse(ellipse_y-100,200,90,90);
ellipse(ellipse_y-200,200,90,90);
ellipse(ellipse_y-300,200,90,90);
ellipse(ellipse_y-400,200,90,90);
ellipse(ellipse_y-500,200,90,90);
ellipse(ellipse_y-600,200,90,90);
ellipse(ellipse_y-700,200,90,90);
ellipse(ellipse_y-800,200,90,90);
ellipse(ellipse_y+100,200,90,90);
ellipse(ellipse_y+200,200,90,90);
ellipse(ellipse_y+300,200,90,90);
ellipse(ellipse_y+400,200,90,90);
ellipse(ellipse_y+500,200,90,90);
ellipse(ellipse_y+600,200,90,90);
ellipse(ellipse_y+700,200,90,90);
ellipse(ellipse_y+800,200,90,90);

//second row of ellipse
ellipse(ellipse_y,400,90,90);
ellipse(ellipse_y-100,400,90,90);
ellipse(ellipse_y-200,400,90,90);
ellipse(ellipse_y-300,400,90,90);
ellipse(ellipse_y-400,400,90,90);
ellipse(ellipse_y-500,400,90,90);
ellipse(ellipse_y-600,400,90,90);
ellipse(ellipse_y-700,400,90,90);
ellipse(ellipse_y-800,400,90,90);
ellipse(ellipse_y+100,400,90,90);
ellipse(ellipse_y+200,400,90,90);
ellipse(ellipse_y+300,400,90,90);
ellipse(ellipse_y+400,400,90,90);
ellipse(ellipse_y+500,400,90,90);
ellipse(ellipse_y+600,400,90,90);
ellipse(ellipse_y+700,400,90,90);
ellipse(ellipse_y+800,400,90,90);

//third row of ellipse
ellipse(ellipse_y,600,90,90);
ellipse(ellipse_y-100,600,90,90);
ellipse(ellipse_y-200,600,90,90);
ellipse(ellipse_y-300,600,90,90);
ellipse(ellipse_y-400,600,90,90);
ellipse(ellipse_y-500,600,90,90);
ellipse(ellipse_y-600,600,90,90);
ellipse(ellipse_y-700,600,90,90);
ellipse(ellipse_y-800,600,90,90);
ellipse(ellipse_y+100,600,90,90);
ellipse(ellipse_y+200,600,90,90);
ellipse(ellipse_y+300,600,90,90);
ellipse(ellipse_y+400,600,90,90);
ellipse(ellipse_y+500,600,90,90);
ellipse(ellipse_y+600,600,90,90);
ellipse(ellipse_y+700,600,90,90);
ellipse(ellipse_y+800,600,90,90);
}


