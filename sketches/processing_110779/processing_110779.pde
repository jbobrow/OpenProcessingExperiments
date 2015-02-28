
/* @pjs preload="Untitled-1.png"; 
 */




void setup() {
  size(1366, 768, P3D);
  strokeWeight(3);
  noCursor();
  background(204);
  camera(0, 0, z, 0, 0, 0.0, 0.0, 1.0, 0.0);
}

float r=800;
float z;
int count;
int count2;

boolean level1=true;
boolean level2=false;
boolean level3=false;
boolean end=false;

float dx=1;
float dy=1;


void draw() {



  background(204);

  if (cos(dy)>0 ) {
    z= cos(dx)*r*cos(dy);
    camera(sin(dx)*r, sin(dy)*r, z, 0, 0, 0.0, 0.0, 1.0, 0.0);
  }
  else if (cos(dy)<=0 )
  {
    z=cos(dx)*r*cos(dy);
    camera(sin(dx)*r, sin(dy)*r, z, 0, 0, 0.0, 0.0, 1.0, 0.0);
  }

  //camera(sin(0)*r ,sin(0)*r,r, 0,0, 0.0, 0.0, 1.0, 0.0);
  //
  //point(mouseX-width/2,mouseY-height/2,z);

  if (level1==true) {

    pushMatrix();
    translate(-width/2, -height/2);
    //rotateX(-PI/6);
    //rotateY(PI/3);
    line(360, 206, 50, 411, 620, 168 );
    line(511, 533, 400, 792, 575, 287 );
    line(874, 719, -98, 853, 194, 0 );
    line(931, 110, -365, 246, 145, -216 );
    line(886, 738, -155, 844, 457, 300 );
    line(891, 479, 153, 952, 107, -37 );
    line(908, 155, 99, 850, 199, 11 );
    line(930, 133, 35, 451, 95, -80 );
    line(648, 340, 666, 335, 196, -8 );
    popMatrix();


    if (mouseX>=682 &&mouseX<=684 &&mouseY>=382 &&mouseY<=384) {
      count++;
    }
    else {
      count=0;
    }
    if (count>=142) {
      level2=true;
      level1=false;
    }
  }



  if (level2==true) {
    background(204);


    if (count>0) {
      count=count-4;
      textSize(332);
      fill(10);
      text("CHANGE", 10-width/2, 30);
    }
    else
    {
      pushMatrix();
      translate(-width/2, -height/2);
      //rotateX(-PI/6);
      //rotateY(PI/3);
      line(278.5, 229, 39, 185, 654, 72 );
      line(252, 569, 222, 260, 721, -111 );
      line(197, 760, -165, 341, 81, 123 );
      line(836, 359, 389, 207, 734, -250);
      line(235, 329, -18, 812, 295, -5 );
      line(1115, 69, 120, 686, 767, 275 );
      line(783, 750, 360, 174, 668, 46 );
      line(236, 736, -132, 888, 731, 454 );

      popMatrix();
      if (mouseX>=217 &&mouseX<=223 &&mouseY>=464 &&mouseY<=468) {
        count2++;
      }
      else {
        count2=0;
      }
      if (count2>=142) {
        level3=true;
        level2=false;
        dx=0;
        dy=0;
      }
    }
  }





  if (level3==true) {
    background(204);
    if (count2>0) {
      count2=count2-4;
      textSize(332);
      fill(10);
      dx=0;
      dy=0;
      text("YOUR", 10-width/2, 30);
    }
    else
    {
      pushMatrix();
      translate(-width/2, -height/2);
      //rotateX(-PI/6);
      //rotateY(PI/3);
      line(1276, 711, 500, 1185, 520, 576 );
      line(1275, 389, 111, 1325, 756, 497 );
      line(1337, 427, 80, 699, 379, 421);
      line(940, 759, 304, 1009, 753, -202);
      line(572, 740, 131, 772, 422, 96);
      line(443, 52, -3, 533, 549, 228 );
      line(440, 44, 28, 94, 554, -28);
      line(61, 632, -100, 15, 375, 48 );
      line(14, 430, 11, 450, 74, -69 );
      line(988, 727, -174, 586, 763, -36);
      line(957, 745, 121, 1301, 413, 99);

      popMatrix();
      if (mouseX>=598 &&mouseX<=602 &&mouseY>=298 &&mouseY<=302) {
        count++;
      }
      else {
        count=0;
      }
      if (count>=142) {

        level3=false;
        end=true;
  
      }
    }
  }

  if (end==true) {
    background(204);
    if (count>0) {
      dx=0;
        dy=0;
      count=count-1;
PImage img;
img = loadImage("Untitled-1.png");
image(img, -width/2,-height/2);
    }
  }




//  println(z);
//  println(mouseX);
//  println(mouseY);
}


void mouseMoved() {
  dx=(mouseX-width/2)*2*PI/width;
  dy=( mouseY-height/2)*2*PI/height;
}


//void keyPressed(){
//  
//  if (key=='w'){
//  z++;}
//  
//  else if (key=='s'){
//    z--;
//  }
//}



