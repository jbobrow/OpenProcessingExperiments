
int numFrames = 5;
int frame = 0;
float inc=0.0;
PImage willow;
PImage limb;
PImage rbranch;
PImage top;

void setup() {
  size(700, 600);
  smooth();
  willow = loadImage("willow.jpg");
  limb = loadImage("limb.png");
 rbranch= loadImage("rbranch.png");
 top= loadImage("top.png");
 
 
}


void draw() {
  
  
  //background(60,233,255);
  image(willow,0,0);
  image(top,10,-20);
  frameRate(15);
  noStroke();
  smooth(); 
  
  float angle=.8*cos(inc)/10+sin(inc*1.2)/30.0;
  float angle2=.7*sin(inc)/10;
  float angle3=.8*cos(inc)/10+sin(inc*1.2)/30.0;
  
  stroke(2,23,121,200);
  strokeWeight(80);
  line(250,560,400,350);
  line(260,550,180,630);
  line(290,530,325,600);
  line(250,560,400,350);
  stroke(2,23,121);
  strokeWeight(22);
  line(220,555,240,510);
  line(240,510,260,480);
  line(260,480,270,450);
  line(270,450,280,430);
  line(280,430,300,410);
  line(300,410,310,400);
  line(320,510,350,600);
  line(330,500,325,600);
  line(310,400,370,330);
  line(340,360,350,330);
  line(350,330,360,310);
  line(360,310,400,260);
  strokeWeight(32);
  line(395,260,370,200);
  line(380,280,350,200);
  line(380,320,370,240);
  line(395,250,450,290);
  line(395,287,430,320);
  strokeWeight(46);
  line(357,200,355,130);
  
 
  //overall rotation and translation
   rotate(angle/3);
  translate(0,50);
  
  
  //branch off top limb
  
  
  translate(0,-30);
  rotate(-angle/2);
  strokeWeight(32);
  line(360,200,380,190);
  line(380,190,400,175);
  line(400,175,420,155);
  translate(0,30);
  
  translate(500,-200);
  rotate(PI/3-.2);
  stroke(12,100,173);
 // rotate(5+PI/3);
  branch(179,29,-angle3);
  branch2(181,42,angle/1);
  stroke(0,55,143);
  //rotate(2*PI);
  branch(179,19,angle2/1.2);
  branch2(185,26,-angle3*1.2);
 // rotate(5.4+PI/4);
  stroke(4,23,131);
  //rotate(3.3+PI);
  translate(-20,-20);
  branch(195,40,angle2/2);
  branch2(210,33,-angle3/2);
  branch(222,14,angle*1.2);
  translate(20,20);
  
  stroke(12,100,173);
  rotate(2*PI);
  branch(179,29,-angle2/1.2);
  branch2(181,42,angle2/1.7);
  rotate(-2*PI);
  rotate(5.4+PI/4);
  stroke(40,75,183);
  branch(164,43,-angle/2.5);
  branch2(175,25,angle2*1.3);
  rotate(-5.4-PI/4);
  stroke(24,23,131);
  //rotate(PI/6);
 // translate(110,-110);
  branch(195,40,-angle2/2.7);
  branch2(190,33,-angle/2);
  //rotate(-PI/6);
  //rotate(-PI/3);
 // translate(-360,0);
  branch(182,14,angle2*1.6);
   stroke(10,55,143);
  // translate(20,0);
 // rotate(2*PI);
  branch(179,19,-angle/1.2);
  branch2(195,26,angle*1.2);
 
 rotate(-PI/3+.2);
  translate(-500,200);
  rotate(angle/2);

  //right branch
  stroke(2,23,121);
  translate(0,-60);
  rotate(-angle3/1.5);
  image(rbranch,0,-110);
  strokeWeight(32);
  line(450,290,480,275);
  line(480,275,500,250);
  line(475,280,510,300);
  line(510,300,550,310);
  line(510,300,400,290);
  line(480,300,400,320);
  line(420,340,433,320);
  
  translate(0,60);
 
 
  
 
 
  rotate(PI/3-.5);
  translate(340,-420);
  stroke(12,100,173);
 // rotate(5+PI/3);
  branch(179,29,-angle2/1.2);
  branch2(181,42,angle/1.7);
  stroke(0,55,143);
  //rotate(2*PI);
  branch(179,19,angle2/1.2);
  branch2(185,26,-angle*1.2);
 // rotate(5.4+PI/4);
  stroke(40,75,183);
  branch(164,43,angle2/2.5);
  branch2(175,25,angle*1.3);
  stroke(4,23,131);
  //rotate(3.3+PI);
  translate(-20,-20);
  branch(195,40,angle2/2.7);
  branch2(210,33,-angle/2);
  branch(182,14,angle2*1.2);
  translate(20,20);
  
  stroke(12,100,173);
  rotate(2*PI);
  branch(179,29,-angle2/1.2);
  branch2(181,42,angle2/1.7);
  rotate(-2*PI);
  rotate(5.4+PI/4);
  stroke(40,75,183);
  branch(164,43,-angle/2.5);
  branch2(175,25,angle2*1.3);
  rotate(-5.4-PI/4);
  stroke(24,23,131);
  //rotate(PI/6);
 // translate(110,-110);
  branch(195,40,-angle2/2.7);
  branch2(190,33,-angle/2);
  //rotate(-PI/6);
  //rotate(-PI/3);
 // translate(-360,0);
  branch(182,14,angle2*1.6);
   stroke(10,55,143);
  // translate(20,0);
 // rotate(2*PI);
  branch(179,19,-angle/1.2);
  branch2(165,26,angle*1.2);
 translate(-340,420);
 rotate(-PI/3+.5);
 
 ////////////////////////
 
 
 
rotate(PI/2);
  translate(70,-840);
  stroke(12,100,173);
 // rotate(5+PI/3);
  branch(179,29,-angle2/1.2);
  branch2(181,42,angle/1.7);
  stroke(0,55,143);
  //rotate(2*PI);
  branch(179,19,angle2/1.2);
  branch2(185,26,-angle*1.2);
 // rotate(5.4+PI/4);
  stroke(40,75,183);
  branch(164,43,angle2/2.5);
  branch2(175,25,angle*1.3);
  stroke(4,23,131);
  //rotate(3.3+PI);
  translate(-20,-20);
  branch(195,40,angle2/2.7);
  branch2(210,33,-angle/2);
  branch(182,14,angle2*1.2);
  translate(20,20);
  
  stroke(12,100,173);
  rotate(2*PI);
  branch(179,29,-angle2/1.2);
  branch2(181,42,angle2/1.7);
  rotate(-2*PI);
  rotate(5.4+PI/4);
  stroke(40,75,183);
  branch(164,43,-angle/2.5);
  branch2(175,25,angle2*1.3);
  rotate(-5.4-PI/4);
  stroke(24,23,131);
  //rotate(PI/6);
 // translate(110,-110);
  branch(195,40,-angle2/2.7);
  branch2(190,33,-angle/2);
  //rotate(-PI/6);
  //rotate(-PI/3);
 // translate(-360,0);
  branch(182,14,angle2*1.6);
   stroke(10,55,143);
  // translate(20,0);
 // rotate(2*PI);
  branch(179,19,-angle/1.2);
  branch2(165,26,angle*1.2);
 translate(-70,840);
 rotate(-PI/2);
 
 /////////////////////
 
rotate(PI/3);
  translate(230,-640);
  stroke(12,100,173);
 // rotate(5+PI/3);
  branch(179,29,-angle2/1.2);
  branch2(181,42,angle/1.7);
  stroke(0,55,143);
  //rotate(2*PI);
  branch(179,19,angle2/1.2);
  branch2(185,26,-angle*1.2);
 // rotate(5.4+PI/4);
  stroke(40,75,183);
  branch(164,43,angle2/2.5);
  branch2(175,25,angle*1.3);
  stroke(4,23,131);
  //rotate(3.3+PI);
  translate(-20,-20);
  branch(195,40,angle2/2.7);
  branch2(210,33,-angle/2);
  branch(182,14,angle2*1.2);
  translate(20,20);
  
  stroke(12,100,173);
  rotate(2*PI);
  branch(179,29,-angle2/1.2);
  branch2(181,42,angle2/1.7);
  rotate(-2*PI);
  rotate(5.4+PI/4);
  stroke(40,75,183);
  branch(164,43,-angle/2.5);
  branch2(175,25,angle2*1.3);
  rotate(-5.4-PI/4);
  stroke(24,23,131);
  //rotate(PI/6);
 // translate(110,-110);
  branch(195,40,-angle2/2.7);
  branch2(190,33,-angle/2);
  //rotate(-PI/6);
  //rotate(-PI/3);
 // translate(-360,0);
  branch(182,14,angle2*1.6);
   stroke(10,55,143);
  // translate(20,0);
 // rotate(2*PI);
  branch(179,19,-angle/1.2);
  branch2(165,26,angle*1.2);
 translate(-230,640);
 rotate(-PI/3);
 rotate(angle3/1.5);
 
 
 rotate(angle/3);
   strokeWeight(22);//left branch
   stroke(2,23,121);
  image(limb,-7,-100);
  line(280,390,260,365);
  line(260,365,230,240);
  line(250,290,300,370);
  line(286,380,245,245);
  
  inc +=0.015;
  

  translate(5,40);
  stroke(12,100,173);
  rotate(5+PI/3);
  branch(179,29,-angle2/1.2);
  branch2(181,42,angle/1.7);
  stroke(0,55,143);
  rotate(2*PI);
  branch(179,19,angle2/1.2);
  branch2(185,26,-angle*1.2);
  rotate(5.4+PI/4);
  stroke(40,75,183);
  branch(164,43,angle2/2.5);
  branch2(175,25,angle*1.3);
  stroke(4,23,131);
  rotate(3.3+PI);
  branch(195,40,angle2/2.7);
  branch2(210,33,-angle/2);
  branch(182,14,angle2*1.2);
  
  stroke(12,100,173);
  rotate(6*PI/3);
  branch(179,29,-angle2/1.2);
  branch2(181,42,angle2/1.7);
  rotate(5.4+PI/4);
  stroke(40,75,183);
  branch(164,43,-angle/2.5);
  branch2(175,25,angle2*1.3);
  stroke(24,23,131);
  rotate(PI/6);
  translate(110,-110);
  branch(195,40,-angle2/2.7);
  branch2(190,33,-angle/2);
  rotate(-PI/3);
  translate(-360,0);
  branch(182,14,angle2*1.6);
   stroke(10,55,143);
   translate(20,0);
  rotate(2*PI);
  branch(179,19,-angle/1.2);
  branch2(165,26,angle*1.2);
  
    rotate(-angle/3);
  translate(0,-50);
  



   //end of left branch
   
   
   
          rotate(PI/3-.5);
          translate(280,-250);
          stroke(12,100,173);
         // rotate(5+PI/3);
          branch(179,29,-angle2/1.2);
          branch2(181,42,angle/1.7);
          stroke(0,55,143);
          //rotate(2*PI);
          branch(179,19,angle2/1.2);
          branch2(185,26,-angle*1.2);
         // rotate(5.4+PI/4);
          stroke(40,75,183);
          branch(164,43,angle2/2.5);
          branch2(175,25,angle*1.3);
          stroke(4,23,131);
          //rotate(3.3+PI);
          translate(-20,-20);
          branch(195,40,angle2/2.7);
          branch2(210,33,-angle/2);
          branch(182,14,angle2*1.2);
          translate(20,20);
          
          stroke(12,100,173);
          rotate(2*PI);
          branch(179,29,-angle2/1.2);
          branch2(181,42,angle2/1.7);
          rotate(-2*PI);
          rotate(5.4+PI/4);
          stroke(40,75,183);
          branch(164,43,-angle/2.5);
          branch2(175,25,angle2*1.3);
          rotate(-5.4-PI/4);
          stroke(24,23,131);
          //rotate(PI/6);
         // translate(110,-110);
          branch(195,40,-angle2/2.7);
          branch2(190,33,-angle/2);
          //rotate(-PI/6);
          //rotate(-PI/3);
         // translate(-360,0);
          branch(182,14,angle2*1.6);
           stroke(10,55,143);
          // translate(20,0);
         // rotate(2*PI);
          branch(179,19,-angle/1.2);
          branch2(165,26,angle*1.2);
         translate(-280,250);
         rotate(-PI/3+.5);
         
         ////////////////////////
         
         
         
       
          translate(150,-50);
          stroke(12,100,173);
         // rotate(5+PI/3);
          branch(179,29,-angle2/1.2);
          branch2(181,42,angle/1.7);
          stroke(0,55,143);
          //rotate(2*PI);
          branch(179,19,angle2/1.2);
          branch2(185,26,-angle*1.2);
         // rotate(5.4+PI/4);
          stroke(40,75,183);
          branch(164,43,angle2/2.5);
          branch2(175,25,angle*1.3);
          stroke(4,23,131);
          //rotate(3.3+PI);
          translate(-20,-20);
          branch(195,40,angle2/2.7);
          branch2(210,33,-angle/2);
          branch(182,14,angle2*1.2);
          translate(20,20);
          
          stroke(12,100,173);
          rotate(2*PI);
          branch(179,29,-angle2/1.2);
          branch2(181,42,angle2/1.7);
          rotate(-2*PI);
          rotate(5.4+PI/4);
          stroke(40,75,183);
          branch(164,43,-angle/2.5);
          branch2(175,25,angle2*1.3);
          rotate(-5.4-PI/4);
          stroke(24,23,131);
          //rotate(PI/6);
         // translate(110,-110);
          branch(195,40,-angle2/2.7);
          branch2(190,33,-angle/2);
          //rotate(-PI/6);
          //rotate(-PI/3);
         // translate(-360,0);
          branch(182,14,angle2*1.6);
           stroke(10,55,143);
          // translate(20,0);
         // rotate(2*PI);
          branch(179,19,-angle/1.2);
          branch2(165,26,angle*1.2);
         translate(-150,50);
         
         
         /////////////////////
         
        rotate(PI/3);
          translate(230,-450);
          stroke(12,100,173);
         // rotate(5+PI/3);
          branch(179,29,-angle2/1.2);
          branch2(181,42,angle/1.7);
          stroke(0,55,143);
          //rotate(2*PI);
          branch(179,19,angle2/1.2);
          branch2(185,26,-angle*1.2);
         // rotate(5.4+PI/4);
          stroke(40,75,183);
          branch(164,43,angle2/2.5);
          branch2(175,25,angle*1.3);
          stroke(4,23,131);
          //rotate(3.3+PI);
          translate(-20,-20);
          branch(195,40,angle2/2.7);
          branch2(210,33,-angle/2);
          branch(182,14,angle2*1.2);
          translate(20,20);
          
          stroke(12,100,173);
          rotate(2*PI);
          branch(179,29,-angle2/1.2);
          branch2(181,42,angle2/1.7);
          rotate(-2*PI);
          rotate(5.4+PI/4);
          stroke(40,75,183);
          branch(164,43,-angle/2.5);
          branch2(175,25,angle2*1.3);
          rotate(-5.4-PI/4);
          stroke(24,23,131);
          //rotate(PI/6);
         // translate(110,-110);
          branch(195,40,-angle2/2.7);
          branch2(190,33,-angle/2);
          //rotate(-PI/6);
          //rotate(-PI/3);
         // translate(-360,0);
          branch(182,14,angle2*1.6);
           stroke(10,55,143);
          // translate(20,0);
         // rotate(2*PI);
          branch(179,19,-angle/1.2);
          branch2(165,26,angle*1.2);
         translate(-230,450);
         rotate(-PI/3);
        
   
/////////////////**************??


   translate(80,30);
          rotate(PI/3-.5);
          translate(280,-250);
          stroke(12,100,173);
         // rotate(5+PI/3);
          branch(179,29,-angle2/1.2);
          branch2(181,42,angle/1.7);
          stroke(0,55,143);
          //rotate(2*PI);
          branch(179,19,angle2/1.2);
          branch2(185,26,-angle*1.2);
         // rotate(5.4+PI/4);
          stroke(40,75,183);
          branch(164,43,angle2/2.5);
          branch2(175,25,angle*1.3);
          stroke(4,23,131);
          //rotate(3.3+PI);
          translate(-20,-20);
          branch(195,40,angle2/2.7);
          branch2(210,33,-angle/2);
          branch(182,14,angle2*1.2);
          translate(20,20);
          
          stroke(12,100,173);
          rotate(2*PI);
          branch(179,29,-angle2/1.2);
          branch2(181,42,angle2/1.7);
          rotate(-2*PI);
          rotate(5.4+PI/4);
          stroke(40,75,183);
          branch(164,43,-angle/2.5);
          branch2(175,25,angle2*1.3);
          rotate(-5.4-PI/4);
          stroke(24,23,131);
          //rotate(PI/6);
         // translate(110,-110);
          branch(195,40,-angle2/2.7);
          branch2(190,33,-angle/2);
          //rotate(-PI/6);
          //rotate(-PI/3);
         // translate(-360,0);
          branch(182,14,angle2*1.6);
           stroke(10,55,143);
          // translate(20,0);
         // rotate(2*PI);
          branch(179,19,-angle/1.2);
          branch2(165,26,angle*1.2);
         translate(-280,250);
         rotate(-PI/3+.5);
         
         ////////////////////////
         
         
         
       
          translate(150,-50);
          stroke(12,100,173);
         // rotate(5+PI/3);
          branch(179,29,-angle2/1.2);
          branch2(181,42,angle/1.7);
          stroke(0,55,143);
          //rotate(2*PI);
          branch(179,19,angle2/1.2);
          branch2(185,26,-angle*1.2);
         // rotate(5.4+PI/4);
          stroke(40,75,183);
          branch(164,43,angle2/2.5);
          branch2(175,25,angle*1.3);
          stroke(4,23,131);
          //rotate(3.3+PI);
          translate(-20,-20);
          branch(195,40,angle2/2.7);
          branch2(210,33,-angle/2);
          branch(182,14,angle2*1.2);
          translate(20,20);
          
          stroke(12,100,173);
          rotate(2*PI);
          branch(179,29,-angle2/1.2);
          branch2(181,42,angle2/1.7);
          rotate(-2*PI);
          rotate(5.4+PI/4);
          stroke(40,75,183);
          branch(164,43,-angle/2.5);
          branch2(175,25,angle2*1.3);
          rotate(-5.4-PI/4);
          stroke(24,23,131);
          //rotate(PI/6);
         // translate(110,-110);
          branch(195,40,-angle2/2.7);
          branch2(190,33,-angle/2);
          //rotate(-PI/6);
          //rotate(-PI/3);
         // translate(-360,0);
          branch(182,14,angle2*1.6);
           stroke(10,55,143);
          // translate(20,0);
         // rotate(2*PI);
          branch(179,19,-angle/1.2);
          branch2(165,26,angle*1.2);
         translate(-150,50);
         
         
         /////////////////////
         
        rotate(PI/3);
          translate(230,-450);
          stroke(12,100,173);
         // rotate(5+PI/3);
          branch(179,29,-angle2/1.2);
          branch2(181,42,angle/1.7);
          stroke(0,55,143);
          //rotate(2*PI);
          branch(179,19,angle2/1.2);
          branch2(185,26,-angle*1.2);
         // rotate(5.4+PI/4);
          stroke(40,75,183);
          branch(164,43,angle2/2.5);
          branch2(175,25,angle*1.3);
          stroke(4,23,131);
          //rotate(3.3+PI);
          translate(-20,-20);
          branch(195,40,angle2/2.7);
          branch2(210,33,-angle/2);
          branch(182,14,angle2*1.2);
          translate(20,20);
          
          stroke(12,100,173);
          rotate(2*PI);
          branch(179,29,-angle2/1.2);
          branch2(181,42,angle2/1.7);
          rotate(-2*PI);
          rotate(5.4+PI/4);
          stroke(40,75,183);
          branch(164,43,-angle/2.5);
          branch2(175,25,angle2*1.3);
          rotate(-5.4-PI/4);
          stroke(24,23,131);
          //rotate(PI/6);
         // translate(110,-110);
          branch(195,40,-angle2/2.7);
          branch2(190,33,-angle/2);
          //rotate(-PI/6);
          //rotate(-PI/3);
         // translate(-360,0);
          branch(182,14,angle2*1.6);
           stroke(10,55,143);
          // translate(20,0);
         // rotate(2*PI);
          branch(179,19,-angle/1.2);
          branch2(165,26,angle*1.2);
         translate(-230,450);
         rotate(-PI/3);

translate(-80,-30);




 translate(650,20);
  rotate(PI/3);
  stroke(12,100,173);
 // rotate(5+PI/3);
  branch(179,29,-angle3);
  branch2(181,42,angle/1);
  stroke(0,55,143);
  //rotate(2*PI);
  branch(179,19,angle2/1.2);
  branch2(185,26,-angle3*1.2);
 // rotate(5.4+PI/4);
  stroke(4,23,131);
  //rotate(3.3+PI);
  translate(-20,-20);
  branch(195,40,angle2/2);
  branch2(210,33,-angle3/2);
  branch(222,14,angle*1.2);
  translate(20,20);
  
  stroke(12,100,173);
  rotate(2*PI);
  branch(179,29,-angle2/1.2);
  branch2(181,42,angle2/1.7);
  rotate(-2*PI);
  rotate(5.4+PI/4);
  stroke(40,75,183);
  branch(164,43,-angle/2.5);
  branch2(175,25,angle2*1.3);
  rotate(-5.4-PI/4);
  stroke(24,23,131);
  //rotate(PI/6);
 // translate(110,-110);
  branch(195,40,-angle2/2.7);
  branch2(190,33,-angle/2);
  //rotate(-PI/6);
  //rotate(-PI/3);
 // translate(-360,0);
  branch(182,14,angle2*1.6);
   stroke(10,55,143);
  // translate(20,0);
 // rotate(2*PI);
  branch(179,19,-angle/1.2);
  branch2(195,26,angle*1.2);
 
 rotate(-PI/3+.2);
  translate(-650,-20);



}




void branch2(int x, int units, float angle) {
  pushMatrix();
  translate(x,300);
  for(int i=20; i>0; i--){
    strokeWeight(i*.25);
    line(0,0,0,-8);
    translate(0,-8);
    rotate(angle/2);
  }
  popMatrix();
}
 
void branch(int x, int units, float angle2) {
  pushMatrix();
  translate(x,300);
  for(int i=15; i>0; i--){
    strokeWeight(i*.25);
    line(0,0,0,-8);
    translate(0,-8);
    rotate(angle2);
  }
  popMatrix();
}


