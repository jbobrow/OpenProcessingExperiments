
//note to self
//initializing a ton of particles by hand is terrible
//let's make an array for it next time...
  int yPF;
  int xPF;
Particle p1;
Particle p2;
Particle p3;
Particle p4;
Particle p5;
Particle p6;
Particle p7;
Particle p8;
Particle p9;
Particle p10;
Particle p11;
Particle p12;
Particle p13;
Particle p14;
Particle p15;
Particle p16;
Particle p17;
Particle p18;
Particle p19;
Particle p20;
Particle p21;
Particle p22;
Particle p23;
Particle p24;
Particle p25;
Particle p26;
Particle p27;
Particle p28;
Particle p29;
Particle p30;
Particle p31;
Particle p32;
Particle p33;
Particle p34;
Particle p35;
Particle p36;
Particle p37;
Particle p38;
Particle p39;
Particle p40;
Particle p41;
Particle p42;
Particle p43;
Particle p44;
Particle p45;
Particle p46;
Particle p47;
Particle p48;
Particle p49;
Particle p50;
Particle p51;
Particle p52;
Particle p53;
Particle p54;
Particle p55;
Particle p56;
Particle p57;
Particle p58;
Particle p59;
Particle p60;
Particle p61;
Particle p62;
Particle p63;
Particle p64;
Particle p65;
Particle p66;
Particle p67;
Particle p68;
Particle p69;
Particle p70;
Particle p71;
Particle p72;
Particle p73;
Particle p74;
Particle p75;
Particle p76;
Particle p77;
Particle p78;
Particle p79;
Particle p80;
Particle p81;
Particle p82;
Particle p83;
Particle p84;
Particle p85;
Particle p86;
Particle p87;
Particle p88;
Particle p89;
Particle p90;
Particle p91;
Particle p92;
Particle p93;
Particle p94;
Particle p95;
Particle p96;
Particle p97;
Particle p98;
Particle p99;
Particle p100;
Particle p101;
Particle p102;
Particle p103;
Particle p104;
Particle p105;
Particle p106;
Particle p107;
Particle p108;
Particle p109;
Particle p110;
Particle p111;
Particle p112;
Particle p113;
Particle p114;
Particle p115;
Particle p116;
Particle p117;
Particle p118;
Particle p119;
Particle p120;
Particle p121;
Particle p122;
Particle p123;
Particle p124;
Particle p125;
Particle p126;
Particle p127;
Particle p128;
Particle p129;
Particle p130;
Particle p131;
Particle p132;
Particle p133;
Particle p134;
Particle p135;
Particle p136;
Particle p137;
Particle p138;
Particle p139;
Particle p140;
Particle p141;
Particle p142;
Particle p143;
Particle p144;
Particle p145;
Particle p146;
Particle p147;
Particle p148;
Particle p149;
Particle p150;
Particle p151;
Particle p152;
Particle p153;
Particle p154;
Particle p155;
Particle p156;
Particle p157;
Particle p158;
Particle p159;
Particle p160;
Particle p161;
Particle p162;
Particle p163;
Particle p164;
Particle p165;
Particle p166;
Particle p167;
Particle p168;
Particle p169;
Particle p170;
Particle p171;
Particle p172;
Particle p173;
Particle p174;
Particle p175;
Particle p176;
Particle p177;
Particle p178;
Particle p179;
Particle p180;
Particle p181;
Particle p182;
Particle p183;
Particle p184;
Particle p185;
Particle p186;
Particle p187;
Particle p188;
Particle p189;
Particle p190;
Particle p191;
Particle p192;
Particle p193;
Particle p194;
Particle p195;
Particle p196;
Particle p197;
Particle p198;
Particle p199;
Particle p200;

