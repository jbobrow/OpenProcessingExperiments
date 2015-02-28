
int mysize=100;
float xpos =50;
float ypos =50;

//int maxNum=1200;



void setup () {
  
size (500,400);
 
background (0);
smooth();

}


void draw (){

  //for (int i=0;i<maxNum;i++){
 

    
  if (mouseX>500) {mouseX=280;}
  mouseX=mouseX+8;
 // if (mouseY>450) {mouseY=100;}
  
  background (0);

  fill(mouseX * 1, 0, 160); 
 ellipse(xpos,ypos,mysize,100);
 
 
 
xpos = xpos + (mouseX - xpos) /10.0;
ypos = ypos +(mouseY -ypos)/10.0;


  }


//void mousePressed (){
 
//}
//void mouseMoved(){
//}


