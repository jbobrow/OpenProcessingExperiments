
//Gina DeMatteo
//September 7,2011
//Interchanging fields over an Interchanging figure ground

void setup() {
  size(300, 300);
  smooth();
}

void draw() {
  if (mouseX > width/2) {

    //Initial background:black
    background(0);
    noStroke();
    
    //White Rectangle
    fill(255);
    rect(5, 5, 75, 100);
    
    //Teal,thin rectangle that runs underneath horizontal gray rectangle
    fill(29, 180, 182);
    rect(220, 0, 5, height);

    //Gray rectangle that spans horizontally across the field
    fill(174, 183, 182);
    rect(0, 200, width, 75);

    //Teal,thicker rectangle that overlaps horizontal gray rectangle
    fill(29, 180, 171);
    rect(250, 0, 25, height);
  }
  else {
    
    //When mouse is dragged across width/2 background changes to white
    background(255);
    
    //White rectangle changes to black when mouse is dragged across width/2
    fill(0);
    rect(5, 5, 75, 100);
    
    //Thicker vertical rectangle changes to gray and runs underneath larger rectangle when mouse crosses width/2
    fill(174, 183, 182);
    rect(250, 0, 25, height);

    //Horizontal rectangle changes to teal color when mouse is dragged across width/2
    fill(29, 180, 182);
    rect(0, 200, width, 75);

    //Thinner vertical rectangle changes to gray and overlaps horizontal rectangle when mouse crosses width/2
    fill(174, 183, 182);
    rect(220, 0, 5, height);
  }
}


