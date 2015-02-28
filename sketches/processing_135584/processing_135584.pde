
void setup(){
size(400,400);
background(141,182,205);
smooth();
}
int x = 200;
int y = 100;
void draw(){
  background(141,182,205);
//assignment 3a
fill(139,131,134);
stroke(184,134,11);
strokeWeight(6);
rect(width-mouseX,x-150,80,80);
noFill();
stroke(139,101,8);
rect(width-mouseX-5,x-155,90,90);
 
//assignment 3b
fill(139,131,134);
stroke(139,101,8);
strokeWeight(6);
rect(x-30,y+55,y-40,x);
strokeWeight(.5);
stroke(139,131,134);
fill(139,101,8);
rect(x-55,y+35,y+10,y-80);
rect(x-55,x+155,y+10,y-90);
 
//assignment 3c
fill(x+40,x+40,x+40,x+40);
stroke(y-85,y-85,y-85,x+40);
strokeWeight(.04*y);
ellipse(x,mouseY,y-33,y-33);
strokeWeight(.005*y);
line(200,mouseY,175,mouseY+5);
line(200,mouseY,174,mouseY-18);
point(x,mouseY);
stroke(x+55,x+15,y-100,x+30);
strokeWeight(.05*y);
line(x,y+70,mouseX,mouseY);
fill(x+55,x+15,y-100,x+45);
ellipse(mouseX,mouseY,y-65,y-65);
}
