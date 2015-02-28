
//modified from Mitchell Whitelaw's amazing recreation of Mr. Doobs Harmony procedural drawing tool. 
ArrayList history = new ArrayList();//arrays are ranges of data, that belong to a group
float distthresh = 10;//20, 60, 90, 10, scrach anger ah
 
void setup(){//
  size(900,600);//
  background(0);//255
  stroke(60,30);//(0,50)
  smooth();//
}
 
 
void draw(){
   
}
 
void mouseDragged(){
 
  PVector d = new PVector(mouseX,mouseY,0);
  history.add(0,d);
   
  for (int p=6; p<history.size(); p++){
    PVector v = (PVector) history.get(p);
    float joinchance = p/history.size() + d.dist(v)/distthresh;
    if (joinchance < random(1.9))  line(d.x,d.y,v.x,v.y);//0.4(0.10, diminishes the line and focus on the joinchace)
  }//joinchace<random(0.4)//joinchace> random (0.10)//> random (0.9) less fill//(1.9)wider range
}
 
void keyPressed(){
  if (key == ' ') {
    background(255);
    history.clear();
    
    /// what if i where to create a superimpossion of the images people make?
  }
}
// ok what if i wanted the program to recreate mimic your drag, and start recreating a sequence based on that?

void mouseOver(){


}
  



