
void setup() {
  //SIZE CAN BE CHANGED 
size(600,400); 

background(255);


//rectNumber - counter
//density-number of different stages of a color when going from one color to another
int rectNumber=0;
//int aWidth=width;
//int aHeight=height;
int density;
density=100;





//top left blue part

fill(190,190,190);
noStroke();
beginShape();
vertex(0,0);
vertex(0,(0.4*height)/16);
vertex((10.3*width)/24,(2.5*height)/16);
vertex((10.3*width)/24,0);
endShape(CLOSE);






//circle
rectNumber=0;
noStroke();
fill(0);
ellipse(5.8*width/24,11.3*height/16,width/6,3.6*height/16);
//changing color of the inside of the circle using opacity

while(rectNumber<density){
fill(139+random(-10,10),69+random(-10,10),19+random(-10,10),10);
ellipse(5.8*width/24,11.3*height/16,width*rectNumber/(6*density),3.6*height*rectNumber/(16*density));
rectNumber++;  
}






//creating a yellow-orange background on the left part of the painting

//changing color from the top to the bottom by drawing every new small rectangle in a different color
//color change is only on the bottom half of the shape
rectNumber=0;
while(rectNumber<height/2) {
fill(255+random(-10,10),225+random(-10,10)-(100*rectNumber*2)/height,0);
rect(0,height/2+rectNumber,6.3*width/24,1);
rectNumber++;
}


fill(255,225,0);
noStroke();
beginShape();
vertex(0,(0.6*height)/16);
vertex(0, height/2);
vertex(6.3*width/24, height/2);
vertex(6.3*width/24,(7.3*height)/16);
vertex(3.6*width/24,(7.7*height)/16);
endShape(CLOSE);

stroke(0,0,0,125);
strokeWeight(2);
line((3.4*width)/24,(7.7*height)/16,6.3*width/24,(7.3*height)/16);
strokeWeight(2);
line(6.3*width/24,(7.3*height)/16,(6.3*width)/24,(13.6*height)/16);










/////////////////////////////////////////////////part of the ring
rectNumber=0;
strokeWeight(1);
noFill();
while(rectNumber<density){
  stroke(238+random(-10,10),221+random(-10,10),130+random(-10,10));
arc(11*width/24,height/2,0.94*2*width/3+rectNumber*0.13*height/density,0.94*height+rectNumber*0.13*height/density, -0.905*PI,-0.05*PI);
stroke(222+random(-10,10),184+random(-10,10),135+random(-10,10));
arc(11*width/24,height/2,0.94*2*width/3+rectNumber*0.13*height/density,0.94*height+rectNumber*0.13*height/density, 0.505*PI,1.17*PI);

rectNumber++;
}






/// WHITE BACKGROUND FOR THE GRID THAT WILL COVER THE END OF ARC 


fill(255);
noStroke();
beginShape();
vertex(0,(0.4*height)/16);
vertex((3.5*width)/24,(7.6*height)/16);
vertex((10.3*width)/24,(2.5*height)/16);

endShape(CLOSE);










//GRID
rectNumber=1;
stroke(190,190,190);
strokeWeight(2);
while(rectNumber<30){
line(0,(9*height*rectNumber)/(16*30),8.1*width/24,(1.8*height/16)+((9*height*rectNumber)/(16*30)));
rectNumber++;
}

rectNumber=0;
while(rectNumber<28){
line((9*width*rectNumber)/(24*30),((0.4*height)/16)+(1.8*height*rectNumber)/(16*28),(9*width*rectNumber)/(24*30),(9.5*height/16));
rectNumber++;
}

stroke(150);
line(0,(9.5*height)/16,8.1*width/24,(9.5*height)/16);
line(8.1*width/24,0,8.1*width/24,(9.5*height)/16);



//shape of the right bottom side of the grid


fill(255);
noStroke();
beginShape();
vertex(8.3*width/24,(9.5*height)/16);
vertex(0,(9.5*height)/16);
vertex(0,(13.6*height)/16);
vertex(8.3*width/24,(13.6*height)/16);
endShape(CLOSE);


/*
//top left blue part

fill(190,190,190);
noStroke();
beginShape();
vertex(0,0);
vertex(0,(0.4*height)/16);
vertex((10.3*width)/24,(2.5*height)/16);
vertex((10.3*width)/24,0);
endShape(CLOSE);

*/

//circle
rectNumber=0;
noStroke();
fill(0);
ellipse(5.8*width/24,11.3*height/16,width/6,3.6*height/16);
//changing color of the inside of the circle using opacity

while(rectNumber<density){
fill(139+random(-10,10),69+random(-10,10),19+random(-10,10),10);
ellipse(5.8*width/24,11.3*height/16,width*rectNumber/(6*density),3.6*height*rectNumber/(16*density));
rectNumber++;  
}






//creating a yellow-orange background on the left part of the painting

//changing color from the top to the bottom by drawing every new small rectangle in a different color
//color change is only on the bottom half of the shape
rectNumber=0;
while(rectNumber<height/2) {
fill(255+random(-10,10),225+random(-10,10)-(100*rectNumber*2)/height,0);
rect(0,height/2+rectNumber,6.3*width/24,1);
rectNumber++;
}


fill(255,225,0);
noStroke();
beginShape();
vertex(0,(0.6*height)/16);
vertex(0, height/2);
vertex(6.3*width/24, height/2);
vertex(6.3*width/24,(7.3*height)/16);
vertex(3.6*width/24,(7.7*height)/16);
endShape(CLOSE);

stroke(0,0,0,125);
strokeWeight(2);
line((3.4*width)/24,(7.7*height)/16,6.3*width/24,(7.3*height)/16);
strokeWeight(2);
line(6.3*width/24,(7.3*height)/16,(6.3*width)/24,(13.6*height)/16);


//yellow-orrange background on the right side with 
noStroke();
rectNumber=0;
while(rectNumber<height) {
fill(235,255-115*rectNumber/height,20);
rect(20.3*width/24,rectNumber,3.7*width/24,1);
rectNumber++;
}






//yellow background right side
fill(238,221,130);
stroke(0,0,0,100);
strokeWeight(2);
//noStroke();
beginShape();
vertex(11.5*width/24,0);
vertex(11.5*width/24, height);
vertex(width, 13.8*height/16);
vertex(20.3*width/24,0);
endShape(CLOSE);




//orange quadrangle top right side
noStroke();

rectNumber=0;
while(rectNumber<density) {
 rect(11.5*width/24+(8.8*width*rectNumber)/(24*density),0,(8.8*width)/(24*density),(2.8*height)/16+(1.9*height*rectNumber)/(16*density));
fill(255+random(-10,10),220+random(-10,10)-((80*rectNumber)/density),0+random(20));
 rectNumber++;
}
fill(255,140,0);
  beginShape();
vertex(20.3*width/24-1,0);                // "-1" is added to fill the gap between two parts.
vertex(20.3*width/24-1,4.7*height/16);
vertex(21.6*width/24,5*height/16);
endShape(CLOSE);
  


//red-brown part next to brown triangle bottom right

fill(205,130,60);
noStroke();

beginShape();
vertex((14.3*width)/24,(9.5*height)/16);
vertex((14.3*width)/24,height);
vertex((18.6*width)/24,height);
vertex((18.6*width)/24,(9.5*height)/16);
endShape(CLOSE);


strokeWeight(height/density);
noFill();

rectNumber=0;
while(rectNumber<density){
  stroke(245+random(-10,10)-(50*rectNumber)/density,30+random(-10,10)+(100*rectNumber)/density,random(20)+(60*rectNumber)/density);
arc((14.3*width)/24,(7*height)/16,(5*width*rectNumber)/(8*1.5*density),(8*height*rectNumber)/(8*density), 0.052*PI,PI/2);
rectNumber++;
}








//  brown triangle bottom right side 

fill(160,82,45);
stroke(0,0,0,100);
strokeWeight(2);

beginShape();

vertex(18.6*width/24,10.5*height/16);
vertex(18.6*width/24,height);
vertex(width,height);
vertex(width,13.8*height/16);
endShape(CLOSE);






//black triangle in the right bottom corner
fill(0);
beginShape();
vertex(15.2*width/24,height);
vertex(width,height);
vertex(width,14*height/16);
endShape(CLOSE);







//bottom middle orange part
//250 160 0

fill(205,130,60);
stroke(0,0,0,50);
strokeWeight(2);

beginShape();
vertex((11.5*width)/24,(9.5*height)/16);
vertex((11.5*width)/24,height);
vertex((14.3*width)/24,height);
vertex((14.3*width)/24,(9.5*height)/16);
endShape(CLOSE);




//  white triangle with stripes in the middle 
rectNumber=0;
fill(255);
stroke(100);
strokeWeight(2);
while(rectNumber<12){ //  12 little triangles  
beginShape();
vertex((11.5*width)/24+((4.8*width*rectNumber)/(12*24)),(4*height)/16+((3.5*height*rectNumber)/(12*16)));
vertex((11.5*width)/24+((4.8*width*rectNumber)/(12*24)),(13.7*height)/16-((6.2*height*rectNumber)/(12*16)));
vertex((16.3*width)/24,(7.5*height)/16);
endShape(CLOSE);
rectNumber++;
}




//red backgroung triangle bottom left part


fill(215,50,20);
stroke(0,0,0,50);
strokeWeight(2);

beginShape();
vertex(0,(15.6*height)/16);
vertex(0,height);
vertex((10.3*width)/24,height);
vertex((10.3*width)/24,(14.5*height)/16);
endShape(CLOSE);





//white horizontal stripe bottom left

fill(240);
stroke(100);
strokeWeight(2);

beginShape();
vertex(0,(13.6*height)/16);
vertex(0,(15.6*height)/16);
vertex((10.3*width)/24,(14.5*height)/16);
vertex((10.3*width)/24,(13.6*height)/16);
endShape(CLOSE);




//  TOP PART OF THE CENTER COLUMN
noStroke();
rectNumber=0;
while(rectNumber<density) {
fill(173+(51*rectNumber)/density,216+(39*rectNumber/density),230+(25*rectNumber)/density,125);
rect(10.3*width/24,(2.6*height/16)+(rectNumber*height/(2*density)),1.2*width/24,height/(2*density));
rectNumber++;
}

noStroke();
rectNumber=0;
while(rectNumber<density) {
fill(170+random(-30,30),75+random(-15,25),30+random(-10,20));
rect(10.3*width/24+(rectNumber*width*1.2)/(24*density),0,1.2*width/(24*density),((3.5*height)/16)+(random(-5,15)*height/160));
rectNumber++;
}






//the ring
strokeWeight(1);
noFill();
//the ring goes from 94% to 108% of the height
rectNumber=0;
while(rectNumber<density){
stroke(238+random(-10,10),221+random(-10,10),130+random(-10,10));
arc(11*width/24,height/2,0.94*2*width/3+rectNumber*0.13*height/density,0.94*height+rectNumber*0.13*height/density, -0.705*PI,-0.05*PI);
stroke(176+random(-10,10),196+random(-10,10),222+random(-10,10));
arc(11*width/24,height/2,0.94*2*width/3+rectNumber*0.1*height/density,0.94*height+rectNumber*0.1*height/density, -0.105*PI,0.505*PI);
stroke(222+random(-10,10),184+random(-10,10),135+random(-10,10));
arc(11*width/24,height/2,0.94*2*width/3+rectNumber*0.13*height/density,0.94*height+rectNumber*0.13*height/density, 0.505*PI,1.07*PI);

rectNumber++;

}





//beauty part

rectNumber=0;
while(rectNumber<density){
  
stroke(140+random(-20,15),70+random(-20,15),20+random(-10,35),25);
arc(11*width/24,height/2,0.97*2*width/3+rectNumber*0.04*height/density,0.97*height+rectNumber*0.04*height/density, 0.7*PI+(PI*random(-10,10)/(100)),0.85*PI+(PI*random(-10,10)/(100)));


rectNumber++;

}

rectNumber=0;
while(rectNumber<density){
  
stroke(140+random(-20,15),70+random(-20,15),20+random(-10,35),25);
arc(11*width/24,height/2,1.03*2*width/3+rectNumber*0.04*height/density,1.03*height+rectNumber*0.04*height/density, 0.75*PI+(PI*random(-10,10)/(100)),0.95*PI+(PI*random(-10,10)/(100)));


rectNumber++;

}













//black part in the middle

fill(0);
noStroke();

beginShape();
vertex((6.3*width)/24,(13.6*height)/16);
vertex((6.3*width)/24,(15*height)/16);
vertex((10.3*width)/24,(14.5*height)/16);
vertex((10.3*width)/24,(2.4*height)/16);
vertex((9.2*width)/24,(2.2*height)/16);
vertex((9.2*width)/24,(13.6*height)/16);
endShape(CLOSE);


//BOTTOM LEFT CORNER, 3 LINES AND A TRIANGLE

fill(50);
noStroke();
//triangle
beginShape();
vertex(0,(10.7*height)/16);
vertex(0,(13.6*height)/16);
vertex((1.9*width)/24,(13.6*height)/16);
endShape(CLOSE);
//top line
fill(0);
beginShape();
vertex(0,(10.5*height)/16);
vertex(0,(11.1*height)/16);
vertex((3.1*width)/24,height);
vertex((3.5*width)/24,height);
endShape(CLOSE);
//middle
beginShape();
vertex(0,(12.1*height)/16);
vertex(0,(12.7*height)/16);
vertex((2.2*width)/24,height);
vertex((2.6*width)/24,height);
endShape(CLOSE);
//third line
beginShape();
vertex(0,(13.2*height)/16);
vertex(0,(13.8*height)/16);
vertex((1.4*width)/24,height);
vertex((1.8*width)/24,height);
endShape(CLOSE);




//top left diagonal black and red lines
//black
fill(0);
noStroke();
beginShape();
vertex(0,(0.3*height)/16);
vertex(0,(0.7*height)/16);
vertex((3.4*width)/24,(7.7*height)/16);
vertex((3.6*width)/24,(7.65*height)/16);
endShape(CLOSE);
//red
fill(235,70,0);
stroke(0,0,0,50);
strokeWeight(2);

beginShape();
vertex(0,(0.3*height)/16);
vertex((3.55*width)/24,(7.65*height)/16);
vertex((4.35*width)/24,(7.55*height)/16);
vertex((0.8*width)/24,(0.5*height)/16);
endShape(CLOSE);

//Red part in the middle 
fill(255,99,71);
stroke(0,0,0,125);
strokeWeight(2);

beginShape();
vertex((6.3*width)/24,(1.7*height)/16);
vertex((6.3*width)/24,(2.8*height)/16);
vertex((8.1*width)/24,(2.8*height)/16);
vertex((8.1*width)/24,(7.1*height)/16);
vertex((9.2*width)/24,(6.9*height)/16);
vertex((9.2*width)/24,(2.25*height)/16);
endShape(CLOSE);

// small black square in the top middle

fill(0);
stroke(0,0,0,125);
strokeWeight(2);

beginShape();
vertex((6.3*width)/24,(2.8*height)/16);
vertex((6.3*width)/24,(4*height)/16);
vertex((8.1*width)/24,(4*height)/16);
vertex((8.1*width)/24,(2.8*height)/16);
endShape(CLOSE);

//part of the ring
rectNumber=0;
noFill();
while(rectNumber<density){
  
stroke(10+random(-10,85),10+random(-10,85),140+random(-30,15),15);
arc(11*width/24,height/2,0.90*2*width/3+(rectNumber*0.05*width)/(1.5*density),0.90*height+rectNumber*0.05*height/density, -0.19*PI,-0.01*PI);


rectNumber++;

}
rectNumber=0;
noFill();
while(rectNumber<density){
  
stroke(240+random(-20,15),70+random(-20,25),10+random(-10,15),10);
arc(11*width/24,height/2,0.90*2*width/3+(rectNumber*0.06*width)/(1.5*density),0.90*height+rectNumber*0.06*height/density, -0.48*PI,-0.18*PI);


rectNumber++;

}

// weird black form in the right half of the picture
fill(0);
noStroke();

beginShape();
vertex((11.5*width)/24,(3.7*height)/16);
vertex((11.5*width)/24,(4.1*height)/16);
vertex((14.1*width)/24,(3.8*height)/16);
vertex((14.35*width)/24,(7.2*height)/16);
vertex((18.6*width)/24,(8.1*height)/16);
vertex((18.6*width)/24,(10.6*height)/16);
vertex((22.9*width)/24,(13.2*height)/16);
vertex((18.6*width)/24,(7.75*height)/16);
vertex((14.4*width)/24,(7.05*height)/16);
vertex((14.12*width)/24,(3.4*height)/16);
endShape(CLOSE);





//bottom part of the Column in the middle

rectNumber=0;
while(rectNumber<density) {
fill(205+(24*rectNumber)/density,133+(122*rectNumber/density),63+(192*rectNumber)/density);
rect(10.3*width/24,height-(rectNumber*height/(2*density)),1.2*width/24,height/(2*density));
rectNumber++;
}



rectNumber=0;
noFill();
while(rectNumber<density){
  stroke(170+random(-30,30),75+random(-15,25),30+random(-10,20));
arc(11.5*width/24,2.7*height/16,(rectNumber*4.9*2*width)/(8*3*density),(2.4*height*rectNumber)/(8*density), -0.89*PI,-0.5*PI);

rectNumber++;

}



// Beauty

strokeWeight(1);
noFill();
//the ring goes from 94% to 108% of the height
rectNumber=0;

while(rectNumber<density){
  
stroke(40+random(-10,40),40+random(-10,40),130+random(-30,30),50);
arc(11*width/24,height/2,0.94*width*2/3+rectNumber*0.12*width*2/(3*density),0.94*height+rectNumber*0.12*height/density, -0.205*PI+(PI*random(-10,5)/(100)),-0.035*PI+(PI*random(-10,5)/(100)));


rectNumber++;

}

rectNumber=0;
while(rectNumber<density){
  
stroke(240+random(-30,15),240+random(-30,15),240+random(-30,15),75);
arc(11*width/24,height/2,0.94*2*width/3+(rectNumber*0.04*width)/(1.5*density),0.94*height+rectNumber*0.04*height/density, 0.205*PI+(PI*random(-10,10)/(100)),0.35*PI+(PI*random(-10,10)/(100)));


rectNumber++;

}

//238,221,130
rectNumber=0;
while(rectNumber<density){
  
stroke(240+random(-30,15),230+random(-30,15),140+random(-30,15),75);
arc(11*width/24,height/2,1*2*width/3+(rectNumber*0.04*width)/(1.5*density),1*height+rectNumber*0.04*height/density, -0.205*PI+(PI*random(-10,10)/(100)),-0.135*PI+(PI*random(-10,10)/(100)));


rectNumber++;

}

rectNumber=0;
while(rectNumber<density){
  
stroke(10+random(-10,35),10+random(-10,35),140+random(-30,15),55);
arc(11*width/24,height/2,1.02*2*width/3+(rectNumber*0.04*width)/(1.5*density),1.02*height+rectNumber*0.04*height/density, -0.125*PI+(PI*random(-10,10)/(100)),-0.105*PI+(PI*random(-10,10)/(100)));


rectNumber++;

}



rectNumber=0;
while(rectNumber<density){
  
stroke(55+random(-35,35),55+random(-35,35),55+random(-30,35),55-(rectNumber*55/density));
arc(11*width/24,height/2,0.94*2*width/3+(rectNumber*0.04*width)/(1.5*density),0.94*height+rectNumber*0.04*height/density, 0.75*PI+(PI*random(-5,5)/(100)),0.95*PI+(PI*random(-5,5)/(100)));


rectNumber++;

}





rectNumber=0;
while(rectNumber<density){
  
stroke(55+random(-35,35),55+random(-35,35),55+random(-30,35),25-(rectNumber*25/density));
arc(11*width/24,height/2,0.99*2*width/3+(rectNumber*0.08*width)/(1.5*density),0.99*height+rectNumber*0.08*height/density, 1.35*PI+(PI*random(-5,5)/(100)),1.5*PI+(PI*random(-5,5)/(100)));


rectNumber++;

}










}

