
class Picture {  

  //initial variables for the pattern
  int w, h; 
  float space, i;  

  void make() {  

    w = width;  
    h = height; 

    fill(0, 11); //make trails


    rect(0, 0, width, height);  
    translate( w = 400, 400);
    i += 0.05;

    stroke(200);
    smooth();
    strokeWeight(1);


    for ( int x = 0; x < w; x += 1+space) {  

      // //this is trippy as
      //  rotate(space /i); //spirogram variant

      if(mouseX < 400) {

        rotate(TWO_PI+i);
        line(0, x+2, 0, x); 
        line(0, w, 0, w);
      }

      if(mouseX > 200 ) {

        rotate(PI*i);
        line(x+4, 0, x, 0);
       // line(w/i, 0, x/i, 0); 
        line(0, 0, x/4, 0);
        line(0, space, space, 0);
      }
    }
    space = mouseX/4;
    
  }
}


