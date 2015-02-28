
class robot {
  
  int imgnum;
  int xpos;
  int ypos;
  
  robot(int tempimgnum, int tempxpos, int tempypos){
    println("a robot has been created");
    
    imgnum = tempimgnum;
    xpos = tempxpos;
    ypos = tempypos;
    }
    
    void display() {
       image(images[imgnum], xpos, ypos); 
    }
    
    void leave(){
      xpos += 75;
    }
  }

