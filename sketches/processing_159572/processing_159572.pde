
void setup(){ 
    size(1024,768); // the most common computer display resolutions
    background(200, 200, 205);
    stroke (0.001);
    smooth(); // to draw anti-alias
    }
 
void draw(){
    float x = 0; // command x axis to move randomly
    for (int i = 0; i<width; i+=12){ // any int withint the width of the defined size is visualized with 6 pixel gaps between the ellipses' centers.
        fill(255, 255, 255, 30); //white dot with 30% opacity
        ellipse(i, noise(i*0.09f, frameCount*0.007f)*height, 9, 9); // noise=level of variety; framecount=motion speed on y-axis; (x, y)=pixels per width and height.
        }
   
   }


