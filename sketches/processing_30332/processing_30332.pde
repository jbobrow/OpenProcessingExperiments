
bug lady;
int numAphids = 10;
int maxAphids = 15;
bug[] aphids = new bug[maxAphids];
PFont fontScore,fontWin,fontData;
int score = 0;
int flag = 1;
int boardWidth = 600;
int sideWidth = 300;
int boardHeight = 600;
PImage target;
int numLeaves = 200;
int[] eaten = new int[3];
int globCounter;
int Passtimer;
leaf[] leaves = new leaf[numLeaves];
int[] avgT = new int[3];

//PImage bg;

void setup(){
  frameRate(30);
  size(900,600);
  background(255,255,255);
  lady = new bug(250,250,40);
  for(int i =0; i <numAphids; i++)
     aphids[i] = new bug();
  for(int i =numAphids; i <maxAphids; i++)
      aphids[i] = null;
  for(int i = 0; i < numLeaves; i++)
      leaves[i] = new leaf();
  fontWin = loadFont("Calibri-25.vlw");
  fontScore = loadFont("Calibri-12.vlw"); 
  fontData = loadFont("Calibri-12.vlw");
  textFont(fontScore); 
}

void draw(){
//  image(target,0,0);
  background(20,200,20);
  for(int i =0; i < numLeaves; i++)
     leaves[i].drawLeaf();
  if(flag == 1){
    lady.move();
    lady.eat();
    globCounter++;
    Passtimer++;
   if(globCounter % 500 == 0){
     pass();
   }
  }
  if(flag == 0 && keyPressed){
    score = 0;
    flag = 1;
    lady = new bug(250,250,40);
  }
  for(int i =1; i < maxAphids;i++){
    if(aphids[i] != null){
      aphids[i].move();
      aphids[i].display();
    }
  }
  lady.display();
  stroke(0);
  fill(250);
  rect(boardWidth,0,sideWidth,boardHeight);
  fill(0,0,0);
  textFont(fontScore);
  text("Score: " +score,boardWidth+sideWidth/4,30);
  calcStats();
  if(lady.get_radius() < 15){
    stroke(255,0,0);
    fill(0,0,0);
    textFont(fontWin);
    text("Your Score: " + score, width*.4,height*.5);
    textFont(fontScore);
    text("Press any key to play again ", width*.316,height*.54);
    flag = 0;
  }
}


class bug{
  float dx;
  float dy;
  float theta;
  float v;
  float dtheta;
  float x;
  float y;
  float radius;
  int type;
  int timer;
  color c;
  int bt;
 
  bug(float ix,float iy, float ir){
    // initialize the ladybug
     x = ix;
     y=iy;
     radius = ir;
     type = 0;
     timer=0;
     dx = 0.0;
     dy = -0.1;
  }
  
  bug(){
    // initialize aphids
    x=random(0,width);
    y=random(0,height);
    dx = random(-3.0,3.0);
    dy = 2+random(-3.0,3.0);
    radius = 17;
    type = 1;
    bt = 0 ;
    int(random(0,5));  
    v = random(1.0,4.0);
    theta = random(0,2*PI);
    dtheta = random(-0.05,0.05);
    color c1 = color(255,0,0);
    color c2 = color(0,255,0);
    color c3 = color(0,0,255);
    float g = random(3);
    if (g>0 && g<1)
      c = c1;
    else if (g>1 && g<2)
      c=c2;
    else 
      c=c3;
    //c = color(random(0,255),random(10,255),random(0,255));
 }
  
  void eat(){
    float dist;
    for(int i = 0; i < maxAphids;i++){
      if(aphids[i] !=null){
        if(aphids[i].type!=0){
          dist = ((aphids[i].x-x)*(aphids[i].x-x)+(aphids[i].y-y)*(aphids[i].y-y));
          if(sqrt(dist)<(radius*.6)){
            aphids[i] = null; // erase old aphid
            score++;
            if(i>=0 && i<5){
              eaten[0]++;}
            else if(i>= 5 && i<10){
              eaten[1]++;}
            else{
              eaten[2]++;}
          }
        }
      }
    }
  }
  
