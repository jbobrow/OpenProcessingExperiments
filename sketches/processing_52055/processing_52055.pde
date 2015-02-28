
size (800, 800);
background(133);
fill(13,100,12,5);
strokeWeight(2);
smooth();

int y= 10; //"global"

//variable "scope"

for(int i=10; i<height; i+=40) //local (only everything inside of the for loop knows what local is)

{
 for(int j=10; j<i;  j+=50)
{


ellipse(i, j, 90,90);

}
}

for (int i=0; i<height; i+=5)
{
  line (0,i, width,i);
}


line (0,10, width, 10);
line (0,20, width, 20);
line (0,30, width, 30);
line (0,40, width, 40);
line (0,50, width, 50);
line (0,60, width, 60);


