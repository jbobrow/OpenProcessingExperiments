
void setup(){
  size(300,300);
}

int x = 50;
int y = 100;

void draw(){
  background(0,0,255);

//Fish

fill(0,0,0);
ellipse(x+100,200,50,50);
triangle(x+75,200,x+50,230,x+50,175);
fill(255);
ellipse(x+105,195,5,5); 


//Bubbles
noFill();
ellipse(x+25,y+70,10,10);
ellipse(x+55,y+80,15,15);
ellipse(x+60,y+105,17,17);
ellipse(x+70,y+120,10,10);
ellipse(x+90,y+150,20,20);
ellipse(x+110,y+160,15,15);
  
x++;
y--;
  
}

