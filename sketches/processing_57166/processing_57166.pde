
class Picture {  

  //initial variables for the pattern
  int w, h; 
  float space, i;  

  void make() {  

    w = width;  
    h = height; 

    fill(0, 10); //make trails


    rect(0, 0, width, height);  
    translate( w = 400, 400);
    i += 0.05;
    

    stroke(195);
    smooth();
    strokeWeight(1);


    for ( int x = 0; x < w; x += 1+space) {  


      // rotate(i *i); //spirogram variant

      if (mouseX < 400) {

        rotate(TWO_PI+i);
        line(0, x+2, 0, x); 
        line(0, w, 0, w);
      }

      if (mouseY > 400 ) {

        rotate(TWO_PI*i);
        line(x+4, 0, 0, x);
        line(space, 0, 0, w); 
        line(0, space, x/2, 0);
        line(0, space/PI, space, 0);
      } 
      if( mouseX > 400) {
       rotate(TWO_PI*i);
        line(x+4, 0, x, 0);
        line(w/i, 0, x/i, 0); 
        line(0, 0, x/4, 0);
        line(0, space, space, 0);
      }      
      if ( key == 'r' ) { //press 'e' or the space bar in order to get back to the original visualisation
        translate( h = 400, 400);
        i += 0.05;
      }
      
      if ( key == 'c') {
        rotate(TWO_PI * i);
        line(x, 0, x, 0);
        line(space/PI, w, 0, w);
        line(x, 0, w, x);
      }
    }
    space = mouseX/4;
  }
}