void setup(){
  size(1000, 700);
  background(255);
  //load font for drawing instructions
  PFont font;
  font = loadFont("ArialMT-16.vlw");
  textFont(font);
  
  p1 = new Particle();
  p2 = new Particle();
  p3 = new Particle();
  p4 = new Particle();
  p5 = new Particle();
  p6 = new Particle();
  p7 = new Particle();
  p8 = new Particle();
  p9 = new Particle();
  p10 = new Particle();
  p11 = new Particle();
  p12 = new Particle();
  p13 = new Particle();
  p14 = new Particle();
  p15 = new Particle();
  p16 = new Particle();
  p17 = new Particle();
  p18 = new Particle();
  p19 = new Particle();
  p20 = new Particle();
  p21 = new Particle();
  p22 = new Particle();
  p23 = new Particle();
  p24 = new Particle();
  p25 = new Particle();
  p26 = new Particle();
  p27 = new Particle();
  p28 = new Particle();
  p29 = new Particle();
  p30 = new Particle();
  p31 = new Particle();
  p32 = new Particle();
  p33 = new Particle();
  p34 = new Particle();
  p35 = new Particle();
  p36 = new Particle();
  p37 = new Particle();
  p38 = new Particle();
  p39 = new Particle();
  p40 = new Particle();
  p41 = new Particle();
  p42 = new Particle();
  p43 = new Particle();
  p44 = new Particle();
  p45 = new Particle();
  p46 = new Particle();
  p47 = new Particle();
  p48 = new Particle();
  p49 = new Particle();
  p50 = new Particle();
  p51 = new Particle();
  p52 = new Particle();
  p53 = new Particle();
  p54 = new Particle();
  p55 = new Particle();
  p56 = new Particle();
  p57 = new Particle();
  p58 = new Particle();
  p59 = new Particle();
  p60 = new Particle();
  p61 = new Particle();
  p62 = new Particle();
  p63 = new Particle();
  p64 = new Particle();
  p65 = new Particle();
  p66 = new Particle();
  p67 = new Particle();
  p68 = new Particle();
  p69 = new Particle();
  p70 = new Particle();
  p71 = new Particle();
  p72 = new Particle();
  p73 = new Particle();
  p74 = new Particle();
  p75 = new Particle();
  p76 = new Particle();
  p77 = new Particle();
  p78 = new Particle();
  p79 = new Particle();
  p80 = new Particle();
  p81 = new Particle();
  p82 = new Particle();
  p83 = new Particle();
  p84 = new Particle();
  p85 = new Particle();
  p86 = new Particle();
  p87 = new Particle();
  p88 = new Particle();
  p89 = new Particle();
  p90 = new Particle();
  p91 = new Particle();
  p92 = new Particle();
  p93 = new Particle();
  p94 = new Particle();
  p95 = new Particle();
  p96 = new Particle();
  p97 = new Particle();
  p98 = new Particle();
  p99 = new Particle();
  p100 = new Particle();
  p101 = new Particle();
  p102 = new Particle();
  p103 = new Particle();
  p104 = new Particle();
  p105 = new Particle();
  p106 = new Particle();
  p107 = new Particle();
  p108 = new Particle();
  p109 = new Particle();
  p110 = new Particle();
  p111 = new Particle();
  p112 = new Particle();
  p113 = new Particle();
  p114 = new Particle();
  p115 = new Particle();
  p116 = new Particle();
  p117 = new Particle();
  p118 = new Particle();
  p119 = new Particle();
  p120 = new Particle();
  p121 = new Particle();
  p122 = new Particle();
  p123 = new Particle();
  p124 = new Particle();
  p125 = new Particle();
  p126 = new Particle();
  p127 = new Particle();
  p128 = new Particle();
  p129 = new Particle();
  p130 = new Particle();
  p131 = new Particle();
  p132 = new Particle();
  p133 = new Particle();
  p134 = new Particle();
  p135 = new Particle();
  p136 = new Particle();
  p137 = new Particle();
  p138 = new Particle();
  p139 = new Particle();
  p140 = new Particle();
  p141 = new Particle();
  p142 = new Particle();
  p143 = new Particle();
  p144 = new Particle();
  p145 = new Particle();
  p146 = new Particle();
  p147 = new Particle();
  p148 = new Particle();
  p149 = new Particle();
  p150 = new Particle();
  p151 = new Particle();
  p152 = new Particle();
  p152 = new Particle();
  p153 = new Particle();
  p154 = new Particle();
  p155 = new Particle();
  p156 = new Particle();
  p157 = new Particle();
  p158 = new Particle();
  p159 = new Particle();
  p160 = new Particle();
  p161 = new Particle();
  p162 = new Particle();
  p163 = new Particle();
  p164 = new Particle();
  p165 = new Particle();
  p166 = new Particle();
  p167 = new Particle();
  p168 = new Particle();
  p169 = new Particle();
  p170 = new Particle();
  p171 = new Particle();
  p172 = new Particle();
  p173 = new Particle();
  p174 = new Particle();
  p175 = new Particle();
  p176 = new Particle();
  p177 = new Particle();
  p178 = new Particle();
  p179 = new Particle();
  p180 = new Particle();
  p181 = new Particle();
  p182 = new Particle();
  p183 = new Particle();
  p184 = new Particle();
  p185 = new Particle();
  p186 = new Particle();
  p187 = new Particle();
  p188 = new Particle();
  p189 = new Particle();
  p190 = new Particle();
  p191 = new Particle();
  p192 = new Particle();
  p193 = new Particle();
  p194 = new Particle();
  p195 = new Particle();
  p196 = new Particle();
  p197 = new Particle();
  p198 = new Particle();
  p199 = new Particle();
  p200 = new Particle();
}

