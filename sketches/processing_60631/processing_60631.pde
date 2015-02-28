
PImage coil;
PImage coil_p;
PImage shadow;
PImage back;
float diameter = 50;//size of coil[pixel] 
float real_diameter = 0.3;//real size coil[m]
float img = 90;
float ratio =  diameter/real_diameter;
float initY = 1.5*ratio; 
float initX = 1.0*ratio; 
float m = 6.0;//weight of coil[kg]
float m_base = 0.1;//*ratio*ratio;//Magnetic charge base
float m_coil_init = 2.5;//*ratio*ratio;//Magnetic charge coil
float m_add = 0;//added by mouse
int num_add = 50;//num of added mag       
color c_add = color(0, 0, 0, 60);//pointer color 
int flag_mag = 0;//0-coil 1-added
int chase_flag = -1;
float coMagnet = 1.0*ratio/(float)(4*PI*1.25*Math.pow(10, -6));//coefficient
float g = 9.8*ratio;//gravity
float dt = 0.02;
float t = 0.0;//time
float st;
int cnum = 1;//coil num
int cnum_max = 50;//coil num max
int m_num = 0;//count of mag
int pmod = 1;//pointer_flag
int param = 1;//print param flag
float m_total=0;
float max_Fx=0;
float max_Fy=0;
float max_u = 0.0;
float max_v = 0.0;

  //add for button
int rect1X, rect1Y;      // Position of square button
int rect2X, rect2Y;  // Position of circle button
int rectSize = 20;     // Diameter of rect
color rect1Color, rect2Color, baseColor;
color rect1Highlight, rect2Highlight;
color currentColor;
boolean[] rectOver;
boolean rect1Over = false;
boolean rect2Over = false;  
boolean rect3Over = false;
boolean rect4Over = false;
boolean rect5Over = false;
//add for button

