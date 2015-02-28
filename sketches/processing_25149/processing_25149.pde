
int x = 50;
int y=  50;

void setup(){
  background (300,255,0);
  size(100,100);
}

void draw(){
smooth();
fill(135,255,0);

ellipse(x,y-10,20,30); //body  
ellipse(x,y+20,20,30); //body

ellipse(x-10,y-10,10,10); //eye one
ellipse(x-10,y-10,5,5);

ellipse(x,y-10,10,10); //eye two
ellipse(x,y-10,5,5);

ellipse(x+10,y-10,10,10); //eye three
ellipse(x+10,y-10,5,5);

ellipse(x,y-20,10,10); //middle eye
ellipse(x,y-20,5,5);

ellipse(x,y-30,10,10); //top eye
ellipse(x,y-30,5,5);

rect(x-5,y+30,10,10); //base





}



