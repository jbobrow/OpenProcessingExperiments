
// Pressing Control-R will render this sketch.

int i = 0; 
int HEIGHT=800;
int WIDTH=800;
void setup() {  // this is run once.   
    
    // set the background color
    background(255);
    
    // canvas size (Integers only, please.)
    size(800, 800); 
      
    // smooth edges
    smooth();
    
    // limit the number of frames per second
    frameRate(30);
    
    // set the width of the line. 
    strokeWeight(12);
} 
void draw_graph(){
    strokeWeight(6);
    line(400, 100, 400, 700 );
    line(100, 400, 700, 400 );
}
void draw() {  // this is run repeatedly.  

    // set the color
    //stroke(random(50), random(255), random(255), 100);
    
    // draw the line
    //line(400, 100, 400, 700 );
  //  line(100, 400, 700, 400 );
  draw_graph(800, 0, 0, 2);
    
    // move over a pixel
    if (i < width) {
        i++;
    } else {
        i = 0; 
    }
}

void draw_graph(int size, int xOrigin, int yOrigin, int max){
    strokeWeight(2);
    int axisLength=(size-size/4)/2;
    int extra=size/32;
    int tickSpacing=axisLength/(max);
    int tickLength=size/50;
    int centerx=size/2;
    int centery=size/2;
    line(size/2, size/8-extra, size/2, size-size/8+extra );   //y axis
    line(size/8-extra, size/2, size-size/8+extra, size/2 );   //x axis
    for (int i = 1; i <= max; i = i+1) {
        line(centerx+i*tickSpacing,centery-tickLength,centerx+i*tickSpacing,centery+tickLength);
    }
    
}
