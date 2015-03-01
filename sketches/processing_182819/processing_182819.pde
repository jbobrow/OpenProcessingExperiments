
//If you want an image in javascript use @pjs preload=”myTriangle.jpg”;
//PImage tri;
void setup() {
  
  size (640, 410) ;
// tri= loadImage (“myTriangle.jpeg”);

  
}
void draw() {
  background (120);
  size (640, 410) ;
   fill(255);
   text(mouseX + "," + mouseY, 15, 320);

  fill( #FF0808 );
  for (int i = 0 ; i < 10; i++) {
  for (int j = 0 ; j < 10; j++) {
  println(i);
  
// hat
    fill(#2816F7);
    //quad(223, 320, 376, 320, 337, 380, 266, 380);
    quad(223,53,376,53,337,3,266,3);
// Right Wing
    fill(180);
    triangle(55,163, 46,235, 17,217);
    fill(150);
    triangle(17,217, 46,235, 30, 274);
    fill (120);
    triangle(46,235, 30, 274, 67,288);
  
// Left Wing
    fill(180);
    triangle(539,163,568, 235, 600,217);
    fill(150);
    triangle(600,217,568,235,595, 274);
    fill(120);
    triangle(568,235,595,274, 548,288);
  
// Background Triangles
    fill(#FF0000);
    triangle(80*i, 50*j, 20, 30, 20, 20) ;
  
//Ears
    fill(#00A51C);
    triangle(146, 67, 170, 5, 200, 67);
    fill(#00A51C);
    triangle(390,67, 414,5, 444,67);
   
// Face
    fill (#050505);
    ellipse(300, 180, 500, 300);
  
//Eyes 
    fill (#7E7FB7);
    ellipse(190, 110, 90, 90);
    //rect ( 130, 60, 100, 50);
    fill (#7E7FB7);
    ellipse(400, 110, 90, 90);
    //rect ( 430, 60, 100, 100);
    //fill (#FA0A0A) ;
    //rect (130, 250, 400, 5);
 
// White of mouth
    fill (255);
    arc(300, 180, 253, 280,  0, PI);

// Mouth curve
    fill (10);
    arc(299, 175, 253, 40,  0, PI);
  
// Left Center Eye
    fill(0);
    ellipse(190,110,43,43);
    fill(255);
    ellipse(190,110,34,34);
    fill(0);
    ellipse(190,110,25,25);
    fill(255);
    ellipse(190,110,20,20);
    fill(0);
    ellipse(190,110,15,15);
    
// Right Center Eye
    fill(0);
    ellipse(400,110,43,43);
    fill(255);
    ellipse(400,110,34,34);
    fill(0);
    ellipse(400,110,25,25);
    fill(255);
    ellipse(400,110,20,20);
    fill(0);
    ellipse(400,110,15,15);

// Tongue
    fill(#D37566);
    smooth();
    arc(300, 250, 100, 280,  0, PI);
   
// Tongue center
    fill(0);
    arc(300, 250, 6,100,0, PI);
    
// Left Arm Bottom
    ellipse(105,298, 30,30);
    ellipse(100,320, 30,30);
    line(100, 271, 83, 334);
    line(83,334, 135,356);
// Right Arm Bottom
    ellipse(501,298,30,30);
    ellipse(506,320,30,30);
    line(503,271,524,334);
    line(524,334,472,356);

// legs
    fill(0);
    line(237,324,237,367);
    line( 366,324, 366, 367);
// Right Shoe  
    fill(255);
    rect(341, 357, 25, 10, 2);
    ellipse(344,359,20,15);

// Left Shoe
    fill(255);
    rect(212,357, 25, 10,2);
    ellipse(215,359, 20,15);
    
}
  }
    }



