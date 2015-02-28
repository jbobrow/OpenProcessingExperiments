
int x= 50;
int y= 50;
void draw(){
size(100,100);
background(250);
fill(0,0,150);
ellipse(x,y,30,30);
if(keyPressed){
if(keyCode == DOWN) y++;
if(keyCode == UP) y--;
if(keyCode == LEFT) x--;
if(keyCode == RIGHT) x++;
while (x>100)
x= x-1;
while (x<0)
x= x+1;
while (y>100)
y= y-1;
while (y<0)
y= y+1;
} 
}