String roundDown(float x, int n)
{
  String c = "%." + n + "f";
  String s = String.format(c, x);
  return s;
}
void printParam(float x, int n, String s, int xpos, int ypos)
//drawing param "x" + String "s" with "n" digit in (xpos,ypos) in "c[]" color
{
  if (x > 100) n=0;
  String s4=roundDown(x, n) + s;
  text(s4, xpos, ypos);
}
class m_added
{
  float x0, y0;
  float mag;
  m_added(float x, float y, float magnet) {
    x0 = x;
    y0 = y;
    mag = magnet;
  }
  void point() {
    x0 = mouseX;
    y0 = height - mouseY;
    mag = m_add;
  }
}
class calc_maglev
{
  float y0, y1; 
  float x0, x1;
  float k1, k2, k3, k4;
  float xpos, ypos, zpos;
  float m_coil, coK;
  float Fx, Fy;
  float offset;
  calc_maglev( float iniy0, float iniy1, float inix, float iniz, float m) {
    y0 = iniy0;
    y1 = iniy1;
    x0 = inix;
    zpos = iniz;
    m_coil = m;
    coK = 0;
    Fx=0;
    Fy=0;
    offset = random(0.1*img) ;
  }
  void runge_kutta(int flag) {//x or y or z
    float r0 = 0;
    float r1 = 0;
    if (flag == 1) {
      r0 = y0;
      r1 = y1;
    }
    if (flag == 0) {
      r0 = x0;
      r1 = x1;
    }     
    k1 = r1;
    k2 = r1 + dt*k1/2.0;
    k3 = r1 + dt*k2/2.0;
    k4 = r1 + dt*k3;
    r0 = r0 + (dt/6.0)*(k1 + 2*k2 + 2*k3 + k4);
    if (flag == 1) y0 = r0;
    if (flag == 0) x0 = r0;
    k1 = externalForce(0, flag);
    k2 = externalForce(k1*0.5*dt, flag);
    k3 = externalForce(k2*0.5*dt, flag);
    k4 = externalForce(k3*dt, flag);  
    r1 = r1 + (dt/6.0)*(k1 + 2*k2 + 2*k3 + k4);
    //if(r1/ratio > 10) r1 = 10*ratio;//correct vel
    if (flag == 1) {      
      y0 = r0;
      y1 = r1;
      float v = y1/ratio;       
      if (v>max_v) max_v=v;//rec max
    }
    if (flag == 0) {      
      x0 = r0;
      x1 = r1;
      float u = x1/ratio;
      if (u>max_u) max_u=u;//rec max
    }
  }
  float externalForce(float diff, int flag) {
    float total = 0.0;//total of EF
    float total_2 = 0.0;//total of f of coil
    float pos_x = x0;
    float pos_y = y0;
    float ef_return = 0.0;
    m_total = 0;
    //add grav + maf by base
    if (flag == 1){
      pos_y = y0 + diff;
      total += -g + (coMagnet/m)*(m_coil*m_base)/(pos_y*pos_y);
    } 
    if (flag == 0) pos_x = x0 + diff;
    //externalForce by "m_add" in (float x, float y).flag shows coordinates 0-x 1-y 2-z
    for (int i=0; i<num_add;i++) {
      float coK = (coMagnet/m)*(m_coil*ma[i].mag);
      m_total += ma[i].mag;
      float distance_2 = (pos_x-ma[i].x0)*(pos_x-ma[i].x0)+(pos_y-ma[i].y0)*(pos_y-ma[i].y0);
      distance_2 = sqrt(distance_2);
      //if (distance_2 < img) distance_2 = img;
      float grad = 0;
      if (flag == 0) grad = (pos_x-ma[i].x0)/distance_2;
      if (flag == 1) grad = (pos_y-ma[i].y0)/distance_2;
      total += (coK/(distance_2*distance_2))*grad;
    }
    float coK = (coMagnet/m)*(m_coil*m_coil);//calc force by coil
    for (int i=0; i<cnum;i++) {
      if (!((x0==cm[i].x0)&&(y0==cm[i].y0))) {
        float distance_2 = (pos_x-cm[i].x0)*(pos_x-cm[i].x0)+(pos_y-cm[i].y0)*(pos_y-cm[i].y0);
        distance_2 = sqrt(distance_2);
        float grad = 0;
        //if(distance_2 < img) distance_2 = img;
        if (flag == 0) grad = (pos_x-cm[i].x0)/distance_2;//grad x
        if (flag == 1) grad = (pos_y-cm[i].y0)/distance_2;//grad y
        total_2 += (coK/(distance_2*distance_2))*grad;
      }
    }
    ef_return = total+total_2;
    //if(ef_return > 50*ratio) ef_return=50*ratio;//correct EF
    if (flag == 1){      
      Fy = ef_return/ratio;//[m/s^2]
      if (Fy > max_Fy) max_Fy = Fy;  
    }
    if (flag == 0){
        Fx = ef_return/ratio;//[m/s^2]
        if (Fx > max_Fx) max_Fx = Fx;
    }
    return ef_return;
  }
  void update() {
    if (y0 < coil.height*img/coil.width) {//if ground
      y0 = coil.height*img/coil.width;
      y1 = 0.01*y1;
    }
    if (x0 < 0.5*img) {//if x<0
      x0 = 0.5*img;
      x1 = -0.5*x1;
    }
    else if (x0 > width-0.5*img) {//if x > width
      x0 = width-0.5*img;
      x1= -0.5*x1;
    }
    for (int i=0;i< num_add;i++) {
      float dist = (x0-ma[i].x0)*(x0-ma[i].x0) + (y0-ma[i].y0)*(y0-ma[i].y0);
      dist = sqrt(dist);
      if ((ma[i].mag < 0) && (dist< 0.5*img)) {//*(m_coil_init/m_coil)
        x0 = ma[i].x0 + random(0.1*img);
        x1 = 0.0;
        y0 = ma[i].y0 + random(0.1*img);
        y1 = 0.0;
      }
    }
    xpos = x0;//drawing posx
    ypos = height - y0;//drawing posy
    zpos = zpos;

    ma[m_num].x0 = mouseX;
    ma[m_num].y0 = height - mouseY;
    ma[m_num].mag = m_add;
  }
}
calc_maglev []cm = new calc_maglev[cnum_max];//object gene
m_added []ma = new m_added[num_add];//object gene
void setup() {
      //add for button
  rect1Color = color(0, 0, 255, 100);
  rect1Highlight = color(0, 0, 255, 200);
  rect2Color = color(255, 0, 0, 100);
  rect2Highlight = color(255, 0, 0, 200);
  rect1X = 10;
  rect1Y = 10;
  rect2X = 10+rectSize;
  rect2Y = 10;
  ellipseMode(CENTER);
    //add for button
  coil = loadImage("coil2.gif");
  coil_p = loadImage("coil_p.gif");
  shadow = loadImage("shadow.gif");
  size(400, 600);
  frameRate(1/dt);
  float initX = 0.5*width;
  for (int i=0;i<cnum;i++) {
    cm[i] = new calc_maglev(random(initY), 0, random(initX), 0, random(m_coil_init));
  }
  for (int i=0;i<num_add;i++) {
    ma[i] = new m_added(0, 0, 0);
  }
}
void draw() {
  background(255);
  cm[0].runge_kutta(1);
  cm[0].runge_kutta(0);
  cm[0].update();
  image(coil_p, cm[0].xpos-0.5*img, cm[0].ypos -(coil_p.height*img/coil_p.width), img, (coil_p.height*img/coil_p.width));
  if (pmod > 0){
    float eye_x = cm[0].xpos-0.5*img+(img/coil_p.width)*365;
    float eye_y = cm[0].ypos -(coil_p.height*img/coil_p.width)+(img/coil_p.height)*60;
    eye_x += ((mouseX - eye_x)/abs(mouseX - eye_x))*3*(1 - (mouseX - eye_x)/width);
    eye_y += ((mouseY - eye_y)/abs(mouseY - eye_y))*3*(1 - (height-mouseY - eye_y)/height);
    ellipse(eye_x , eye_y, 2, 2);//365,150
  }
  image(shadow, cm[0].xpos-0.5*img, height-(shadow.height*img/shadow.width)-0.3*img, img, (shadow.height*img/shadow.width));
  for (int i=1;i<cnum;i++) {
    cm[i].runge_kutta(1);//y
    cm[i].runge_kutta(0);//x
    cm[i].update();
    image(coil, cm[i].xpos-0.5*img, cm[i].ypos -(coil.height*img/coil.width), img, (coil.height*img/coil.width));
    image(shadow, cm[i].xpos-0.5*img, height-(shadow.height*img/shadow.width)-0.3*img, img, (shadow.height*img/shadow.width));
    if(param > 0) {
      fill(0, 0, 255);
      printParam(cm[i].m_coil, 3, " [Wb] ", (int)(cm[i].xpos)+10, (int)(cm[i].ypos -1.5*(coil.height*img/coil.width)));
    }
  }
  for (int i=0;i<m_num;i++) {
    if (ma[i].mag > 0) fill(color(255, 0, 0, 50));
    if (ma[i].mag < 0) fill(color(0, 0, 255, 50));
    rect(ma[i].x0-10, height-ma[i].y0-10, 20, 20);//drawing rect
  }
  if(param > 0){
      
    //add for button
    button_update(mouseX, mouseY);
    
    fill(rect1Color);
    if(rect1Over) fill(rect1Highlight);
    rect(rect1X, rect1Y, rectSize, rectSize);
    
    fill(rect2Color);
    if(rect2Over) fill(rect2Highlight);
    rect(rect2X, rect2Y, rectSize, rectSize);
    
    fill(100);
    rect(rect1X, rect1Y+rectSize, 2*rectSize, rectSize);//box for m_base
    fill(255);
    rect(rect1X, rect1Y+2*rectSize, 2*rectSize, rectSize); 
    image(coil, rect1X, rect1Y+2*rectSize, 2*rectSize, rectSize);
    //add for button
    fill(0);
    //int t1 = (int)t;
    int offset = 10 + 3*rectSize;
    printParam(t, 2, " [sec]", 0, 20+offset);
    printParam(cm[0].xpos/ratio, 2, " = xpos  [m]", 0, 50+offset);
    printParam((height - cm[0].ypos)/ratio, 2, " = ypos  [m]", 0, 60+offset);
    printParam(cm[0].m_coil, 3, " [Wb]  coil  [press key{m}]", 0, 80+offset);
    printParam(m_total, 3, " [Wb]  total", 0, 90+offset);
    printParam(m_base, 4, " [Wb]  base [press key{b}] ", 0, 100+offset);
    printParam((cm[0].y1)/ratio, 2, " = v  [m/s]", 0, 170+offset);
    printParam(cm[0].Fx, 3, " =Fx  [N]", 0, 140+offset);
    printParam(cm[0].Fy, 3, " =Fy  [N]", 0, 150+offset);
    printParam(m_add, 3, " = [Wb]  pointer  [press key{n}]", 0, 110+offset);
    printParam(max_Fx, 2, " = max_Fx  [N]", 0, 190+offset);
    printParam(max_Fy, 2, " = max_Fy  [N]", 0, 200+offset);
    printParam(max_u, 2, " = max_u  [m/s]", 0, 220+offset);
    printParam(max_v, 2, " = max_v  [m/s]", 0, 230+offset);
    printParam(cnum, 0, " coil", 0, 250+offset);
  }
  fill(0, 255, 0);
  if (cm[0].y0/ratio > 1000)text("Congraturation!!  Coil becomes star!!", 180, 200);
  fill(c_add);
  rect(mouseX-10, mouseY-10, 20, 20);//drawing pointer
  if(chase_flag>0) chase();
  t+= dt;
}
void chase(){
    cm[0].x0 += 0.05*(mouseX-cm[0].x0);
    cm[0].y0 += 0.05*(height - mouseY-cm[0].y0);
    cm[0].x1 = mouseX-cm[0].x0;
    cm[0].y1 = height - mouseY-cm[0].y0;
}
void genCoil(){
  cnum++;
  float initX = 0.5*width;
  cm[cnum-1] = new calc_maglev(random(initY), 0, random(initX), 0, random(m_coil_init));
  }
  //add for button
