

//define the size of the window
size(800, 200);
background(0);
colorMode(HSB,width);
// this variabel will be used to spefi the thickenss of the line or stroke weight
// it will be incrimented at a diffrent rate to the counter in the for loop
int  sw = 0;

//a for loop that will loop form 0 to width -1
//the coutner i will be incrimented in steps of 30
for(int i=0;i<width;i+=30){
  //this fucntion sets the thikness of the line
  strokeWeight(sw+=1);

  //this cunction sets the colour of line
  stroke(i,width,width);
  
  // this draws a line frmo the top to the bottom of the screen at  x value i
  line(i,0,i,height);
}

