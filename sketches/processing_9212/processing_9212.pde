
int y = 80;         //vertical location of each line
int x = 50;         //initial horizontal location for 1st line
int spacing = 10;   //how far apart each line is!
int len = 20;       // length of each line


void setup () {
  size (200,200);
}
void draw () {
/* can be displayed as the following.....
  stroke(255);
  line(x,y,x,y+len);
  
  x= x +spacing;
  line(x,y,x,y+len); and so on and so on.... OR can be diplayedin loop:-*/
  
  int endLegs = 150;
  
  stroke(0);
  while ( x<=endLegs) {
    line(x,y,x,y+len);
    x = x+ spacing;
  }
}
/*when using this formula you can then adjust the spacing int to affect how many lines are drawn!*/

