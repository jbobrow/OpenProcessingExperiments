
ArrayList mists,removeThese;
float diff = 1;
float [][]xs;
boolean drawAvg;

float angle = 0.0;
float offset = 60;
float scalar = 40;
float speed = 0.02;
int frame = 0;
int numFrames = 100;
PImage[] rose = new PImage[numFrames];
float inc=0.0;
PImage greenh;
PImage vine;
PImage house;
PImage leaf1;
PImage leaf2;
PImage leaf3;
PImage leaf4;
PImage leaf5;
PImage leaf6;
PImage leaf7;
PImage pots;
PImage flower;
PImage bud;


void setup(){
size(800,335);
smooth();

 rose[0]  = loadImage("0.gif");
  rose[1]  = loadImage("1.gif"); 
  rose[2]  = loadImage("2.gif");
  rose[3]  = loadImage("3.gif"); 
  rose[4]  = loadImage("4.gif");
  rose[5]  = loadImage("5.gif"); 
  rose[6]  = loadImage("6.gif");
  rose[7]  = loadImage("7.gif"); 
  rose[8]  = loadImage("8.gif");
  rose[9]  = loadImage("9.gif"); 
  rose[10]  = loadImage("9.gif"); 
  rose[11]  = loadImage("9.gif"); 
  rose[12]  = loadImage("9.gif"); 
  rose[13]  = loadImage("9.gif"); 
  rose[14]  = loadImage("9.gif"); 
  rose[15]  = loadImage("9.gif"); 
  rose[16]  = loadImage("9.gif"); 
  rose[17]  = loadImage("9.gif"); 
  rose[18]  = loadImage("9.gif"); 
  rose[19]  = loadImage("9.gif"); 
  rose[20]  = loadImage("9.gif"); 
  rose[21]  = loadImage("9.gif"); 
  rose[22]  = loadImage("9.gif"); 
  rose[23]  = loadImage("9.gif"); 
  rose[24]  = loadImage("9.gif"); 
  rose[25]  = loadImage("9.gif"); 
  rose[26]  = loadImage("9.gif"); 
  rose[27]  = loadImage("9.gif"); 
  rose[28]  = loadImage("9.gif"); 
  rose[29]  = loadImage("9.gif"); 
  rose[30]  = loadImage("9.gif"); 
  rose[31]  = loadImage("9.gif");
  rose[32]  = loadImage("9.gif");
  rose[33]  = loadImage("9.gif"); 
  rose[34]  = loadImage("9.gif"); 
  rose[35]  = loadImage("9.gif"); 
  rose[36]  = loadImage("9.gif"); 
  rose[37]  = loadImage("9.gif"); 
  rose[38]  = loadImage("9.gif"); 
  rose[39]  = loadImage("9.gif");
  rose[40]  = loadImage("9.gif"); 
  rose[41]  = loadImage("9.gif");
  rose[42]  = loadImage("9.gif");
  rose[43]  = loadImage("9.gif"); 
  rose[44]  = loadImage("9.gif"); 
  rose[45]  = loadImage("9.gif"); 
  rose[46]  = loadImage("9.gif"); 
  rose[47]  = loadImage("9.gif"); 
  rose[48]  = loadImage("9.gif"); 
  rose[49]  = loadImage("9.gif");
  rose[50]  = loadImage("9.gif"); 
  rose[51]  = loadImage("9.gif");
  rose[52]  = loadImage("9.gif");
  rose[53]  = loadImage("9.gif"); 
  rose[54]  = loadImage("9.gif"); 
  rose[55]  = loadImage("9.gif"); 
  rose[56]  = loadImage("9.gif"); 
  rose[57]  = loadImage("9.gif"); 
  rose[58]  = loadImage("9.gif"); 
  rose[59]  = loadImage("9.gif");
  rose[60]  = loadImage("8.gif");
  rose[61]  = loadImage("8.gif"); 
  rose[62]  = loadImage("8.gif"); 
  rose[63]  = loadImage("8.gif");
  rose[64]  = loadImage("7.gif");
  rose[65]  = loadImage("6.gif");
  rose[66]  = loadImage("5.gif");
  rose[67]  = loadImage("4.gif");
  rose[68]  = loadImage("3.gif");
  rose[69]  = loadImage("2.gif");
  rose[70]  = loadImage("1.gif");
 rose[71]  = loadImage("0.gif");
rose[72]  = loadImage("0.gif");
rose[73]  = loadImage("0.gif");
rose[74]  = loadImage("0.gif");
rose[75]  = loadImage("0.gif");
rose[76]  = loadImage("0.gif");
rose[77]  = loadImage("0.gif");
rose[78]  = loadImage("0.gif");
rose[79]  = loadImage("0.gif");
rose[80]  = loadImage("0.gif");
rose[81]  = loadImage("0.gif");
rose[82]  = loadImage("0.gif");
rose[83]  = loadImage("0.gif");
rose[84]  = loadImage("0.gif");
rose[85]  = loadImage("0.gif");
rose[86]  = loadImage("0.gif");
rose[87]  = loadImage("0.gif");
rose[88]  = loadImage("0.gif");
rose[89]  = loadImage("0.gif");
rose[90]  = loadImage("0.gif");
rose[91]  = loadImage("0.gif");
rose[92]  = loadImage("0.gif");
rose[93]  = loadImage("0.gif");
rose[94]  = loadImage("0.gif");
rose[95]  = loadImage("0.gif");
rose[96]  = loadImage("0.gif");
rose[97]  = loadImage("0.gif");
rose[98]  = loadImage("0.gif");
rose[99]  = loadImage("0.gif");


 mists = new ArrayList();
  removeThese = new ArrayList();
  xs = new float[width/1][2];
greenh= loadImage("green.jpg");
vine= loadImage("vine.png");
house= loadImage("house.png");
leaf1= loadImage("leaf1.png");
leaf2= loadImage("leaf2.png");
leaf3= loadImage("leaf3.png");
leaf4= loadImage("leaf4.png");
leaf5= loadImage("leaf5.png");
leaf6= loadImage("leaf6.png");
leaf7= loadImage("leaf7.png");
pots= loadImage("pots.png");
flower=loadImage("flower.png");
bud= loadImage("bud.png");
}






