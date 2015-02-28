
/*Project 1
I took a repetion of checkerboards and overlaid rectangles that resemble
trace. This trace is ordered by the grid set up by the checkerboard and the composition looks at the 
effects of the trace on the background and the traces interaction with itself.*/

void setup(){
  size(500,500);
  background(0);
  smooth();
  
}

float numOfRects=5;

void draw(){
  
   //creates white in checkerboard pattern
  for(int a=0; a<height; a+=10){
    
   for(int x=0; x<width; x+=5){
     noStroke();
     fill(255);
     rect((x*2),(a*2),5,5);
       }
       
   for(int y=0; y<width; y+=5){
    fill(255);
    rect(((y*2)+5),(a*1)+5,5,5);  
    }
  
  //fills the rectangles that generate from corners
  //50% chance yellow "trace" 50% chance white "trace"
  if(random(100)>50){
    fill(255,255,0,100);
  }
  else{
    fill(200,100);
  }
  
  //generates the rectangles from top left
  if(numOfRects>0){    
    rect(0,0,random(0,100)*5,random(0,100)*5);//multipied by 5 to make it conform to the checkerboard grid
  }
  
  //generates rectangles from bottom right
  if(numOfRects>0){
     rect(random(0,100)*5,random(0,100)*5,width,height);//multipied by 5 to make it conform to the checkerboard grid
  }
  
  numOfRects--;
  } 
 
}

//resets the drawing when mouse is clicked
void mousePressed(){
  background(0);
  numOfRects=5;
}






