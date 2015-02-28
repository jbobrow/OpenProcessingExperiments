
int a = 1 ;//munber of rays
float pos_x[] = new float[a];
float pos_y[] = new float[a];
float angle[] = new float[a];
float angle1[] = new float[a];
float radius[] = new float[a];
float radius1[] = new float[a];
float al=1000; //alpha value of fills and strokes, colours
int start = 1;
int x = 300;//staring point
int y = 300;//starting point
int l = 10;//staring point
int r = 11;//starting point
int z = 0;//staring point
float dx=4+random(100.0);
float dy=4+random(100.0);
PImage b;//logo
PImage c;//instructions
void setup (){
size (600,600,P3D);//size of window//3D
background(255);//background colour
}
void draw (){
pos_x[a-1] = mouseX+ radius[a-1]*cos(angle[a-1]);//mouse position to change colour
pos_y[a-1] = mouseY+ radius1[a-1]*sin(angle1[a-1]); //mouse position to change colour
if(keyPressed) { 
if (keyCode == UP) { 
if (y<=20)//limit top
{
y=y;
}
else
{
y = y - 1;
}
} 
else if (keyCode == DOWN) { 
if (y>=580)//limit bottom
{
y=y;
}
else
{
y=y + 1;
}
}
else if (keyCode == RIGHT) { 
if (x>=880)//limit right side
{
x=x;
}
else
{ 
x = x + 1;
} 
}
else if (keyCode == LEFT) {
if (x<=160)//limit left side
{
x=x;
} 
else
{ 
x = x - 1;
}
}
else if (key == 'a'){
z=z+10; //+10 in z axis
}
else if (key == 's'){ 
z=z-10;//moves out in z axis
} 
}
int mk = 5;//thickness of outline
rect(0,0,width,mk);//top outline
rect(0,mk,mk,height-mk*2);//left outline
rect(width,height-mk,-mk,-height+mk*2);//right outline
rect(width,height,-width,-mk);//bottom outline
noFill();//doesnt fill the window with outline colour
for(int i=0; i<a; i++) {
float randoCol = random(-75,75);
int rando = int(randoCol);
float randoAl = random(80,160);
int randoA = int(randoAl); 
if(start == 1){
fill (pos_x[i],pos_y[i],50,al);//fills outline colour
stroke (pos_x[i]+rando,pos_y[i]+rando,50,randoA);//draws box
} 
} 
translate(x,y,z);//moves box x,y,z axis 
box(10);//size of box drawn 

if (keyPressed == true) {
if(key=='e' || key=='E'){
fill(0);//fills window in black
stroke(0);//outline colour when "e" pressed
rect (mk,mk,width-mk*2-1, height-mk*2-1);
}
}
}


