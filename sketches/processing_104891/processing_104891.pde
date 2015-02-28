
//making a Robot Variable.. here goes!
//start with integers


int x = 80 ;            //x co-ordinate
int y = 300;            //y co-ordinate
int bodyHeight = 300;   //Body Height, remember H is capital and b isn't
int neckHeight = 50;    //Neck Height
int radius = 100;

int jz = x + bodyHeight - radius + neckHeight; //Neck X

size(400,700);         //size always first
smooth();              //default setting
strokeWeight(3);       //CAPITAL W
background (187);      
ellipseMode(CENTER);    //circle goes from the center of the ellipse

//Neck
stroke(222);
line(x*2, y-neckHeight, x*2, jz);
line(x*3, y-neckHeight, x*3, jz);

//head
fill(random(0,25),233,222);
ellipse(x*2+40, jz-110, radius, radius);
fill(140);
ellipse(x*2+36, jz-100, radius-30, radius-30);
ellipseMode(CENTER);
ellipse(x*2+59, jz-139, radius-90, radius-85);
ellipse(x*2+49, jz-139, radius-90, radius-85);

fill(random(0,30),210,220);
ellipse(x*3-20, jz+160, 70, 100);
//body
fill(90,30,5);
rect(x*2-10, y-bodyHeight+300, radius, radius+50);

//legs and arms

stroke(255);
line(x+70, y,x+40, y-50);
line(x+170, y,x+140, y-50);
fill(random(0,25),225,222);
//arc(x*2, y+150, 80, 80, 0, PI+QUARTER_PI, PIE); //HTML DOES NOT SUPPORT THIS!!


ellipse(x*3, jz+160, 70, 100);