  void mutCopy(bug s){
    x=s.x;
    y=s.y;
    dx = s.dx;
    dy = s.dy;
    radius = s.radius+random(-1.5,1.5);
    if(radius < 3)
       radius = 3;  // minimum radius
    type = 1;  
    timer = int(random(0,5));
    v = s.v + random(-2.0,2.0);
    if(v < 0)
       v *=-1;  // maintain positive speed
    if(random(0,1.0) < 0.5)
       theta = s.theta + PI/4;
    else 
       theta = s.theta - PI/4;
    dtheta = s.dtheta + random(-0.01,0.01);
    int crange = 12;
   // c = color(red(s.c),green(s.c), blue(s.c));
    c = color(red(s.c)+random(-1*crange,crange)*random(-1*crange,crange),green(c),blue(c));
    c = color(red(c),green(s.c)+random(-1*crange,crange)*random(-1*crange,crange),blue(c));
    c = color(red(c),green(c),blue(s.c)+random(-1*crange,crange)*random(-1*crange,crange));
   }
  
  float get_radius(){
    return radius;
  }
  
  void move(){   
    int adjustMouseX = mouseX;
    if(adjustMouseX > boardWidth)
       adjustMouseX = boardWidth;  // avoids ladybug wrapping right
    if(type ==0){  // ladybug
       dx=0.3*(adjustMouseX-x);
       dy=0.3*(mouseY-y);
       if(dx > 10)
          dx = 10;
       if(dx < -10)
          dx = -10;
       if(dy > 10)
          dy = 10;
       if(dy < -10)
          dy = -10;
    }
    if(type == 0){  // ladbug
       x += dx; 
       y += dy; 
    }
    else{
      x+=(v*sin(theta));
      y+=(v*cos(theta));
      theta+=dtheta;
      dtheta+=(random(0.01)-0.005);
      timer++;
      if(timer == 20){  // parent
          timer = 0;
          int j=0;
          int k =0;
          while(j < maxAphids && aphids[j] != null){
            j++;  // find null slot
          } // pick parent
          if(j < maxAphids){
             aphids[j] = new bug();
          //k= round(random(0,maxAphids-1));
          k= leaderDisplay();
           // pick parent
             aphids[j].mutCopy(aphids[k]);
             numAphids++;
          }
      }
    }
    if(x < 0)
       x = boardWidth;
    if(x>boardWidth)
       x = 0;
    if(y < 0)
       y = boardHeight;
    if(y>boardHeight)
       y = 0;
  }
  
  void display() {
    if(type == 0)
       displaylady();
    else
       displayaphid();
  }
  
  void displaylady (){
    float angle = atan(dx/dy);
    if(dy<0)
       angle=angle+PI;
    stroke(0,0,0);
    fill(255,0,0);
    ellipse(x,y,radius,radius);
    line(x+(radius-1)/2*sin(angle),y+(radius-1)/2*cos(angle),x-(radius-1)/2*sin(angle),y-(radius-1)/2*cos(angle));
    fill(0,0,0);
    ellipse(x+(radius*0.5)*sin(angle),y+(radius*0.5)*cos(angle),radius*.25,radius*.25);
 ellipse(x+(radius)/4*sin(angle+PI/3),y+(radius)/4*cos(angle+PI/3),radius/5,radius/5);
 ellipse(x+(radius)/4*sin(angle-PI/3),y+(radius)/4*cos(angle-PI/3),radius/5,radius/5);
 ellipse(x+(radius)/4*sin(angle+2*PI/3),y+(radius)/4*cos(angle+2*PI/3),radius/5,radius/5);
 ellipse(x+(radius)/4*sin(angle-2*PI/3),y+(radius)/4*cos(angle-2*PI/3),radius/5,radius/5);
  } 
  
  void displayaphid(){
    if(type == 0)
       return;
    noStroke();
    fill(0,0,0);
    ellipse(x+(radius*0.5)*sin(theta-0.2),y+(radius*0.5)*cos(theta-0.2),radius*.25,radius*.25);
    ellipse(x+(radius*0.5)*sin(theta+0.2),y+(radius*0.5)*cos(theta+0.2),radius*.25,radius*.25);
    fill(c);
    ellipse(x,y,radius,radius);
    bt++;
  }
}  
int leaderDisplay(){
  int maxBug;
  maxBug = 0;
  for(int k= 0; k<maxAphids && aphids[k]!= null;){
    if(aphids[k].bt > aphids[maxBug].bt){
      maxBug = k;
    }
    k++;
  }
 return maxBug;
}