void draw(){
  background(255); 
  fill(0);
  //create a variable to pass y-position to other text lines
  //and help maintain alignment
  yPF = 50;
  xPF = 25;
  text("Instructions", xPF, yPF);
  fill(0, 100);
  text(" 'W' = gather particles", xPF, yPF+30);
  text(" left-click = explode", xPF, yPF+50); 
  p1.display();
  p1.update();
  p2.display();
  p2.update();
  p3.display();
  p3.update();
  p4.display();
  p4.update();
  p5.display();
  p5.update();
  p6.display();
  p6.update();
  p7.display();
  p7.update();
  p8.display();
  p8.update();
  p9.display();
  p9.update();
  p10.display();
  p10.update();
  p11.display();
  p11.update();
  p12.display();
  p12.update();
  p13.display();
  p13.update();
  p14.display();
  p14.update();
  p15.display();
  p15.update();
  p16.display();
  p16.update();
  p17.display();
  p17.update();
  p18.display();
  p18.update();
  p19.display();
  p19.update();
  p20.display();
  p20.update();
  p21.display();
  p21.update();
  p22.display();
  p22.update();
  p23.display();
  p23.update();
  p24.display();
  p24.update();
  p25.display();
  p25.update();
  p26.display();
  p26.update();
  p27.display();
  p27.update();
  p28.display();
  p28.update();
  p29.display();
  p29.update();
  p30.display();
  p30.update();
  p31.display();
  p31.update();
  p32.display();
  p32.update();
  p33.display();
  p33.update();
  p34.display();
  p34.update();
  p35.display();
  p35.update();
  p36.display();
  p36.update();
  p37.display();
  p37.update();
  p38.display();
  p38.update();
  p39.display();
  p39.update();
  p40.display();
  p40.update();
  p41.display();
  p41.update();
  p42.display();
  p42.update();
  p43.display();
  p43.update();
  p44.display();
  p44.update();
  p45.display();
  p45.update();
  p46.display();
  p46.update();
  p47.display();
  p47.update();
  p48.display();
  p48.update();
  p49.display();
  p49.update();
  p50.display();
  p50.update();
  p51.display();
  p51.update();
  p52.display();
  p52.update();
  p53.display();
  p53.update();
  p54.display();
  p54.update();
  p55.display();
  p55.update();
  p56.display();
  p56.update();
  p57.display();
  p57.update();
  p58.display();
  p58.update();
  p59.display();
  p59.update();
  p60.display();
  p60.update();
  p61.display();
  p61.update();
  p62.display();
  p62.update();
  p63.display();
  p63.update();
  p64.display();
  p64.update();
  p65.display();
  p65.update();
  p66.display();
  p66.update();
  p67.display();
  p67.update();
  p68.display();
  p68.update();
  p69.display();
  p69.update();
  p70.display();
  p70.update();
  p71.display();
  p71.update();
  p72.display();
  p72.update();
  p73.display();
  p73.update();
  p74.display();
  p74.update();
  p75.display();
  p75.update();
  p76.display();
  p76.update();
  p77.display();
  p77.update();
  p78.display();
  p78.update();
  p79.display();
  p79.update();
  p80.display();
  p80.update();
  p81.display();
  p81.update();
  p82.display();
  p82.update();
  p83.display();
  p83.update();
  p84.display();
  p84.update();
  p85.display();
  p85.update();
  p86.display();
  p86.update();
  p87.display();
  p87.update();
  p88.display();
  p88.update();
  p89.display();
  p89.update();
  p90.display();
  p90.update();
  p91.display();
  p91.update();
  p92.update();
  p92.display();
  p93.display();
  p93.update();
  p94.display();
  p94.update();
  p95.display();
  p95.update();
  p96.display();
  p96.update();
  p97.display();
  p97.update();
  p98.display();
  p98.update();
  p99.display();
  p99.update();
  p100.display();
  p100.update();
  p101.display();
  p101.update();
  p102.display();
  p102.update();
  p103.display();
  p103.update();
  p104.display();
  p104.update();
  p105.display();
  p105.update();
  p106.display();
  p106.update();
  p107.display();
  p107.update();
  p108.display();
  p108.update();
  p109.display();
  p109.update();
  p110.display();
  p110.update();
  p111.display();
  p111.update();
  p112.display();
  p112.update();
  p113.display();
  p113.update();
  p114.display();
  p114.update();
  p115.display();
  p115.update();
  p116.display();
  p116.update();
  p117.display();
  p117.update();
  p118.display();
  p118.update();
  p119.display();
  p119.update();
  p120.display();
  p120.update();
  p121.display();
  p121.update();
  p122.display();
  p122.update();
  p123.display();
  p123.update();
  p124.display();
  p124.update();
  p125.display();
  p125.update();
  p126.display();
  p126.update();
  p127.display();
  p127.update();
  p128.display();
  p128.update();
  p129.display();
  p129.update();
  p130.display();
  p130.update();
  p131.display();
  p131.update();
  p132.display();
  p132.update();
  p133.display();
  p133.update();
  p134.display();
  p134.update();
  p135.display();
  p135.update();
  p136.display();
  p136.update();
  p137.display();
  p137.update();
  p138.display();
  p138.update();
  p139.display();
  p139.update();
  p140.display();
  p140.update();
  p141.display();
  p141.update();
  p142.display();
  p142.update();
  p143.display();
  p143.update();
  p144.display();
  p144.update();
  p145.display();
  p145.update();
  p146.display();
  p146.update();
  p146.display();
  p147.update();
  p147.display();
  p148.update();
  p148.display();
  p149.update();
  p149.display();
  p150.update();
  p150.display();
  p151.update();
  p151.display();
  p152.update();
  p152.display();
  p153.update();
  p153.display();
  p154.update();
  p154.display();
  p155.update();
  p155.display();
  p156.update();
  p156.display();
  p157.update();
  p157.display();
  p158.update();
  p158.display();
  p159.update();
  p159.display();
  p160.update();
  p160.display();
  p161.update();
  p161.display();
  p162.update();
  p162.display();
  p163.update();
  p163.display();
  p164.update();
  p164.display();
  p165.update();
  p165.display();
  p166.update();
  p166.display();
  p167.update();
  p167.display();
  p168.update();
  p168.display();
  p169.update();
  p169.display();
  p170.update();
  p170.display();
  p171.update();
  p172.display();
  p172.update();
  p173.display();
  p173.update();
  p174.display();
  p174.update();
  p175.display();
  p175.update();
  p176.display();
  p176.update();
  p177.display();
  p177.update();
  p178.display();
  p178.update();
  p179.display();
  p179.update();
  p180.display();
  p180.update();
  p181.display();
  p181.update();
  p182.display();
  p182.update();
  p183.display();
  p183.update();
  p184.display();
  p184.update();
  p185.display();
  p185.update();
  p186.display();
  p186.update();
  p187.display();
  p187.update();
  p188.display();
  p188.update();
  p189.display();
  p189.update();
  p190.display();
  p190.update();
  p191.display();
  p191.update();
  p192.display();
  p192.update();
  p193.display();
  p193.update();
  p194.display();
  p194.update();
  p195.display();
  p195.update();
  p196.display();
  p196.update();
  p197.display();
  p197.update();
  p198.display();
  p198.update();
  p199.display();
  p199.update();
  p200.display();
  p200.update();
}



