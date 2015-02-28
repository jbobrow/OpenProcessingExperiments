
float greencircle = 0;
float bluecircle  = 1000;


void setup() {
 size(1000, 700); 
 noStroke();
 smooth();
}

void draw() {
 background(0); 
 
 fill(0, 255, 0);
 ellipse(greencircle, 350, 30, 30);
 ellipse(greencircle, 300, 30, 30);
 ellipse(greencircle, 400, 30, 30);
 ellipse(greencircle, 250, 30, 30);
 ellipse(greencircle, 450, 30, 30);
 ellipse(greencircle, 200, 30, 30);
 ellipse(greencircle, 500, 30, 30);
 ellipse(greencircle, 550, 30, 30);
 ellipse(greencircle, 150, 30, 30);
 ellipse(greencircle, 100, 30, 30);
 ellipse(greencircle, 600, 30, 30);
 ellipse(greencircle, 650, 30, 30);
 ellipse(greencircle, 50, 30, 30);
 ellipse(greencircle, 0, 30, 30);
 ellipse(greencircle, 700, 30, 30);
 greencircle = greencircle + 10;
 if(greencircle > 1000) {
  greencircle = 0; 
 }
 
 
 fill(0,0, 255);
 ellipse(bluecircle, 0, 30, 30);
 ellipse(bluecircle, 50, 30, 30);
 ellipse(bluecircle, 100, 30, 30);
 ellipse(bluecircle, 150, 30, 30);
 ellipse(bluecircle, 200, 30, 30);
 ellipse(bluecircle, 250, 30, 30);
 ellipse(bluecircle, 300, 30, 30);
 ellipse(bluecircle, 350, 30, 30);
 ellipse(bluecircle, 400, 30, 30);
 ellipse(bluecircle, 450, 30, 30);
 ellipse(bluecircle, 500, 30, 30);
 ellipse(bluecircle, 550, 30, 30);
 ellipse(bluecircle, 600, 30, 30);
 ellipse(bluecircle, 650, 30, 30);
 ellipse(bluecircle, 700, 30, 30);
 
 bluecircle = bluecircle - 10;
 
 if(bluecircle < 0){
   bluecircle = 1000;
   }
 
 //if(greencircle = 250){
   //fill(0, 255, 0);
// ellipse(greencircle, 350, 30, 30);
// ellipse(greencircle, 300, 30, 30);
// ellipse(greencircle, 400, 30, 30);
 //ellipse(greencircle, 250, 30, 30);
 //ellipse(greencircle, 450, 30, 30);
 //ellipse(greencircle, 200, 30, 30);
// ellipse(greencircle, 500, 30, 30);
 //ellipse(greencircle, 550, 30, 30);
 //ellipse(greencircle, 150, 30, 30);
// ellipse(greencircle, 100, 30, 30);
 //ellipse(greencircle, 600, 30, 30);
 //ellipse(greencircle, 650, 30, 30);
// ellipse(greencircle, 50, 30, 30);
 //ellipse(greencircle, 0, 30, 30);
 //ellipse(greencircle, 700, 30, 30);
 
 
   
 
 //}
}

