
void setup(){
size(300,300);
}

int x=0;
int y=0;

void draw(){
background(mouseX,230,mouseY);

rectMode(CORNER); //make building 
fill(100,20,mouseX);
rect(150,0,150,300);
fill(mouseX,20,250);
rect(175,25,100,100);
rect(175,175,100,100);

line(x+75,y,x+150,y); //make right lift
line(x+75,y+75,x+150,y+75);

fill(mouseY,mouseX,255);//make stickman
ellipse(x+110,y+25,10,10); 
line(x+110,y+30,x+120,y+40);
line(x+110,y+30,x+100,y+40);
line(x+110,y+30,x+110,y+55);
line(x+110,y+55,x+100,y+75);
line(x+110,y+55,x+120,y+75);

line(x,300-y,x+75,300-y); //make left lift
line(x-75,225-y,x+75,225-y);

fill(255,mouseX,mouseY);//make stickman
ellipse(x+40,250-y,10,10); 
line(x+40,255-y,x+50,265-y);
line(x+40,255-y,x+30,265-y);
line(x+40,255-y,x+40,280-y);
line(x+40,280-y,x+30,300-y);
line(x+40,280-y,x+50,300-y);

fill(240,60,6);//make ufo
ellipse(mouseX,mouseY,20,20);
ellipse(mouseX,mouseY,50,10);

y++;
if(y>=width){
  y=0;
}
if(mousePressed){
y=100; 
//actually I want to make the lift stop and move again, but I can't figure it yet and the assignment due to tomorrow :) 
strokeWeight(3);
}else{
  strokeWeight(0);
}
}


