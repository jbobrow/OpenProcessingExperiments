
// Pressing Control-R will render this sketch.

int i = 0; 
float dTheta=TWO_PI/100;
float theta1=0;
float theta2=theta1+dTheta;
int HEIGHT=800;
int WIDTH=800;
float x1=0;
float y1=0;
float x2=0;
float y2=0;

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
float radius(float theta){
return(2*sin(6*theta));
}
void draw() {  // this is run repeatedly.  

    // set the color
    //stroke(random(50), random(255), random(255), 100);
    
    // draw the line
    //line(400, 100, 400, 700 );
  //  line(100, 400, 700, 400 );
  draw_graph(size, 0, 0, ticks);
  x1=200*radius(theta1)*cos(theta1);
  y1=200*radius(theta1)*sin(theta1);
  x2=200*radius(theta2)*cos(theta2);
  y2=200*radius(theta2)*sin(theta2);
  theta1=theta2;
  theta2=theta2+dTheta;
  line(x1+400,y1+400,x2+400,y2+400);
  
    // move over a pixel
   
}

void draw_graph(int size2, int xOrigin, int yOrigin, int max){
    strokeWeight(2);
    float axisLength=(size2-size2/4)/2;
    //int extra=size2/32;
    float tickSpacing=axisLength/(max);
    float tickLength=size2/50;
    float centerx=size2/2;
    float centery=size2/2;
    float extra=tickSpacing*.9;
    line(size2/2, size2/8-extra, size2/2, size2-size2/8+extra );   //y axis
    line(size2/8-extra, size2/2, size2-size2/8+extra, size2/2 );   //x axis
    for (int i = 1; i <= max; i = i+1) {
        line(centerx+i*tickSpacing,centery-tickLength,centerx+i*tickSpacing,centery+tickLength);
        line(centerx-i*tickSpacing,centery-tickLength,centerx-i*tickSpacing,centery+tickLength);
        line(centerx-tickLength,centery+i*tickSpacing,centerx+tickLength,centery+i*tickSpacing);
        line(centerx-tickLength,centery-i*tickSpacing,centerx+tickLength,centery-i*tickSpacing);
    }
    
}

