
///////////////////////////////////////////////////////////////
// Example 2.7 (ã�·ã��ã��ã�³, p.81) å¼�å��ï¼�å¤�ä½�
// slightly modified
///////////////////////////////////////////////////////////////
int N = 10; //Moverã�ªã��ã�¸ã�§ã�¯ã��ã�®æ�°
Mover[] movers = new Mover[N]; //Moverã�¯ã�©ã�¹ã�®ã�ªã��ã�¸ã�§ã�¯ã��ã�®é��å��ã�®å®£è¨�
Attractor a;                   //Attractorã�¯ã�©ã�¹ã�®ã�ªã��ã�¸ã�§ã�¯ã��ã�®å®£è¨�
float  mass_MIN = 3;
float  mass_MAX = 6;
/////////////////////////////////////
void setup(){ ////////ã�»ã��ã��ã�¢ã��ã��
  size(960, 640); //çª�ã�®ã�µã�¤ã�ºã��æ��å®�
  colorMode(HSB); //ã�«ã�©ã�¼ã�¢ã�¼ã��ã�¯HSBã�¢ã�¼ã��ã�§ 
  
  int i=0;
  while(i < N){
    movers[i] = new Mover(random(mass_MIN,mass_MAX), 320-i*640/N, 0); //ã�ªã��ã�¸ã�§ã�¯ã��ç��æ��
    //movers[i] = new Mover(10, 320-i*640/N, 0); //ã�ªã��ã�¸ã�§ã�¯ã��ç��æ��
      i++;
  }
  a = new Attractor(); //ã�ªã��ã�¸ã�§ã�¯ã��ç��æ��
}
/////////////////////////////////////
void draw(){ ////////ã�¡ã�¤ã�³ã�«ã�¼ã��
  //background(255);
  fill(255,1);            //é��æ��åº¦æ��å®�
  rect(0,0,width,height); //ã��ã��ç¨�åº¦é��æ��ã�ªç®±ã��æ��ã��
  a.display(); //ã�¢ã��ã�©ã�¯ã�¿ã�®è¡¨ç¤º
     
  for(int i = 0; i < N; i++){
    PVector force = a.attract(movers[i]); //å¼�å��ã��è¨�ç®�
    movers[i].applyForce(force);   //å��ã��å�°å� 
     
    movers[i].update();            //ç�©ä½�ã�®ç�¶æ��ã��æ�´æ�°
    movers[i].display();           //ç�©ä½�ã�®è¡¨ç¤º
    movers[i].checkEdges();        //çª�ã�®ç«¯ã�«é�¢ã��ã��ã��ã�§ã��ã�¯
  }
}
/////////////////////////////////////
//// ã�¯ã�©ã�¹ã��é�¢æ�°ã�®å®�ç¾©
class Mover{ //////// Moverã�¯ã�©ã�¹ã�®å®�ç¾©
  PVector location;     //ä½�ç½®
  PVector velocity;     //é��åº¦
  PVector acceleration; //å� é��åº¦
  float   mass;         //è³ªé��
  float   s_max = 1.0;  //é��åº¦è¨­å®�ç¯�å�²
   
  Mover(float m, float x, float y){  //ã�³ã�³ã�¹ã��ã�©ã�¯ã�¿
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(random(-s_max, s_max),random(-s_max, s_max));
    acceleration = new PVector(0,0);
  }
   
  void applyForce(PVector force){  ////ã��ã�¥ã�¼ã��ã�³ã�®ç¬¬ï¼�æ³�å��
    PVector f = PVector.div(force, mass); //å��ã��å��ã��å��ã�£ã�¦è³ªé��ã�§é�¤ç®�
    acceleration.add(f);                  //å� é��åº¦ã�«å� ç®�
  }
   
  void update(){   ////ç�¶æ��æ�´æ�°
    velocity.add(acceleration); //å� é��åº¦ã��ã��ç©�å��ã��ã��ã�¦é��åº¦ã�«
    location.add(velocity);     //é��åº¦ã��ã��ç©�å��ã��ã��ã�¦ä½�ç½®ã�«
    acceleration.mult(0);       //å� é��åº¦ã�®ã�¯ã�ªã�¢ï¼�ã�¼ã�­ã��ã��ã��ç®�ï¼�ï¼�æ¯�å��ã�¯ã�ªã�¢ï¼�
  }
   
  void display(){ ////è¡¨ç¤º
    stroke(0); //ã�µã�¡ã�®è�²ã��æ��å®�
    fill(mass/mass_MAX*50 + 100, 255, 255); //ä¸­èº«ã�®è�²ã��æ��å®�
    ellipse(location.x, location.y, mass*4, mass*4); //è³ªé��ã�«å¿�ã��ã��å¤§ã��ã��ã�«
  }
   
  void checkEdges(){ ////ã�¦ã�¤ã�³ã��ã�¦ã�®ç«¯ã�«ã�¶ã�¤ã��ã�£ã��ç�©ä½�ã�®ã��ã�¦ã�³ã��ã�®å�¦ç��
    if(location.x > width){
      location.x = width;
      velocity.x *= -1; //é��åº¦ã�®xæ��å��ã��å��è»¢
      if(mass>=0)
      {
        mass-=1;
          if(mass<1)
            mass=0;
      }
      
    } else if(location.x < 0){
      location.x = 0;
      velocity.x *= -1; //é��åº¦ã�®xæ��å��ã��å��è»¢
      if(mass>=0)
      {
        mass-=1;
          if(mass<1)
            mass=0;
      }
    }
     
    if(location.y > height){
      location.y = height;
      velocity.y *= -1; //é��åº¦ã�®yæ��å��ã��å��è»¢
      if(mass>=0)
      {
        mass-=1;
          if(mass<1)
            mass=0;
      }
    } else if(location.y < 0){
      location.y = 0;
      velocity.y *= -1; //é��åº¦ã�®yæ��å��ã��å��è»¢
      if(mass>=0)
      {
        mass-=1;
          if(mass<1)
            mass=0;
      }
    }
  }
}
////////
class Attractor{ ////////Attractorã�¯ã�©ã�¹ã�®å®�ç¾©
  float mass;       //è³ªé��
  PVector location; //ä½�ç½®
  float G;          //é��å��å®�æ�°
  float mouse_loc_x, mouse_loc_y;  //mouse's location
  

  Attractor(){ //ã�³ã�³ã�¹ã��ã�©ã�¯ã�¿

    location = new PVector(width/2, height/2); //ä½�ç½®ã�¯mouse
    mass = 30;
    G =15.0;
  }
   
  PVector attract(Mover m){ ////ä¸�æ��å¼�å��ã��ã�¯ã��ã�«
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag(); //ç�©ä½�ã�¨attractorã�®è·�é�¢ã��å��å¾�
    force.normalize();            //è¦�æ ¼å��ï¼�é�·ã��ã��ï¼�ã�«ï¼�
    float strength = (G * mass * m.mass) / (distance * distance); //ä¸�æ��å¼�å��
    force.mult(strength);         //å��ä½�ã��ã�¯ã��ã�«ã�«ä¸�æ��å¼�å��ã�®å¤§ã��ã��ã��æ�¸ã��ã��
    return force;
  }
   
  void display(){ ////è¡¨ç¤º
    noStroke();
    fill(255,255,255);
    ellipse(location.x, location.y, mass*2, mass*2);
  }
}

void mouseDragged(){
  a.location.x = mouseX;
  a.location.y = mouseY;
}
