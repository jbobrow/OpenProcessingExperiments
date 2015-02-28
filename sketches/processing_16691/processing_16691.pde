
/**
 * Recursive Tree
 * by Argu Sagturk based on Daniel Shifmans Recursive Tree. 
 *
 * Renders a simple tree-like structure via recursion.
 * The branching angle is calculated as a fixed x location.
 This is a tree with green leaves.
 */
 
float theta;  
float theta1; 
float theta2;  
void setup() {
  size(800, 600);
  smooth();
}
void draw() {
  background(0);
  frameRate(30);
  stroke(118,84,39);
  
  float z = (55 / (float) width) * 90f;
  float z1 = (120 / (float) width) * 70f;
  float z2 = (77 / (float) width) * 210f;
  // Convert it to radians
  theta = radians(z);
  theta1 = radians(z1);
  theta2 = radians(z2);
  // Start the tree from the bottom of the screen
  translate(width/2,height);
  // Draw a line 120 pixels
  line(0,0,0,-120);
  int ytr1=0;
  {
    int xtr1=0;
 
    for (float h=40; h>1; h=h-.08) {
 
      ytr1=ytr1-1;
      if(h>=5);
      {
        ellipse (xtr1,ytr1,h,h);
        float rtr= random(103);
        float gtr= random(62);
        float btr= random(8);
        float atr= random(50);
        fill(rtr,gtr,btr,atr);
        stroke(rtr,gtr,btr,atr);
      }
    }
  }
  stroke(118,84,39);
  float r= random(12);
  float g= random(255);
  float b= random(55);
  float a= random(155);
  stroke(r,g,b);
  fill(r,g,b,a);
  ellipse(0,0,z/4,z/5);
  float r1= random(12);
  float g1= random(255);
  float b1= random(255);
  float a1= random(155);
  fill(r1,g1,b1,a1);
  ellipse(0,-120,z/6,z/7);
  // Move to the end of that line
  translate(0,-120);
 
  // Start the recursive branching!
  branch(40);
  branch(180);
  branch(60);
  branch(200);
  branch(80);
  branch(140);
  branch(100);
  branch(120);
  if(keyPressed)
    if (key == 'b' || key == 'B')
      saveFrame("besttree8-800-600--####.tiff");
}
void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.68;
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);
    stroke(118,84,39);  // Draw the branch
    int ytr1=0;
    {//interesting
      int xtr1=0;
      noStroke();
      fill(12,255-(random(20)),25+(random(50)),105);
      ellipse(xtr1,-80-(random(10)),3,3);//random distribution of green ends
       fill(120+(random(50)),255-(random(20)),25+(random(50)),105); 
   ellipse(xtr1-(random(10)),-80-(random(20)),3,3);
   //fill(220+(random(50)),55-(random(20)),15+(random(200)),105); 
   fill(240,28+(random(140)),174+(random(34)),random(100,255));
   ellipse(xtr1-(random(20)),-80-(random(30)),3,3);
      for (float ht1=8; ht1>1; ht1=ht1-.08) {
        ytr1=ytr1-1;
        if(h>=5);
        {
          noStroke();
          // if (h<=1){
          // ellipse(0,-255,10,10);
          // fill(255,0,25,255);
          //  }
          ellipse (xtr1,ytr1,ht1,ht1);
          float rx1= random(12);
          float gx1= random(255);
          float bx1= random(255);
          float ax1= random(40);
          fill(rx1,gx1,bx1,ax1);
          stroke(rx1,gx1,bx1,ax1);
        }
      }
    } //interesting
    rotate(theta1);
    //fill(255,0,25,255);
    //ellipse(0,-h,10,10);//redcircles atthebeginning of branches
 
    line(0, 0, 0, -h);
 
    stroke(118,84,39);
    rotate(theta2);
    line(0, 0, 0, -h);
    stroke(118,84,39);
    int ytr3=0;
    {//interesting
      int xtr3=0;
    }
    float z =random(40);
    float r2= random(255);
    float g2= random(255);
    float b2= random(55);
    float a2= random(155);
    fill(r2,g2,b2,a2);
    stroke(r2,g2,b2);
    ellipse(0,0,z/4,z/6);
    float r3= random(255);
    float g3= random(255);
    float b3= random(55);
    float a3= random(155);
    fill(r3,g3,b3,a3);
    ellipse(0,-h,z/3,z/6);
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);//+(random(-10,10)));
    //fill(255,0,25,255);
    //ellipse(0,-h,10,10);
    stroke(118,84,39);
    rotate(-theta1);
    line(0, 0, 0, -h);
    stroke(118,84,39);
    rotate(-theta2);
    line(0, 0, 0, -h);
    //fill(255,0,25,255);
    //ellipse(0,-h,10,10);
    stroke(118,84,39);
    float r4= random(12);
    float g4= random(255);
    float b4= random(100);
    float a4= random(155);
    fill(r4,g4,b4,a4);
    stroke(r4,g4,b4);
    ellipse(0,0,z/6,z/3);
    float r5= random(12);
    float g5= random(255);
    float b5= random(25);
    float a5= random(155);
    fill(r5,g5,b5,a5);
    stroke(r5,g5,b5);
    ellipse(0,-h,z/7,z/4);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}