void draw(){
image (greenh,0,0);
  diff+=.001;
  if((int)random(5)<diff)
    mists.add(new mist());
  render(); 
  if(drawAvg)
    for(int i=1;i<xs.length;i++)
      if(xs[i][1]>0)
        line((i-1)*1,xs[i-1][0]/xs[i-1][1],i*1,xs[i][0]/xs[i][1]);
  fill(0);
  
  
   
     image(vine,0,0); 

     
     image(house,0,0);
    

  angle +=speed/2;  
  pushMatrix();
  rotate(sin(angle +0.4)/18);
     image(leaf1,0,0);
  popMatrix();
  pushMatrix();
  rotate(cos(angle +0.4)/18);
     image(leaf2,0,0);
     popMatrix();
  pushMatrix();
  rotate(-sin(angle)/18);
     image(leaf3,0,0);
     popMatrix();
  pushMatrix();
  rotate(-cos(angle +0.4)/18);
     image(leaf4,0,0);
     popMatrix();
  pushMatrix();
  rotate(-sin(angle +0.4)/18);
     image(leaf5,-15,0);
     popMatrix();
  pushMatrix();
  rotate(cos(angle)/20);
     image(leaf6,0,0);
     popMatrix();
  pushMatrix();
  rotate(sin(angle +0.2)/24);
     image(leaf7,-15,0);
     popMatrix();
 
tint(200,250,200);
frame = (frame+1) % numFrames;  
image(rose[frame], 0, 290,rose[frame].width/2,rose[frame].height/2); 

rotate(-2*PI/3);
translate(-250,-350);
frame = (frame+1) % numFrames;  
image(rose[frame], 0, 300,rose[frame].width/2,rose[frame].height/2); 
translate(250,350);
rotate(2*PI/3);

rotate(PI/6);
translate(10,-180);
frame = (frame+1) % numFrames;  
image(rose[frame], 20, 150,rose[frame].width/2,rose[frame].height/2); 
translate(-10,180);
rotate(-PI/6);
     
frameRate(15);
  noStroke();
  smooth(); 
  
  float angle=.8*cos(inc)/10+sin(inc*1.2)/30.0;
  float angle2=.7*sin(inc)/10;
  float angle3=.8*cos(inc)/10+sin(inc*1.2)/30.0;
  
 

  
  

   //left cluster
  
  inc +=0.015;
 pushMatrix(); 
  translate(400,50);
  stroke(100,113,12);
  rotate(5+PI/3);
  tendril(179,29,-angle/1.2);
  tendril(181,42,angle/2.7);
  stroke(55,83,0);
  rotate(2*PI);
  tendril(179,19,angle/1.2);
  tendril(185,26,angle*1.2);
  rotate(5.4+PI/4);
  stroke(75,123,40);
  tendril(164,43,-angle2/2.5);
  tendril(175,25,angle*1.3);
  stroke(23,71,4);
  rotate(3.3+PI);
  tendril(195,40,angle2/1.7);
  tendril(210,33,-angle/2);
  tendril(182,14,angle2*3.2);
  
  stroke(100,113,12);
  rotate(6*PI/3);
  tendril(179,29,-angle/1.2);
  tendril(181,42,angle/1.7);
  rotate(5.4+PI/4);
  stroke(75,123,40);
  tendril(164,43,angle/2.5);
  tendril(175,25,angle2*1.3);
  stroke(23,71,24);
  rotate(PI/6);
  translate(110,-110);
  tendril(195,40,angle2/2.7);
  tendril(190,33,-angle/2);
  rotate(-PI/3);
  translate(-360,0);
  tendril(182,14,-angle2*1.6);
   stroke(55,83,10);
   translate(20,0);
  rotate(2*PI);
  tendril(179,19,-angle/1.2);
  tendril(165,26,-angle*1.2);
 popMatrix(); 
   
 pushMatrix();  
  translate(200,70);
  stroke(100,113,12);
  rotate(5+PI/3);
  tendril(179,29,-angle2/1.7);
  tendril(181,42,angle2/1.3);
  stroke(55,83,0);
  rotate(2*PI);
  tendril(179,19,angle/3.2);
  tendril(185,26,-angle2*1.2);
  rotate(5.4+PI/4);
  stroke(75,123,40);
  tendril(164,43,angle2/2.5);
  tendril(175,25,angle*1.3);
  stroke(23,71,4);
  rotate(3.3+PI);
  tendril(195,40,angle2/2.7);
  tendril(210,33,-angle/2);
  tendril(182,14,angle2*1.2);
  
  stroke(100,113,12);
  rotate(6*PI/3);
  tendril(179,29,-angle2/1.2);
  tendril(181,42,angle2);
  rotate(5.4+PI/4);
  stroke(75,123,40);
  tendril(164,43,-angle2/2.5);
  tendril(175,25,angle*1.3);
  stroke(23,71,24);
  rotate(PI/6);
  translate(110,-110);
  tendril(195,40,angle2/2.7);
  tendril(190,33,angle/2);
  rotate(-PI/3);
  translate(-360,0);
  tendril(182,14,angle2*1.6);
   stroke(55,83,10);
   translate(20,0);
  rotate(2*PI);
  tendril(179,19,-angle/1.2);
  tendril(165,26,-angle*1.2);
  translate(-200,-70);
popMatrix(); 

   pushMatrix();  
  translate(300,70);
  stroke(100,113,12);
  rotate(5+PI/3);
  tendril(179,29,-angle/1.2);
  tendril(181,42,-angle/1.7);
  stroke(55,83,0);
  rotate(2*PI);
  tendril(179,19,angle/1.2);
  tendril(185,26,-angle*1.8);
  rotate(5.4+PI/4);
  stroke(75,123,40);
  tendril(164,43,-angle2/1.5);
  tendril(175,25,angle2*1.5);
  stroke(23,71,4);
  rotate(3.3+PI);
  tendril(195,40,angle/2.7);
  tendril(210,33,-angle/2);
  tendril(182,14,-angle2*2.2);
  
  stroke(100,113,12);
  rotate(6*PI/3);
  tendril(179,29,-angle/2.2);
  tendril(181,42,-angle2/1.3);
  rotate(5.4+PI/4);
  stroke(75,123,40);
  tendril(164,43,-angle2/2.5);
  tendril(175,25,angle2*1.3);
  stroke(23,71,24);
  rotate(PI/6);
  translate(110,-110);
  tendril(195,40,-angle/2.7);
  tendril(190,33,angle/2);
  rotate(-PI/3);
  translate(-360,0);
  tendril(182,14,-angle2*1.6);
   stroke(55,83,10);
   translate(20,0);
  rotate(2*PI);
  tendril(179,19,-angle/2.2);
  tendril(165,26,angle2*1.2);
  
popMatrix(); 

 pushMatrix();  
  translate(250,70);
  stroke(100,113,12);
  rotate(5+PI/3);
  tendril(179,29,-angle2/1.2);
  tendril(181,42,angle/1.7);
  stroke(55,83,0);
  rotate(2*PI);
  tendril(179,19,angle2/1.2);
  tendril(185,26,-angle*1.2);
  rotate(5.4+PI/4);
  stroke(75,123,40);
  tendril(164,43,angle2/2.5);
  tendril(175,25,angle*1.3);
  stroke(23,71,4);
  rotate(3.3+PI);
  tendril(195,40,angle2/2.7);
  tendril(210,33,-angle/2);
  tendril(182,14,angle2*1.2);
  
  stroke(100,113,12);
  rotate(6*PI/3);
  tendril(179,29,-angle2/1.2);
  tendril(181,42,angle2/1.7);
  rotate(5.4+PI/4);
  stroke(75,123,40);
  tendril(164,43,-angle/2.5);
  tendril(175,25,angle2*1.3);
  stroke(23,71,24);
  rotate(PI/6);
  translate(110,-110);
  tendril(195,40,-angle2/2.7);
  tendril(190,33,-angle/2);
  rotate(-PI/3);
  translate(-360,0);
  tendril(182,14,angle2*1.6);
   stroke(55,83,10);
   translate(20,0);
  rotate(2*PI);
  tendril(179,19,-angle/1.2);
  tendril(165,26,angle*1.2);

popMatrix(); 

 pushMatrix();  
  translate(350,60);
  stroke(100,113,12);
  rotate(5+PI/3);
  tendril(179,29,-angle2/1.2);
  tendril(181,42,angle/1.7);
  stroke(55,83,0);
  rotate(2*PI);
  tendril(179,19,angle2/1.2);
  tendril(185,26,-angle*1.2);
  rotate(5.4+PI/4);
  stroke(75,123,40);
  tendril(164,43,angle2/2.5);
  tendril(175,25,angle*1.3);
  stroke(23,71,4);
  rotate(3.3+PI);
  tendril(195,40,angle2/2.7);
  tendril(210,33,-angle/2);
  tendril(182,14,angle2*1.2);
  
  stroke(100,113,12);
  rotate(6*PI/3);
  tendril(179,29,-angle2/1.2);
  tendril(181,42,angle2/1.7);
  rotate(5.4+PI/4);
  stroke(75,123,40);
  tendril(164,43,-angle/2.5);
  tendril(175,25,angle2*1.3);
  stroke(23,71,24);
  rotate(PI/6);
  translate(110,-110);
  tendril(195,40,-angle2/2.7);
  tendril(190,33,-angle/2);
  rotate(-PI/3);
  translate(-360,0);
  tendril(182,14,angle2*1.6);
   stroke(55,83,10);
   translate(20,0);
  rotate(2*PI);
  tendril(179,19,-angle/1.2);
  tendril(165,26,angle*1.2);

popMatrix(); 

 pushMatrix();  
  translate(450,50);
  stroke(100,113,12);
  rotate(5+PI/3);
  tendril(179,29,-angle/1.2);
  tendril(181,42,-angle/1.7);
  stroke(55,83,0);
  rotate(2*PI);
  tendril(179,19,angle/1.2);
  tendril(185,26,-angle*1.8);
  rotate(5.4+PI/4);
  stroke(75,123,40);
  tendril(164,43,-angle2/1.5);
  tendril(175,25,angle2*1.5);
  stroke(23,71,4);
  rotate(3.3+PI);
  tendril(195,40,angle/2.7);
  tendril(210,33,-angle/2);
  tendril(182,14,-angle2*2.2);
  
  stroke(100,113,12);
  rotate(6*PI/3);
  tendril(179,29,-angle/2.2);
  tendril(181,42,-angle2/1.3);
  rotate(5.4+PI/4);
  stroke(75,123,40);
  tendril(164,43,-angle2/2.5);
  tendril(175,25,angle2*1.3);
  stroke(23,71,24);
  rotate(PI/6);
  translate(110,-110);
  tendril(195,40,-angle/2.7);
  tendril(190,33,angle/2);
  rotate(-PI/3);
  translate(-360,0);
  tendril(182,14,-angle2*1.6);
   stroke(55,83,10);
   translate(20,0);
  rotate(2*PI);
  tendril(179,19,-angle/2.2);
  tendril(165,26,angle2*1.2);
  
popMatrix(); 



image(pots,0,0);
if (mousePressed==true){
image(flower,420,0,flower.width/1.5,flower.height/1.5);
}

else{
image(bud,420,0,bud.width/1.5,bud.height/1.5);
}



}






 
void tendril(int x, int units, float angle2) {
  pushMatrix();
  translate(x,300);
  for(int i=15; i>0; i--){
    strokeWeight(i*.15);
    line(0,0,0,-8);
    translate(0,-8);
    rotate(2*angle2);
  }
  popMatrix();
}
    


void render(){  
  for(int i=0;i<mists.size();i++) {
    mist temp = (mist) mists.get(i);
    temp.update(xs); 
  }
}
  

class mist{
  PVector pos,vel,acc;
  float radius;
  float gravity = .02;
  float h;
  mist(){
    radius = random(70,100);
    pos = new PVector(170,50);
    vel = new PVector(random(-1,1),0);
    acc = new PVector(0,gravity/2);
  }
  
  void update(float[][] inxs){
    pos.add(vel);
    vel.add(acc);
    render();
    if(pos.x>0){
    }
  }
 
  void render(){
    pushMatrix();
    translate(pos.x,pos.y);
    noStroke();
    fill(255,10);
    ellipse(0,0,radius,radius);
    popMatrix();
  }

  }
  



