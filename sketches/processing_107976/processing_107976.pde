
// Declare screen variables
int width = 800;
int height = 800;

// Spacing between the posts
int postspacing = 80;
// +/- for post spacing
int postspacingvariance = postspacing/3;
// Number of posts
int postnumber = (width/postspacing)+2;
// minimum post width
int minpostwidth = 7;
// maxiumum post width
int maxpostwidth = 30;

// number of bars per post
int barsperpost = 8;
// bar height across all bars
int barheight = 20;
// +/- for bar height
int barheightvariance = barheight/2;
// barspacing
int barspacing = height/barsperpost;
// +/- for bar spacing
int barspacingvariance = barspacing/10;

// colours
color red = #ab3322;
color yellow = #f2d82c;
color blue = #4549a6;
color white = #ecebe4;

// Declare arrays for posts
int[] leftbound = new int[postnumber];
int[] postwidth = new int[postnumber];
int[] rightbound = new int[postnumber];

// Declare colour array
int[] colourchoice = { red, yellow, blue, white };


void setup() { 
  // Construct the screen
  size (800, 800);
  background(white); 
}

void mousePressed() {
  
  // Reset background to white
  background(white);
  
  // Construct arrays
  for (int i = 0; i < postnumber; i++) {
    // Define the leftbound of the post with +/- the postspacing variance.
    leftbound[i] = (i*postspacing-100)+(int(random(-1*postspacingvariance, postspacingvariance)));
    // Define the width of the post between the minpostwidth and the maxpostwidth.
    postwidth[i] = int(random(minpostwidth, maxpostwidth));
    // Define the rightbound of the post as the leftbound + the postwidth.
    rightbound[i] = leftbound[i] + postwidth[i];
  }
  
  // Draw posts
  for (int i = 0; i < postnumber; i++) {
    noStroke();
    fill(30);
    rect(leftbound[i], 0, postwidth[i], height);
  }
  
  // Draw interior bars
   for (int i = 0; i < postnumber; i++) { 
     for (int j = 0; j < barsperpost; j++) {
       noStroke();
       fill(colourchoice[(int(random(0, 3)))]);
       rect(leftbound[i], (((height/barsperpost)/2)-(barheight/2)+barspacing*j)+(random(-1*barspacingvariance, barspacingvariance)), postwidth[i], barheight+(random(-1*barheightvariance, barheightvariance)));
     }
   }
   

   // Draw full bars, half bars and center bars on odd columns to prevent overlap from column to column.
   for (int i = 0; i < postnumber-1; i+=2) { 
     for (int j = 0; j < barsperpost-1; j+=2) {        
       int a = int(random(0, 4));
       println(a);
         if (a == 0) {
             noStroke();
             fill(colourchoice[(int(random(0, 4)))]);
             rect(leftbound[i], barspacing+barspacing*j+(random(-1*barspacingvariance, barspacingvariance)), leftbound[i+1]-leftbound[i]+postwidth[i+1], barheight+(random(-1*barheightvariance, barheightvariance)));
         } else if (a == 1) {
             noStroke();
             fill(colourchoice[(int(random(0, 4)))]);
             rect(leftbound[i], barspacing+barspacing*j+(random(-1*barspacingvariance, barspacingvariance)), leftbound[i+1]-leftbound[i], barheight+(random(-1*barheightvariance, barheightvariance)));
       } else if (a == 2) {
             noStroke();
             fill(colourchoice[(int(random(0, 4)))]);
             rect(rightbound[i], barspacing+barspacing*j+(random(-1*barspacingvariance, barspacingvariance)), leftbound[i+1]-rightbound[i], barheight+(random(-1*barheightvariance, barheightvariance)));
       } else {
       }
     }
   }
       
   // Draw full bars, half bars and center bars on even columns to prevent overlap from column to column.
   for (int i = 1; i < postnumber-1; i+=2) { 
     for (int j = 1; j < barsperpost-1; j+=2) {        
       int a = int(random(0, 3));
       println(a);
         if (a == 0) {
             noStroke();
             fill(colourchoice[(int(random(0, 4)))]);
             rect(leftbound[i], barspacing+barspacing*j+(random(-1*barspacingvariance, barspacingvariance)), leftbound[i+1]-leftbound[i]+postwidth[i+1], barheight+(random(-1*barheightvariance, barheightvariance)));
         } else if (a == 1) {
             noStroke();
             fill(colourchoice[(int(random(0, 4)))]);
             rect(leftbound[i], barspacing+barspacing*j+(random(-1*barspacingvariance, barspacingvariance)), leftbound[i+1]-leftbound[i], barheight+(random(-1*barheightvariance, barheightvariance)));
       } else if (a == 2) {
             noStroke();
             fill(colourchoice[(int(random(0, 4)))]);
             rect(rightbound[i], barspacing+barspacing*j+(random(-1*barspacingvariance, barspacingvariance)), leftbound[i+1]-rightbound[i], barheight+(random(-1*barheightvariance, barheightvariance)));
       } else {
       }
     }
   }
}

void draw() {
}
