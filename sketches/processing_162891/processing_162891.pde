

//Arthur Luo//
//Inspired by SuperGiant inc. game <Transistor> character --Red. //
//Size of the sketch is 610*576//

PImage transistor_red, cloudbank, close_eye; 
int x = 0;

void setup()
{
  //Red herself.
  size( 610, 576);
  transistor_red = loadImage("red.jpg");
  cloudbank = loadImage("cloudbank.png");
  close_eye = loadImage("red_close_eye.jpg");
}
  
  //Cloudbank as transparant background.
void draw()
{
  image ( close_eye, 0, 0);
  noStroke ();
  image (cloudbank, 0, 105);
  color right = color(45, 224, 160);
  fill ( right, 70);
  rect ( 312, 0, 298, 576); //the middle is actually 312*0 instead of 305 that is supposed to be.
  
  //Sword.
  
  /*handle*/
    beginShape();
    fill(211, 133, 15);
    vertex( 312, x+0);  //Horizontally to the right
    vertex( 322, x+0);
    vertex( 322, x+13); //Vertically goes down
    vertex( 327, x+13);
    vertex( 327, x+18); //Little handle, goes to the right
    vertex( 327, x+25);
    vertex( 312, x+25);
    endShape(CLOSE);
  
  /*bottome part of handle*/
    beginShape();
    fill( 50, 59, 59);
    vertex( 312, x+25);
    vertex( 319.5, x+25);
    vertex( 319.5, x+80);
    vertex( 312, x+80);
    endShape(CLOSE);
  
  /*screw of the handle*/
    fill( 77, 42, 34);
    beginShape();
    vertex( 312, x+80);
    vertex( 321, x+80);
    vertex( 321, x+85);
    vertex( 312, x+85);
    endShape(CLOSE);
  
  /*triangle thingy*/
    triangle(312, x+85, 375, x+85, 312, x+136.8);

  /*its edge*/
    fill( 45, 224, 160);
    beginShape();
    vertex( 363.8, x+94);
    vertex( 345.3, x+403.2);
    vertex( 312, x+414.3);
    vertex( 312, x+136.8);
    endShape(CLOSE);
    
  /*transistor*/    
    fill( 228, 177, 85);
    beginShape();
    vertex( 352.7, x+303.3);
    vertex( 363.8, x+312.6);
    vertex( 352.5, x+394);
    vertex( 345.3, x+403.2);
    endShape(CLOSE);
  
  /*transistor 2*/  
    fill( 228, 177, 85);
    triangle( 363.8, x+314.4, 371.2, x+331.1, 354, x+390);
    
  /*right rect*/
    fill(136,230,207);
    rect(329, x+203.4, 10, 110);    
   
  /*middle rect*/    
    fill(136,230,207);
    rect(312, x+203.4, 10, 150);
    
  /*HIM_base*/    
    fill( 17, 167, 113);
    arc( 312, x+203.4, 90, 90, TWO_PI-PI/2, TWO_PI);
    arc( 312, x+203.4, 90, 90, 0, PI/2);
    
  /*the line in between HIM base*/
    fill( 17, 167, 113);
    rect(312, x+202.4,45,2);
  
  /*the line in between HIM*/
    fill( 224, 20, 63);
    rect(312, x+202.4,33,2);

  /*HIM_red*/    
    fill( 224, 20, 63);
    arc( 312, x+203.4, 66.5, 66.5, TWO_PI-PI/2, TWO_PI);
    arc( 312, x+203.4, 66.5, 66.5, 0, PI/2);
  
  /*middle rect circile_base*/    
    fill(136,230,207);
    arc( 312, x+360, 35, 35, TWO_PI-PI/2, TWO_PI);
    arc( 312, x+360, 35, 35, 0, PI/2);

  /*middle rect circle_top*/    
    fill( 45, 224, 160);
    arc( 312, x+360, 26, 26, TWO_PI-PI/2, TWO_PI);
    arc( 312, x+360, 26, 26, 0, PI/2);
 
  /*right circle*/    
    fill( 136, 230, 207);
    ellipse( 334.7, x+315, 20.5, 20.5);  
    fill( 45, 224, 160);
    ellipse( 334.7, x+315, 14.2, 14.2);
  
  /*transistor bottom middle*/
    fill( 249, 193, 84);
    rect( 312, x+390, 9, 25);
  
  /*transistor bottom right*/
    fill( 249, 193, 84);
    rect( 328, x+385, 9, 25);
    
  /*HIM_red_eye*/
    fill(  126, 11, 36);
    arc( 312, x+203.4, 45, 45, TWO_PI-PI/2, TWO_PI);
    arc( 312, x+203.4, 45, 45, 0, PI/2);

  /*Move the sword down and make Red open eyes*/
  if (x>170){
    x = x;
    image ( transistor_red, 0, 0);
 } 
    else{
    x = x+0.7;
    }

}




