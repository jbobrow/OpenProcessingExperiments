
//x and y positions 
int[] xpos = new int[80];
int[] ypos = new int[80];


void setup(){
  size(400,400);
  smooth();
}
void draw(){
  background(255);
  //shift array values
  //shift all elements down one spot 
  //xpos[0]=xpos[1],xpos[1]=xpos[2],and so on
  //stop at second to the last element 
  //this is what moving up the arraies
  //this is where it is making it possible for the followers to follow the leader 

  for ( int i = 0; i<xpos.length-1 ; i++){
    xpos[i]= xpos[i+1];
    ypos[i]= ypos[i+1];
  }
  
  //New Location
  //update the last spot in the array with the mouse location
  //because the 50 wideness has to start from mouseX,mouseY
  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;
  
  //draw everything 
  for(int i = 0; i<xpos.length; i++){
    noStroke();
    fill((255-i*5),(255-i*3),(255-i*2));
    ellipse(xpos[i],ypos[i],i,i);
  }
}
  