//create objects here
//create ball, which has initial vector position and velocity
class Particle {
 
 PVector location;
 PVector velocity;
 PVector gravity; 
  
 Particle(){
   
   location = new PVector(random(0, width), random(0, height), 20);
   velocity = new PVector(0, 0, 0);
   gravity = new PVector(0, 0.00001, 0);
 }
  
 void update(){
   PVector mouse = new PVector(mouseX, mouseY, 0);
   PVector dir = PVector.sub(mouse, location);
   dir.normalize();
   dir.mult(0.5);
   gravity = dir;
   location.add(velocity);
   velocity.add(gravity);
   velocity.limit(8);
   if(mousePressed){
     velocity.mult(1.2);
   }
   if(keyPressed){
    if(key == 'w' || key == 'W'){
      velocity.mult(0.8);
    } 
   }
  }
  
  
  void display(){
    PVector mouse = new PVector(mouseX, mouseY, 0);
    PVector gradient = PVector.sub(location, mouse);
    stroke(10, 10, 20);
    float cr = gradient.x;
    float cg = gradient.y;
    float cb = gradient.z;
    fill(250 - cr, 0, 0);
    ellipse(location.x, location.y, 10+(0.4*location.z), 10+(0.4*location.z));
    if(location.z > 20)
    {
     location.z = 0; 
    }
  }
  
}  
  
  
  
