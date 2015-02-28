

void setup(){
  
size(400,800);   
noLoop();
//beginRecord(PDF, "second sketch.pdf"); 
}

void draw(){
//Your code here.  
background(8,2,2);
fill(147,12,12);//fill red rectangle.
rect(0,300,400,20);
rect(0,330,400,20);

fill(44,114,188);//fill blue rectangle1.
quad(105,140,240,0,350,0,175,195);
fill(147,12,12);//fill red rectangle2.
quad(0,290,270,0,320,0,0,350);

fill(53,142,34);//fill blue rectangle2.
rect(0,390,400,30);

fill(53,142,34);//fill green triangle 1.
triangle(0,520,0,430,100,430);//create green triangle 1.

fill(224,194,18);//fill yellow rectangles.
rect(105,430,60,400);//fill yellow rectangle 1.
rect(303,430,45,400);//fill yellow rectangle 2.

fill(44,114,188);//fill blue circle 1.
ellipse(180,580,110,110);//create blue circle 1.

fill(147,12,12);//fill red rectangle 1.
rect(30,620,90,90);

fill(224,194,18);//fill yellow rectangle 3.
quad(240,250,300,300,400,170,400,50);

//endRecord();
}

