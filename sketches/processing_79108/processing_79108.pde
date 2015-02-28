
// Pressing Control-R will render this sketch.
int i = 0;
int myw = 250;
int myh = 250;
int ncolors = 6;
int[] seeds_x = new int[ncolors];
int[] seeds_y = new int[ncolors];
color[] seed_colors = new color[ncolors];

int minDistance = 0;
int minIndex = 0;

 // this is run once. 
void setup()
{
    // Legend says that those that do not put brackets on separate lines are losers!
    
    // set the background color
    background(255);
    
    // canvas size (Integers only, please.)
    size(250, 250); 
      
    // smooth edges
    smooth();
    
    // limit the number of frames per second
    frameRate(30);

    seed_colors[0] = color(255, 0, 0);
    seed_colors[1] = color(0, 255, 0);
    seed_colors[2] = color(0, 0, 255);
    seed_colors[3] = color(255, 255, 0);
    seed_colors[4] = color(255, 0, 255);
    seed_colors[5] = color(0, 255, 255);
    
    // Set seeds position, random
    for(i=0; i < ncolors; i = i+1)
    {
        // Keep them not too close to the borders, otherwise it's not fun
        // TODO: should also check that two or more are not generated in the same spot!
        seeds_x[i] = random(20, myw - 20);
        seeds_y[i] = random(20, myh - 20);
    }
    
} 
// this is run repeatedly.
void draw()
{   
    
    // For each pixel
    for(int px = 0; px < myw; px = px +1)
    {
         for(int py = 0; py < myh; py = py +1)
         {
             // Check distances to colors
             minDistance = ((px  - seeds_x[0]) * (px - seeds_x[0])) +  ((py  - seeds_y[0]) * (py  - seeds_y[0]));
             minIndex = 0;

             for (int nc = 1; nc < ncolors; nc = nc+1)
             {
                 int dist = ((px  - seeds_x[nc]) * (px - seeds_x[nc])) +  ((py  - seeds_y[nc]) * (py  - seeds_y[nc]));
                 
                 if (dist <= minDistance)
                 {
                     minDistance = dist;
                     minIndex = nc;
                }
            }
            // Distance has been picked. Color!
            //set(px, py, seed_colors[minIndex]);
            //line(0, 7, 85, 75);
            stroke(seed_colors[minIndex])
            point(px, py);
        }
    }
}
