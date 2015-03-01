
/* 
Electronic Quilt Sketch
7/11/14
*/


//100x100 square to be repeated
int patternWidth = 100;
int patternHeight = 100;
 
void setup(){
  size(500,500);
  smooth(10);
  background(#826B98);
  
// repeating the 100x100 rosePattern
  for(int x = 0; x < width/patternWidth; x++){
      for(int y = 0; y < height/patternHeight; y++){      
        pushMatrix();
        translate(x*patternWidth, y*patternHeight);
        rosePattern();
        popMatrix();
      }
  }
   
}
 
// continuously running code 
void draw()
{

}
// 100x100 square rosePattern  
void rosePattern(){
 
//background lines
  strokeWeight(10);
  stroke(#ACBEED,50);
  line(0,0,100,100);
  line(0,100,100,0);
  strokeWeight(2);
  line(50,0,0,50);
  line(50,100,100,50);
  line(50,0,100,50);
  line(0,50,50,100);
  line(45,0,100,55);
  line(0,55,45,100);
  line(45,0,0,45);
  line(100,45,45,100);
  
//VINES
strokeWeight(10);
noFill();
stroke(#5D9B51);
  ellipse(50,50,100,100);
stroke(#ABE38C); 
strokeWeight(2);
stroke(#2F6A16,50);
  arc(50, 50, 100,100, HALF_PI, PI+(QUARTER_PI/3));
  arc(50,50,100,100,TWO_PI-PI/2,TWO_PI);

//little flowers
strokeWeight(5);
stroke(#ED81B7);
  point(10,30);
  point(30,10);
  point(65,5);
  point(80,20);
  point(90,25);
  point(95,60);
  point(80,95);
  point(40,98);
  point(20,95);
  point(10,80);
  point(5,65);
  point(50,0);
  
//leaves
ellipseMode(CENTER);
fill(#6eaa63);
noStroke();

  pushMatrix();    // lighter leaves
    translate(-5,40);
    rotate(radians(51));
       ellipse(0,0,20,10);
  popMatrix();

  pushMatrix();
    translate(35,5);
    rotate(-radians(45));
      ellipse(0,0,20,10);
  popMatrix();

  pushMatrix();
    translate(70,15);
     rotate(radians(180));
       ellipse(0,0,20,10);
   popMatrix();

  pushMatrix();
    translate(20,80);
    rotate(radians(100));
      ellipse(0,0,20,10);
  popMatrix();

fill(#4a873d);  // darker leaves
  pushMatrix();
    translate(55,90);
    rotate(radians(75));
       ellipse(0,0,20,10);
  popMatrix();

  pushMatrix();
    translate(90,90);
     rotate(radians(170));
       ellipse(0,0,20,10);
   popMatrix();

  pushMatrix();
    translate(10,10);
     rotate(radians(70));
       ellipse(0,0,20,10);
  popMatrix();

//FLOWERS
noStroke();
ellipseMode(CENTER);
//1st two
fill(#BC427F); 
strokeWeight(.5);
stroke(#A01F5F);
    ellipse(45,43,15,25); // left
    ellipse(55,43,15,25); // right
noStroke();
//2nd
  fill(#D14A8D);
    ellipse(50,50,25,25);
//3rd two 
fill(#A03068);
strokeWeight(.5);
stroke(#A01F5F);
  rotate(radians(45));
    ellipse(60,5,30,15); // left
  rotate(-radians(45));
  rotate(-radians(45));
    ellipse(10,76,30,15); // right
    rotate(radians(45));
//4th two
fill(#761043);
  rotate(radians(12));
    ellipse(50,40,30,15); // left
  rotate(-radians(12));
  rotate(-radians(12));
    ellipse(50,62,30,15); // right
  rotate(radians(12));
noStroke();
//front two
fill(#5F0D36); 
    ellipse(45,57,40,15); // left
    ellipse(55,57,40,15); // right  
  
}


