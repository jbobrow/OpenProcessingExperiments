
void setup (){
  size (200,200);
  fill(0,102);
  smooth();
int x =100;
int y =100;

//Whats this??

int diameter =0;

}
  
void draw (){
  background(255);
  int x= mouseX; 
  int y= mouseY;

//Head
ellipse(x,y, 60,60);
triangle(x+5,y-30,x+30,y-10,145,60);
triangle(x-5,y-30,x-30,y-10,55,60);
//is there a way where i can mirror the two triangles without having to calculate the co-ordinates?


//Face
fill(0,26,51);
ellipse (x-10,y-10,12,12);
fill(0,0,225);
ellipse(x-10,y-10,6,6);
fill(0,26,51);
ellipse (x+10,y-10,12,12);
fill(0,0,225);
ellipse(x+10,y-10,6,6);
fill(255,0,0);
rect(x-10,y+10,15,3);



//antenee
fill(0);
line(x,y-30,100,30);
ellipse(x,y-75,10,10);

//shoulders

//Neck
fill(192);
rect(x-10,y+30,20,20);
line(x,y+50,100,155);

//Body
strokeWeight(10);
fill(204,226,225);
rect(x-27,y+55,55,40);


//Arms
//I tried to use fill(255); for the ellipse to be filled in white here but it did not allow. Why? 
strokeWeight(1);
line(x-27,y+70,30,140);
ellipse(x-75,y+40,10,15);
line(x+28,y+70,170,140);
ellipse(x+75,y+40,10,15);


}

