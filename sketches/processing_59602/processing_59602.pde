
float y = 50.0;
float speed = 1.0;
float radius = 15.0;
int direction = 1;

void setup(){
  size(500, 500);
  background(#FFFFFF);
  ellipseMode(CENTER); 
  smooth();
}

void draw(){

  background(#FFFFFF);
  noFill();
  strokeWeight(6);
  smooth();
//head
  arc(246.9, 150.4, 247.65, 247.65, radians(140), radians(400));
  
//lines mapping set up
  float v;
  v = mouseX;
  float m = map(v, 0, 500, 0, 50);
  float h1 = map(v, 0, 500, 300, 450);
  float h2 = map(v, 0, 500, 300, 440);
  float h3 = map(v, 0, 500, 300, 420);
  float h4 = map(v, 0, 500, 300, 435);
  float h5 = map(v, 0, 500, 300, 450);
  float h6 = map(v, 0, 500, 300, 430);
  float h7 = map(v, 0, 500, 300, 422);
  float h8 = map(v, 0, 500, 300, 444);
  float h9 = map(v, 0, 500, 300, 400);
  float jitter1 = random (0, m);
  float jitter2 = random (0, m);
  float jitter3 = random (0, m);
  float jitter4 = random (0, m);
  float jitter5 = random (0, m);
  float jitter6 = random (0, m);
  float jitter7 = random (0, m);
  float jitter8 = random (0, m);
  float jitter9 = random (0, m);
  
//lines  
  line(152, 230, 152, h1+jitter1); //line 1
  line(172, 230, 172, h2+jitter2); //line 2
  line(202, 230, 202, h3+jitter3); //line 3
  line(232, 230, 232, h4+jitter4); //line 4
  line(232, 230, 232, h5+jitter5); //line 5
  line(262, 230, 262, h6+jitter6); //line 6
  line(292, 230, 292, h7+jitter7); //line 7
  line(322, 230, 322, h8+jitter8); //line 8
  line(340, 230, 340, h9+jitter9); //line 9
  
//tears for left eye
   float t = map(v, 0, 500, 150, 215);
   float t1 = map(v, 0, 500, 170, 200);
   float t2 = map(v, 0, 500, 170, 220);
   line(170, 150, 170, t);
   line(180, 170, 180, t1);
   line(200, 170, 200, t2);
   
//tears for right eye
   float tear = map(v, 0, 500, 150, 215);
   float tear2 = map(v, 0, 500, 170, 300);
   float tear3 = map(v, 0, 500, 170, 200);
   line (281, 155, 281, tear);
   line (304, 150, 304, tear2);
   
//left eye set-up  
  float z = 23.3; //sphere height 
  float a = map(mouseX, 0, width, z, z);
  float a1= map(mouseX, 0, width, z, z);
//mapping setup
  float aa = map(mouseX, 0, width, 41.8857, 41.8857);
  float aaa = map(mouseX, 0, width, 30.7109, 30.7109);
  float aaaa = map(mouseX, 0, width, 25.207, 25.207);
  
//left eye
    float c =6; //nudge factor
  strokeWeight(3);
  fill(#000000);
    pushMatrix();
  translate(188+c, 141.9);
  float r = map(v, 0, 5, 0, -HALF_PI);
  float angle = radians(r);
  rotate(angle); 
    ellipse((171.7+c)-(188+c), 121.2-141.9, a, a);
    ellipse((194+c)-(188+c), 116.5-141.9, a, a);
    ellipse((212+c)-(188+c), 129.2-141.9, a, a);
    ellipse((211.7+c)-(188+c), 152-141.9, a, a);
    ellipse((194.13+c)-(188+c), 166.2-141.9, a, a);
    ellipse((171.6+c)-(188+c), 161.6-141.9, a, a);
    ellipse((162.2+c)-(188+c), 141.7-141.9, a, a);
   popMatrix();

  strokeWeight(3); 
  float opacity5 = map(mouseX, 250, 500, 0, 255);
  float flash2 = random (0, opacity5);
  fill(flash2, flash2, flash2);
  ellipse(188+c, 141.9, 60, 60);  
  
  float opacity4 = map(mouseX, 0, 500, 0, 255);
  float flash1 = random (0, opacity4);
  fill(flash1, flash1, flash1);
  ellipse(188+c, 141.9, 50, 50); 
  
  float opacity = map(mouseX, 0, 500, 255, 50);
  fill(opacity, opacity, opacity);
  ellipse(188+c, 141.9, aa, aa);  
  
  float opacity2 = map(mouseX, 0, 500, 0, 255);
  fill(opacity2, opacity2, opacity2);
  ellipse(188+c, 141.8, aaa, aaa);
  
  strokeWeight(0);
  fill(#FFFFFF);
  ellipse(188+c, 141.8, aaaa, aaaa);
   
 
  
//right eye
  pushMatrix();
  strokeWeight(3);
  float b = 110.2; 
  float bb = map(mouseX, 0, width, 50, 50);
  float bbb = map(mouseX, 0, width, 20.3, 20.3);
  translate(188+b, 141.8);
  float r1 = map(v, 0, 1, 0, HALF_PI);
  float angle1 = radians(r1);
  rotate(angle1); 
  fill(#FFFFFF);
    ellipse((171.7+b) - (188+b), 121.2 - 141.8, a1, a1);
    ellipse((194+b) - (188+b), 116.5 - 141.8, a1, a1); 
    ellipse((212+b) - (188+b), 129.2 - 141.8, a1, a1);
    ellipse((211.7+b) - (188+b), 152 - 141.8, a1, a1);  
    ellipse((194.13+b) - (188+b), 166.2 - 141.8, a1, a1);
    ellipse((171.6+b) - (188+b), 161.6 - 141.8, a1, a1); 
    ellipse((162.2+b) - (188+b), 141.7 - 141.8, a1, a1);
  popMatrix();
  fill(#000000);
    ellipse(188+b, 141.8, bb, bb);
  
 strokeWeight(2);
   
  fill(#FFFFFF);
    ellipse(188+b, 141.8, bbb, bbb);
    
  float invis1 = map(mouseX, 0, 500, 0, 255);
  float flashing1 = random (0, invis1);
  fill(flashing1, flashing1, flashing1);
    ellipse(188+b, 141.8, bbb-6, bbb-6);
  
  float invis2 = map(mouseX, 400, 500, 0, 255);
  float flashing2 = random (0, invis1);
  fill(flashing2, flashing2, flashing2);
    ellipse(188+b, 141.8, bbb-12, bbb-12);
    
  float dis = map(mouseX, 250, 350, 255, 0);
  fill(255, dis);
    ellipse(188+b, 141.8, bbb, bbb);
    
  strokeJoin(ROUND); 
  strokeCap(ROUND);
  
  strokeWeight(3);
  
  //nose
  float d = 20;  
  fill(#000000);
    triangle(245.541, 201.912-d-d, 221.1504+10, 223.3896-d-d, 271.4307-10, 223.3896-d-d);
    strokeWeight(0);
    arc(221.1504+18.295, 223.3896-d-d, 18, 18, radians(0), radians(180));
    arc(221.1504+18.30+15, 223.3896-d-d, 18, 18, radians(0), radians(180));
  
  // Credits
 // fill(150);
  //text(name, -240, 240);
  //fill(255);
  
}


