

int x=10;

int y=5;

int f=5;


void setup(){
  
size(300,400);
background(255,138,152);
}

void draw(){
 
  float f= mouseY;
  smooth();

stroke(10,x+255,226);
strokeWeight(13);
line(50,y+40,50,40);

stroke(120,x+255,226);
strokeWeight(13);
line(100,y+40,100,40);

stroke(188,x+255,226);
strokeWeight(13);
line(150,y+40,150,40);

stroke(255,x+255,226);
strokeWeight(13);
line(200,y+40,200,40);

stroke(255,x+255,244);
strokeWeight(13);
line(250,y+40,250,40);

y=y+1;

if(y>260){
  
  y=20;
}

x=x+1;

if(x>80){
  
  x=-100;
}

}





