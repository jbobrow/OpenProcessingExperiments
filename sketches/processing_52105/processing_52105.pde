
void setup(){
size(500,500);

smooth();

}


int x = 100;
int y = 80;

void draw(){

  


//FACE SHAPE
rect(10,10, width-100,height-100);

//LEFT EYE
ellipse(x, y, y, y); 

 //LEFT EYE (small)
ellipse(x,y, y-30, y-30);

//LEFT EYE (smallest)
fill(0);
ellipse(x,y, y-70, y-50);

//RIGHT EYE
fill(255);
ellipse(width-x,y,y,y); 

 //RIGHT EYE (small)
fill(255);
ellipse(width-x,y,y-30,y-30);

 //RIGHT EYE (small)
 fill(0);
ellipse(width-x,y,y-70,y-50);


//NOSE
rect(200,250, 15,5);
rect(240,250, 15,5);


//MOUTH
line(x, y+300, width-x, y+300); 

//LEFT MOUTH CIRCLE
ellipse(x,y+300, 5,5);


//RIGHT MOUTH CIRCLE
ellipse(width-x,y+300, 5,5);

//HAIR
stroke(0,255,0);
strokeWeight(5);
for (int i = 20; i < 400; i += 20) {
  line(i, 10, i + i/2, 80); 
}


//TEETH
stroke(0);
strokeWeight(1);
rect(x+75 ,y+300, 10,y-x); 
rect(x+175 ,y+300, 10,y-x); 
rect(x+100 ,y+300, 10,y-60); 

//BOWTIE
noStroke();
triangle(x, 410, x+100, 450, x,500 );
triangle(x+100, 450, x+200, 410, x+200,500 );


}



