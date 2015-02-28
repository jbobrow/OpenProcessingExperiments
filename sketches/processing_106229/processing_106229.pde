
size (500,500);
background (255);
smooth ();

int xPos;
int yPos;
int xWidth;
int yHeight;

xPos= width/2;
yPos= height/2;

xWidth= width/4;
yHeight= height/4;

//orange circle
fill (245,49,42, 100);
rect (xPos/1.45, yPos/1.2, xWidth, yHeight);


//blue circle
fill (33,130,206, 150);
rect (xPos/3, yPos/2, xWidth, yHeight);


//green circle
fill (33,206,75, 150);
rect (xPos/1, yPos*1.175, xWidth, yHeight);
