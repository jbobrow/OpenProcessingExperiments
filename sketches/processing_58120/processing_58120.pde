
void setup (){
  size (200,200);
  fill(0,102);
  smooth();
int x =100;
int y =100;

//Whats this??



}
  
void draw (){
  background(255);
  int x= mouseX; 
  int y= mouseY;

//Head
ellipse(100,100, 60,60);
triangle(105,70,130,90,145,60);
triangle(95,70,70,90,55,60);
//is there a way where i can mirror the two triangles without having to calculate the co-ordinates?


//Face
fill(0,26,51);
ellipse (90,90,12,12);
fill(0,0,225);
ellipse(90,90,6,6);
fill(0,26,51);
ellipse (110,90,12,12);
fill(0,0,225);
ellipse(110,90,6,6);
fill(255,0,0);
rect(90,110,15,3);



//antenee
fill(0);
line(100,70,100,30);
ellipse(100,25,10,10);

//shoulders

//Neck
fill(192);
rect(90,130,20,20);
line(100,150,100,155);

//Body
strokeWeight(10);
fill(204,226,225);
rect(73,155,55,40);


//Arms
//I tried to use fill(255); for the ellipse to be filled in white here but it did not allow. Why? 
strokeWeight(1);
line(73,170,30,140);
ellipse(25,140,10,15);
line(128,170,170,140);
ellipse(175,140,10,15);


}

