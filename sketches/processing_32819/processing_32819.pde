
PFont myFont;

void setup(){
size(77,122);
background(19,122,179);
smooth();

stroke(0);

myFont=createFont("Helvetica",5,true);
textFont(myFont);
text("b l u e",30,50); 






}

void draw(){
  



//green eillipse
strokeWeight(5);
stroke(0);
fill(45,60,31);
ellipse(0,0,80,90);

//black rect left botton
strokeWeight(4);
stroke(0);
fill(0,0,0);
rect(0,62,43,60);



//upper line
strokeWeight(5);
stroke(0);
line(0,30,77,30);

//down orange rect
strokeWeight(4);
stroke(0);
fill(231,103,49);
rect(45,62,35,67);





//right up orange ellipse
strokeWeight(6);
stroke(0);
fill(231,103,49);
ellipse(77,0,25,50);





//upper orange rect
noStroke();
fill(231,103,49);
rect(50,32,30,30);

//grey first circle
noStroke();
fill(104,107,110);
ellipse(10,75,13,13);

//grey second circle
noStroke();
fill(104,107,110);
ellipse(30,75,13,13);

//yeallow third circle
noStroke();
fill(255,224,93);
ellipse(60,75,15,15);


}























