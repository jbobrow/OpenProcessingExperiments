
int xSpeed;
int x1Speed;
int x = (width/2)-10;
int x1 = (width/2)-20;
int value = 255;

void setup() {
  
   size (1200, 600);
   background (0, 3, 35);
   xSpeed = 2;
   x1Speed = 1;

}



void draw()
{
  size (width, height);
  background (0, 3, 35);
  
  //head
fill(255);
strokeWeight(6);
stroke(221, 210, 83);
ellipse((width/2)+90, (height/2)-38, 100, 85);
stroke(130);
rect((width/2)+51, (height/2)-62, 75, 65, 40);
fill (value);
pushMatrix();
noStroke();
ellipse ((width/2)+102, (height/2)-42, 6, 6);
ellipse ((width/2)+77, (height/2)-43, 6, 6);
popMatrix();
strokeWeight(3);
stroke(130);
noFill();
arc((width/2)+65, (height/2)-58, 35, 35, 0, HALF_PI);
arc((width/2)+90, (height/2)-57, 35, 35, 0, HALF_PI);
line((width/2)+85, (height/2)-10, (width/2)+90, (height/2)-10);


//tentacle1
pushMatrix();
fill(255);
strokeWeight(4);
stroke(223, 213, 99);
translate((width/2)+142, (height/2)-80);
rotate(radians(10));
ellipse(0, 0, 50, 43);
popMatrix();

pushMatrix();
fill(253);
strokeWeight(3);
stroke(223, 213, 114);
translate((width/2)+160, (height/2)-115);
rotate(radians(8));
ellipse(0, 0, 40, 35);
popMatrix();

pushMatrix();
fill(253);
strokeWeight(2.5);
stroke(223, 213, 114);
translate((width/2)+158, (height/2)-140);
rotate(radians(-10));
ellipse(0, 0, 30, 20);
popMatrix();

pushMatrix();
fill(253);
strokeWeight(2);
stroke(223, 213, 150);
translate((width/2)+147, (height/2)-153);
rotate(radians(-15));
ellipse(0, 0, 20, 10);
popMatrix();


//tentacle2
pushMatrix();
fill(255);
strokeWeight(4.5);
stroke(221, 210, 80);
translate((width/2)+60, (height/2)+27);
rotate(radians(-20));
rotate(0.4);
ellipse(0, 0, 65, 55);
popMatrix();

pushMatrix();
fill(253);
strokeWeight(4);
stroke(223, 213, 70);
translate((width/2)+42, (height/2)+74);
rotate(radians(-10));
ellipse(0, 0, 55, 46);
popMatrix();

pushMatrix();
fill(253);
strokeWeight(3.5);
stroke(223, 213, 60);
translate((width/2)+15, (height/2)+113);
rotate(radians(-2));
ellipse(0, 0, 50, 42);
popMatrix();

pushMatrix();
fill(253);
strokeWeight(3);
stroke(223, 213, 50);
translate((width/2)-20, (height/2)+130);
rotate(radians(-2));
ellipse(0, 0, 30, 25);
popMatrix();


//tentacle3
pushMatrix();
fill(255);
strokeWeight(4.5);
stroke(221, 210, 80);
translate((width/2)+130, (height/2)+20);
rotate(radians(-2));
ellipse(0, 0, 65, 55);
popMatrix();

pushMatrix();
fill(253);
strokeWeight(4);
stroke(223, 213, 70);
translate((width/2)+145, (height/2)+68);
rotate(radians(-2));
ellipse(0, 0, 55, 46);
popMatrix();

pushMatrix();
fill(253);
strokeWeight(3.5);
stroke(223, 213, 60);
translate((width/2)+140, (height/2)+111);
rotate(radians(-6));
ellipse(0, 0, 50, 42);
popMatrix();

pushMatrix();
fill(253);
strokeWeight(3);
stroke(223, 213, 50);
translate((width/2)+130, (height/2)+145);
rotate(radians(-6));
ellipse(0, 0, 30, 25);
popMatrix();

//tentacle4
pushMatrix();
fill(255);
strokeWeight(4);
stroke(221, 210, 82);
translate((width/2)+170, (height/2)-30);
rotate(radians(-2));
ellipse(0, 0, 65, 55);
popMatrix();


pushMatrix();
fill(253);
strokeWeight(3.5);
stroke(223, 213, 72);
translate((width/2)+223, (height/2)-10);
rotate(radians(4));
ellipse(0, 0, 55, 46);
popMatrix();

pushMatrix();
fill(253);
strokeWeight(3.5);
stroke(223, 213, 60);
translate((width/2)+243, (height/2)+30);
rotate(radians(4));
ellipse(0, 0, 50, 42);
popMatrix();

pushMatrix();
fill(253);
strokeWeight(3);
stroke(223, 213, 50);
translate((width/2)+223, (height/2)+60);
rotate(radians(4));
ellipse(0, 0, 30, 25);
popMatrix();

//tentacle5
pushMatrix();
fill(255);
strokeWeight(4);
stroke(223, 213, 99);
translate((width/2)+73, (height/2)-100);
rotate(radians(-4));
ellipse(0, 0, 50, 43);
popMatrix();

pushMatrix();
fill(253);
strokeWeight(3);
stroke(223, 213, 114);
translate((width/2)+60, (height/2)-135);
rotate(radians(-6));
ellipse(0, 0, 40, 35);
popMatrix();

pushMatrix();
fill(253);
strokeWeight(2);
stroke(223, 213, 114);
translate((width/2)+75, (height/2)-157);
rotate(radians(10));
ellipse(0, 0, 30, 20);
popMatrix();

pushMatrix();
fill(253);
strokeWeight(2);
stroke(223, 213, 150);
translate((width/2)+92, (height/2)-166);
rotate(radians(12));
ellipse(0, 0, 20, 10);
popMatrix();

//tentacle6
pushMatrix();
fill(255);
strokeWeight(4);
stroke(221, 210, 82);
translate((width/2)+10, (height/2)-50);
rotate(radians(5));
ellipse(0, 0, 65, 50);
popMatrix();

pushMatrix();
fill(253);
strokeWeight(3);
translate((width/2)-33, (height/2)-80);
rotate(radians(5));
ellipse(0, 0, 55, 40);
popMatrix();

x1+=x1Speed;
pushMatrix();
fill(253);
strokeWeight(2.5);
stroke(223, 213, 60);
translate(x1, (height/2)-118);
rotate(radians(5));
ellipse(0, 0, 50, 35);
popMatrix();

if (x1>=(width/2)-15) {
    x1Speed*=-1;
    x1=(width/2)-15-1;
  }else{
  
    //Do  this
  
  }

  if (x1<=(width/2)-35) {
    x1Speed*=-1;
    x1=(width/2)-35+1;
  }
  
  
x+=xSpeed;
pushMatrix();
fill(253);
strokeWeight(2.5);
stroke(223, 213, 50);
translate(x, (height/2)-144);
rotate(radians(5));
ellipse(0, 0, 30, 20);
popMatrix();

  if (x>=(width/2)-10) {
    xSpeed*=-1;
    x=(width/2)-10-1;
  }else{
  
    //Do  this
  
  }

  if (x<=(width/2)-40) {
    xSpeed*=-1;
    x=(width/2)-40-1;
  }
}
  
void mousePressed() {
  if (value == 255) {
    value = 0;
  } else {
    value = 255;
  }
  
  }