// PASS FUNCTION
void pass(){
  
  int maxb = 0;
  int minb = 0;
  for(int i = 0; i<3 ; i++){
    if(avgT[i] > maxb){
      maxb = i;}
    if(avgT[i] < minb){
      minb = i;}
  }
  int j = maxb*5;
  for(int k = minb*5 ; k<((minb*5)+5) ; k++){
    //aphids[k] = null;
    if(aphids[j]!=null && aphids[k]!= null){
    aphids[k].mutCopy(aphids[j]);
    }
    j++;
  }
  Passtimer = 0;
  eaten[0] = 1;
  eaten[1] = 1;
  eaten[2] = 1;
  for(int l = 0; l< maxAphids; l++){
    if(aphids[l]!=null){
      aphids[l].bt = 0;}
  }
  
}
  
void calcStats(){
  float avgV = 0;
  float avgTheta = 0;
  float avgDtheta = 0;
  float avgRadius = 0;
  int count = 0;
  int maxBug= 0;
  int[] timer1 = new int[maxAphids];
  int r =0, g =0, b = 0;
  int k;
  int[] totTime = new int[3];
  for(int i = 0; i < maxAphids; i++){
    if(aphids[i] != null){
      count++;
      avgV+=aphids[i].v;
      avgTheta+=aphids[i].theta;
      avgDtheta+=aphids[i].dtheta;
      avgRadius+=aphids[i].radius;
      if(i>=0 && i<5){
        totTime[0] = totTime[0] + aphids[i].bt; }
      else if(i>=5 && i<10){
         totTime[1] = totTime[1] + aphids[i].bt; }
      else{
        totTime[2] = totTime[2] + aphids[i].bt; }
//        r++;
//        timer1[i] = aphids[i].timer;}
//      else if(aphids[i].c == color(0,255,0)){
//         g++;
//         timer1[i] = aphids[i].timer;}
//      else{
//        b++;
//        timer1[i] = aphids[i].timer;}

    }
  }
  avgV /= count;
  avgTheta /= count;
  avgDtheta /= count;
  avgRadius /= count;
  avgT[0] = (totTime[0]/(5+eaten[0]));
  avgT[1] = (totTime[1]/(5+eaten[1]));
  avgT[2] = (totTime[2]/(5+eaten[2]));
  textFont(fontData);
  text("Average Aphid Speed = " + round(avgV*10)/10.0, boardWidth+sideWidth/2.0 - 100, 50);
  text("Average Aphid Size = " + round(avgRadius*10)/10.0, boardWidth+sideWidth/2.0 - 100, 75);
  text("Avg time of T1 = " + avgT[0], boardWidth+sideWidth/2.0 - 100, 95);
  text("Avg time of T2 = " + avgT[1], boardWidth+sideWidth/2.0 - 100, 115);
  text("Avg time of T3 = " + avgT[2], boardWidth+sideWidth/2.0 - 100, 135);
  int j =20;
  for(k=1; k<maxAphids && aphids[k] != null;){
    text("Timer of = "  + aphids[k].bt,boardWidth+sideWidth/2.0 - 100, 135 + j);
    j= j +20; 
    k++;
   }
   maxBug = leaderDisplay();
   text("Leader is bug number "  + maxBug,boardWidth+sideWidth/2.0 - 100, 135 + j);
   j= j+20;
   text("Global Timer "  + globCounter,boardWidth+sideWidth/2.0 - 100, 135 + j);
   j = j+20;
   text("Pass Timer "  + Passtimer,boardWidth+sideWidth/2.0 - 100, 135 + j);
//  text("Average Aphid Turn = " + round(avgTheta*10)/10.0, boardWidth+sideWidth/2.0 - 100, 75);
//  text("Average Aphid Delta Turn = " + round(avgDtheta*100)/100.0, boardWidth+sideWidth/2.0 - 100, 100);
  PrintWriter output;
  output = createWriter("data.txt");
  if(aphids[0]!=null)
  output.println(aphids[0].theta);  
  output.flush();
  output.close();
}
      
class leaf{
  float x,y;
  float r1,r2;
  color c;
  
  leaf(){
    x = random(-10,boardWidth);
    y = random(-10,height);
    r1 = random(50,100);
    r2 = random(50,100);
    c = color(int(random(0,50)),int(random(180,220)),int(random(0,50)));
  }
  
  void drawLeaf(){
    stroke(c);
    fill(c);
    ellipse(x,y,r1,r2);
  }
}



