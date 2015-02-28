
//Color 1 - Color by Numbers
//Exercise #1
/*
1. Explore a wide range of color combinations within one 
composition. */
int k = 1;

void setup (){
size (400,400);

colorMode(HSB);
for (int i = 0; i < 400; i++) {
stroke(i*0.6375, i*0.6375, i*0.6375);
line(0, i, i, 400);
}

colorMode(HSB);
for (int j = 0; j < 400; j+=8) {
stroke(0.6375*j, 0.6375*j, 0.6375*j);
line(j, 0, 400, j);
}
}

void draw (){
colorMode(HSB);
k = k+1;

fill (100,k/2,k-200,k/2);
ellipse(200, 200, k, k);

if (k > 250) {
  k = 100;
}

}

//size(width, height); don't think you can animate the window size change
//width = width + 1;
//height = height +1;
//ellipse(width/2, height/2, width/2, height/2);
 
//bezier(200,200, 125, 200, 125, 100, 200,100);
//bezier(width/2,height/2, width/3.2, height/2, width/3.2, height/4, width/2,height/4);
 
//bezier(200, 200, 275, 200, 275, 300, 200, 300);
//bezier(width/2,height/2, width/1.4545, height/2, width/1.4545, height/1.333, width/2, height/1.333);
 
 



