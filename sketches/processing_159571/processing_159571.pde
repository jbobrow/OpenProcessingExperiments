
void setup(){ 
    size(1024,768); // the most common computer display resolutions
    background(135, 206, 235); // RGB colors for skyblue: http://cloford.com/resources/colours/500col.htm
    stroke (0.1);
    smooth(); // to draw anti-alias
    }
 
void draw(){
    float x = 0; // command x axis to move randomly
    for (int i = 0; i<width; i+=10){ // any int withint the width of the defined size is visualized with 6 pixel gaps between the ellipses' centers.
        fill(255, 255, 255, 20); //white dot with % opacity
        ellipse(i, noise(i*0.001f, frameCount*0.005f)*height, 10, 10); // noise=level of variety; framecount=motion speed on y-axis; (x, y)=pixels per width and height.
        }
   
   }


