
MRect[] r1 = new MRect[5];

void setup(){
  size(400, 400);
  noStroke();
  
  for (int i=0; i<5; i++){
  //println(i);
      r1[i] = new MRect(20, 20, 4, 4, i);
  }
}

void draw()
{
  background(0);
  // loop through people
  for (int i=0; i<5; i++){
      r1[i].display(i); 
  }
}

class MRect {
  
  float w; //width
  float h; //height
  float xpos; //squares x position
  float ypos; //squares y position
  int id;
  
   //Constructor
  MRect(float iw, float ih, float ixp, float iyp, int iid){
    w = iw;
    h = ih;
    id = iid+1;
    xpos = ixp;
    ypos = iyp;
  }
   void display(){
  
   fill(255);
   rect(mouseX+sin(frameCount/100*id)*100,mouseY+cos(frameCount/100*id)*100,w,h);
   }
  }
  