static class PVector {
  float x;
  float y;
  float z;
  float xspeed = 6;
  float yspeed = 20; 
  float zspeed = 10;
  
  PVector(float x_, float y_, float z_){
    x = x_;
    y = y_;
    z = z_;
  }

  void add(PVector v){
    y = y + v.y;
    x = x + v.x;
    z = z + v.z;
  }
  
   void sub(PVector v){
     y = y - v.y;
     x = x - v.x;
     z = z - v.z;
   }
   
   void mult(float n){
     y = y * n;
     x = x * n;
   }
   
   void scale(float n){
     y = y*n;
     x = x*n;
     z = z*n;
   }
   
   void div(float n){
     y = y/n;
     x = x/n;
     z = z/n;
   }
   
   float mag(){
     return sqrt(x*x + y*y + z*z);
   }
   
   void normalize(){
     float m = mag();
     if(m != 0){
     div(m);
     }
   }
     
    void limit(float max){
      if(x > max || y > max)
      {
       normalize();
       mult(max); 
      } 
   }
   
  static PVector add(PVector v1, PVector v2){
  PVector v3 = new PVector(v1.x + v2.x, v1.y + v2.y, v1.z + v2.z);
  return v3;
   }
  
  static PVector sub(PVector v1, PVector v2){
  PVector v3 = new PVector(v1.x - v2.x, v1.y - v2.y, v1.z - v2.z);
  return v3;
  }
  
  static PVector mult(PVector v1, PVector v2){
  PVector v3 = new PVector(v1.x * v2.x, v1.y * v2.y, v1.z * v2.z);
  return v3;
  }
}
     

  

  



