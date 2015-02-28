
size (800, 800);
background(250,80, 60,60);
fill(0,100);
strokeWeight(12);
smooth();

int y= 15; //"global"

//variable "scope"

for(int i=10; i<width; i+=50) //local (only everything inside of the for loop knows what local is)

{
 for(int j=10; j<i;  j+=50)
{


ellipse(i, j, 90,90);

}
}

