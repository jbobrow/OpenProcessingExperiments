
int n=18; //wheels
int yn=333; //neck lines Y
float easing = 0.02*40;


void setup() {
  size(400, 600);

  //background(255);
  smooth();
}


void draw() {

  background(255);
  float x0 = width/2;

  int targetX = mouseX;
  x0 += (targetX - x0) * easing;

  //--------------STATIC--------------------------

  //body
  fill(0);
  rect(x0-65, 375, 130, 160);
  strokeWeight(7);
  stroke(255);
  line(x0+57, 370, x0-70, 535);
  line(x0+70, 370, x0-58, 539);
  noFill();
  stroke(0);

  //wheels
  fill(0);
  ellipse(x0-60, 565, n, n);
  ellipse(x0-30, 565, n, n);
  ellipse(x0+60, 565, n, n);
  ellipse(x0+30, 565, n, n);
  //noFill();


  //---------------MOVING--------------------------

  //neck
  int neck = int(map(mouseY, 0, -height, 0, 15));
  int eye = int(map(mouseX, 0, width, 0, 15));

  strokeWeight(8);
  int a = 27;
  line(x0-15, yn-a-neck, x0+15, yn-a-neck);
  line(x0-15, yn, x0+15, yn);
  line(x0-15, yn+a+neck, x0+15, yn+a+neck);

  //head
  strokeWeight(4);
  line(x0, 85-neck, x0, 152-neck);
  triangle(x0, 152-neck, x0+55, 290-neck, x0-55, 290-neck);


 


  //eye
  noStroke();
  fill(255);
  ellipse(x0, 245-neck, 45, 30+(eye));
 // fill(0);
 
 //eye color condition
   float d = dist(mouseX, mouseY, x0, 245-neck);
  if (d < eye) {
      fill(int(random(255)),int(random(255)),int(random(255)));
  } 
  else {
    fill(0);
  }
  ellipse(x0, 245-neck, 15+eye, 15+eye);
  noFill();


  //hands
  fill(0);
  ellipse (x0-90, 390, 30, 30);  //left
  ellipse (x0+90, 390, 30, 30); //right
  noFill();
  strokeWeight(7);
  stroke(0);
  //line(x0+90, 425, x0+90, 500);
  //rotate(PI/12);
  //translate(110,390);
  
  
   float Rotat_number=0.25;  // Number of rotations per mouseX/width
   float angle = (map(-mouseX, 0, width, 0, Rotat_number*6.28));
   float X_arm1, Y_arm1;
   int Len1=110;      // Len of the arm
   int arm_radius1= 35;  // radius of the arm beginning
   
   X_arm1=Len1 * cos(angle);
   Y_arm1=Len1 * sin(angle); 
   
    line(arm_radius1 * cos(angle)+x0-90, arm_radius1 * sin(angle)+390, (X_arm1+x0-90), (Y_arm1+390));
  
  
  
  //line(x0-90, 425, x0-90, 500);
  
  
  
  
  //hand rotation
  //float Rotat_number=0.25;  // Number of rotations per mouseX/width
   float angle1 = (map(mouseX, 0, width, 0, Rotat_number*6.28));
   float X_arm, Y_arm;
   int Len=110;      // Len of the arm
   int arm_radius=35;  // radius of the arm beginning
   
   X_arm=Len * cos(angle1);
   Y_arm=Len * sin(angle1); 
   
    line(arm_radius * cos(angle1)+x0+90, arm_radius * sin(angle1)+390, X_arm+x0+90, Y_arm+390);
   

}

