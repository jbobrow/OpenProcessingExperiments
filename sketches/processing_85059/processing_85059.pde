
void setup()
{
size(500,500);
background(19,5,178);
smooth(); 
}

void draw()

{
translate(width/2, height/2);
for (int i=0;i<360;i+=30){
rotate(radians(30)); 
noStroke();
fill(255,247,0);
ellipse (50,50,20,20);

stroke(255);
noFill();
ellipse (10,10,30,30);
}

}


