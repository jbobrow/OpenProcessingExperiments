
    int z = 1;
    ArrayList circleX;
    ArrayList circleY;
    float offset;
    float r;
    float g;
    float b;
    boolean down = false;
    
    void setup(){
      size(600,600);
      background(1);
      circleX = new ArrayList();  // Create an empty ArrayList
      circleY= new ArrayList();  // Create an empty ArrayList
      offset = 1;
    }
    
    void draw(){
     
     if (mousePressed){
       circleX.add(mouseX);  
       circleY.add(mouseY);  
      // ellipse(mouseX, mouseY, 1, 1);
       r = random(100,255);
       g = random(1,255);
       b = random(100,255);
     
     
     
     //if (!mousePressed){
       for (int i = circleX.size()-1; i >= 0; i--) { 
      
         if (down){
           offset -= 1;
         } else {
           offset += 1;
         }
       
       if (offset > 20){
         down = true;
       } 
       
          if (offset < -20){
         down = false;
       } 
       
       
       stroke(r+offset,0,b+offset);
       
       if ((mouseX - (Integer) circleX.get(i)) < 150 && (mouseX - (Integer) circleX.get(i)) > -150 && mouseY - (Integer) circleY.get(i) < 150 && mouseY - (Integer) circleY.get(i) > -150){
       
         float rndm = random(1,100);
         //if (rndm < 20){
         //drawFlash((Integer) circleX.get(i), (Integer) circleY.get(i),mouseX,mouseY);
            line(mouseX,mouseY,(Integer) circleX.get(i), (Integer) circleY.get(i));
    
        // }
           ellipse((Integer) circleX.get(i),(Integer) circleY.get(i), 1, 1);
    
        
       
     }
     
       } 
     
        for (int i = circleX.size()-1; i >= 0; i--) { 
          int oldX = (Integer) circleX.get(i);
          int oldY = (Integer) circleY.get(i);
    
          int rndmdir = int(random(5));
          switch (rndmdir){
             case 1:
                  circleX.set(i,oldX-5);
                  circleY.set(i,oldY-5);
                  break;
             case 2:
                circleX.set(i,oldX-5);
                circleY.set(i,oldY+5);
                break;
             case 3:
                circleX.set(i,oldX+5);
                circleY.set(i,oldY-5);
                break;
             case 4:
                circleX.set(i,oldX+5);
                circleY.set(i,oldY+5);
                break;
          }  
    
       
        }
     }
     }

 


