
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

// set the background color
background(255);
    
// canvas size (Integers only, please.)
size(250, 250); 
      
// smooth edges
smooth();

seed_colors[0] = color(255, 0, 0); //red
seed_colors[1] = color(0, 255, 0); //green
seed_colors[2] = color(0, 0, 255); //blue
seed_colors[3] = color(255, 255, 0); //yellow
seed_colors[4] = color(255, 0, 255); //pink
seed_colors[5] = color(0, 255, 255); //light blue
    
// Set seeds position, random
// Legend says that those that do not put brackets on separate lines are losers, but I think that an opening bracket does not deserve a separate line, he he.
for(i=0; i < ncolors; i++){
    // Keep them not too close to the borders, otherwise it's not fun
    // TODO: should also check that two or more are not generated in the same spot!
    seeds_x[i] = random(20, myw - 20);
    seeds_y[i] = random(20, myh - 20);
    //fill(255,0,0);
    //ellipseMode(CENTER)
    //ellipse(seeds_x[i], seeds_i[i],5,5);

}
    
// For each pixel
for(int px = 0; px < myw; px++){
    for(int py = 0; py < myh; py++){
        // Check distances to colors
        minDistance = sq(px  - seeds_x[0]) + sq(py  - seeds_y[0]);
        minIndex = 0;
        for (int nc = 1; nc < ncolors; nc++){
            int dist = sq(px  - seeds_x[nc]) +  sq(py  - seeds_y[nc]);
            if (dist <= minDistance){
                minDistance = dist;
                minIndex = nc;
            }
        }
        // Distance has been picked. Color!
        stroke(seed_colors[minIndex])
        point(px, py);
    }
}

//and now we will just draw the initial points

fill(142,3,135);
ellipseMode(CENTER);
noStroke();
for(i=0; i < ncolors; i++){
    ellipse(seeds_x[i], seeds_y[i],10,10);
}