void button_update(int x, int y) {
   rect1Over = rect2Over = rect3Over = rect4Over = rect5Over =  false;
  if( overRect(rect1X, rect2Y, rectSize, rectSize) ) rect1Over = true;
  else if ( overRect(rect2X, rect2Y, rectSize, rectSize) ) rect2Over = true;
  else if ( overRect(rect1X, rect2Y+rectSize, rectSize, rectSize) ) rect3Over = true;
  else if ( overRect(rect1X+rectSize, rect2Y+rectSize, rectSize, rectSize) )  rect4Over = true;
  else if ( overRect(rect1X, rect2Y+2*rectSize, 2*rectSize, rectSize) )  rect5Over = true;
}
boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}  //add for button
void keyPressed() { 
  if (key == 'y') { 
    cm[0].y0 = cm[0].y0 + 10;
  } 
  if (key == 'Y') { 
    cm[0].y0 = cm[0].y0 - 10;
  } 
  if (key == 'm') { 
    cm[0].m_coil = cm[0].m_coil*1.1;
  } 
  if (key == 'M') { 
    cm[0].m_coil = cm[0].m_coil*0.9;
  } 
  if (key == 'b') { 
    m_base = m_base*1.1;
  }
  if (key == 'B') { 
    m_base = m_base*0.9;
  }
  if (key == 'c') { 
    c_add = color(0, 0, 0, 60);
    m_add = 0.0;
    pmod = 1;
  }
  if (key == 'n') { 
    m_add = 1.1*m_add;
  }    
  if (key == 'N') { 
    m_add = 0.9*m_add;
  } 
  if (key == 'p') { 
    pmod = -pmod;
  }  
  if (key == ' ') {
  chase();
  }
  if (key == 's') param = -1*param;
}
void mousePressed() {
    //add for button
  if(rect1Over) {
    c_add = color(0, 0, 255, 210); 
    m_add = -0.5;
    flag_mag = 0;
    chase_flag = -1;
  }
  else if(rect2Over) {  
    c_add = color(255, 0, 0, 210);
    m_add = 0.5;
    flag_mag = 1;
    chase_flag = -1;
  }  //add for button
  if((m_add == 0)&&(pmod > 0)) chase_flag = -chase_flag;//switch flag
  if((pmod > 0)&&(rect5Over)&&(cnum<cnum_max))  {
    genCoil();//switch flag
    chase_flag = -1;
  }
  
  if(rect3Over) {
    m_base = 0.9*m_base;
    chase_flag = -1;
  }
  if(rect4Over) {
    m_base = 1.1*m_base;
    chase_flag = -1;
  }  
  if ((pmod <0)&&!(m_add == 0)) {
    ma[m_num].point();
    m_num++;
    if (m_num > num_add-1) m_num--;
  }
}


