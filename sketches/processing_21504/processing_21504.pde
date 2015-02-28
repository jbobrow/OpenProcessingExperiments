
void setup(){
  size(600,600);
}


void draw(){
  background (18,0,185);
 ellipseMode(CENTER);
rectMode(CENTER);

 
 

//skinny rectangle body  
  
  strokeWeight(4);
 fill(248,252,8);
  rect(300,340,100,316);


//strokeCap(ROUND);

 smooth();

//shoes
strokeWeight(4);
fill(252,8,69);
ellipse(260,496,60,40);



strokeWeight(4);
fill(252,8,69);
ellipse(340,496,60,40);




//face
smooth();
strokeWeight(4);
quad(250,180,350,180,325,300,275,300);

//eyes
strokeWeight(3);
fill(34);
ellipse(280,210,20,20);
fill(34);
ellipse(320,210,20,20);
fill(255,255,255);
noStroke();
ellipse(280,210,5,5);
ellipse(320,210,5,5);

//nose

stroke(3);
fill(11,240,0);

ellipse(300,275,15,90);




//teeth
fill(mouseY-50,mouseX-5,mouseY+266);
//original fill color 255,10,243
//fill(mouseY-50,mouseX-10,mouseY+20); MB helping me out
rect(284,316,10,30);
rect(316,316,10,30);

//belly button
stroke(1);
fill(3,244,255);
ellipse(300,460,7,7);

//ears
stroke(2);
triangle(mouseX,mouseY,290,180,250,180);
triangle(mouseX,mouseY,310,180,350,180);

//stationary ears
//triangle(240,140,290,180,250,180);
//triangle(360,140,310,180,350,180);

}


