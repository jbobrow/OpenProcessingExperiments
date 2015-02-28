
//10 PRINT – Single line of code as a lens through creative computing
//http://www.creativeapplications.net/processing/10-print-single-line-of-code-as-a-lens-through-creative-computing/

void draw(){
int x=frameCount *5;
int c=int(random(2))*5;
line(x+c,89,x+5-c,94);
if(x==95)set(0,0,get(0,5,100,x));
}
