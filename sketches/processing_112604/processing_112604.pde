
// Click on the window to give it focus
      // and press the 'B' or 'A' key
      void setup(){
      size(400,200);
    //background(#D3D3CF);
    stroke(0);
  }
      void draw() {
        background(#D3D3CF);
        line(0,50,400,50);
        line(mouseY*2-10,50,mouseX-100,200);
        line(mouseY*2+10,50,mouseX+100,200);
         
         fill(#6FC2FF);
        rect(0,0,400,50);
       // fill(#D30B0B);
        
      }


