
//simple movement

int x1 = -450; // square x1 /this shows the speed they come in
int x2 = 600; // this is the ellipse x2//this shows speed from right
int x3 = 600; // this is ellipse x3 mouth and speed from right
int x4 = 600; // this the right eye
int x5 = 600; // left eye
int x6 = -350; // left arm moving in

void setup()
{
size (400, 200); // this is the screen size you want!
}

void draw()
{
background (555); //this is the backgound colour, 555=black//255=white

if (x1<160)// this is how far the square will travel across the screen
{
x1=x1+1;
}
fill (242, 10, 32);
rect(x1, 80, 50, 50);// this is the type of shape and it's size

////this is the values for x2, i had to make an int at top//////////

if (x2>200)// this is my second object x2 with a (>)grater than value
{
x2=x2-1;
}
fill (231, 136, 59);
ellipse(x2, 80, 50, 50);
///////////////////////x3//////x3//////////x3/////////////////////////
if (x3>200)
{
x3=x3-1;
}
fill (242, 10, 32);
ellipse(x3, 90, 10, 10);
/////////////////x4///////x4///////x4/////////x4////////x4////////x4///x4///
if (x4>210)  /// how far it will travel across the screen
{
x4=x4-1;
}
fill (255, 255,255);
ellipse(x4, 70, 5, 5);

//////////x5/////////x5///////x5/////////x5/////////x5//////////x5////x5////
if (x5>190)
{
  x5=x5-1;
}
ellipse(x5, 70, 5, 5);
}



