
void setup()
{
  size(1000,1000);
  smooth();
  background(50, 80, 95);
  stroke(0);
  strokeWeight(1);
color puppycolor = color(150, 100, 230);
color puppynose = color(250, 155, 175);
color black = color(0, 0, 0);
color puppyface = color(175, 120, 200);
color puppyeye = color(200, 100, 90);


for(int i = 0; i < 2; i++)
{
  int offsetHoriz = 300 * i;
  for(int j = 0; j < 2; j++)
  {
    int offsetVert = 300 * j;
  //ears
fill(puppycolor);
ellipse(50 + offsetHoriz,120 + offsetVert,20,100);
ellipse(150+ offsetHoriz,120 + offsetVert,20,100);
//triangle(50, 50, 50, 90, 90, 60);
//triangle(150, 50, 150, 90, 110, 60);

//bezier(150, 50,  200, 35,  200, 105,  150, 105);
//bezier(50, 50, -20, 5, 10, 75, 50, 90);

//tail
fill (puppyface);
ellipse (300 + offsetHoriz, 140 + offsetVert, 10, 50);

//leg 1
fill (puppycolor);
ellipse (270+ offsetHoriz, 255 + offsetVert, 20, 100);

//leg 2
fill (puppycolor);
ellipse (140+ offsetHoriz, 255 + offsetVert, 20, 100);

//foot 1
fill (puppyface);
ellipse (260+ offsetHoriz, 305 + offsetVert, 30, 20);

//foot 2
fill(puppyface);
ellipse (135 + offsetHoriz, 305 + offsetVert, 30, 20);

//body
fill (puppycolor);
ellipse (200+ offsetHoriz, 175 + offsetVert, 200, 100);


//head
fill (puppyface);
ellipse(100+ offsetHoriz, 100 + offsetVert, 100, 135);

//nose
fill (puppynose);
ellipse(100+ offsetHoriz, 120 + offsetVert, 50, 40);

//eyes
fill (puppyeye);
ellipse(80+ offsetHoriz, 85 + offsetVert, 20, 20);
ellipse(120+ offsetHoriz, 85 + offsetVert, 20, 20);

fill(black);
ellipse(80+ offsetHoriz, 90 + offsetVert, 10, 10);
ellipse(120+ offsetHoriz, 90 + offsetVert, 10, 10);

//mouth
fill (black);
ellipse (100+ offsetHoriz, 150 + offsetVert,20,10);

  
}}
}

