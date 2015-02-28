
int x = 5; // variables
int y = 5;

int dx = 9; // velocity (9,5)
int dy = 5;

void setup() { //setup function called initially, only once
size(500,500);
background(0,250,0); //set background white

}

void draw() { //draw function loops 
background(0,250,00); 


fill(250,250,250);
ellipse(mouseX,mouseY,150,200);

 

if(mousePressed){
fill(250,0,0)
rect(mouseX-75,mouseY-100,150,200)


x = mouseX;
y = mouseY;
}
}
