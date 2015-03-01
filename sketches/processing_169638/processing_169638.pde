
///////////////////////////////////////////////////////////////
// Inspired by Example 2.8 (ã�·ã��ã��ã�³, p.84) 
// repulsive particles å��ç�ºã��ã��ã��ç²�å­�ã��ã�¡
// modified version
///////////////////////////////////////////////////////////////
int N = 60; //Moverã�ªã��ã�¸ã�§ã�¯ã��ã�®æ�°
Mover[] movers = new Mover[N]; //Moverã�¯ã�©ã�¹ã�®ã�ªã��ã�¸ã�§ã�¯ã��ã�®é��å��
Attractor a;                   //Attractorã�¯ã�©ã�¹ã�®ã�ªã��ã�¸ã�§ã�¯ã��
float  G = 30.0;               //é��å��å®�æ�°
float  Mass_p = 1.0;           //ç²�å­�ã��ã�¡ã�®è³ªé��
float  velo_MAX = 4;           //é��ã��å�¶é��ï¼�ã��ã��ã��è¶�ã��ã��ã��ã�ªã�»ã��ã��ï¼�
float  coef = 0.01;            //æ��å��ä¿�æ�°
/////////////////////////////////////
void setup(){ ////////ã�»ã��ã��ã�¢ã��ã��
  size(500, 500); //çª�ã�®ã�µã�¤ã�ºã��æ��å®�
  colorMode(HSB); //ã�«ã�©ã�¼ã�¢ã�¼ã��ã�¯HSBã�¢ã�¼ã��ã�§
  
  for(int i = 0; i < N; i++){
    movers[i] = new Mover(Mass_p, random(width), random(height)); //ã�ªã��ã�¸ã�§ã�¯ã��ç��æ��
  }
  
  a = new Attractor(); //ã�ªã��ã�¸ã�§ã�¯ã��ç��æ��
}
/////////////////////////////////////
void draw(){ ////////ã�¡ã�¤ã�³ã�«ã�¼ã��
  //background(255);
  fill(200,20);            //é��æ��åº¦æ��å®�
  rect(0,0,width,height);  //ç®±ã��æ��ã��
  
  a.display(); //attractorã�®è¡¨ç¤º
    
  for(int i = 0; i < N; i++){
     
    PVector force = a.attract(movers[i]); //attractor a ã��mover[i]ã�¸å��ã�¼ã��å��ã��è¨�ç®�
    movers[i].applyForce(force);   //å��ã��å�°å� 
    
    if(mousePressed){ ////ã��ã��ã��ã��ã�¦ã�¹ã��ã�¿ã�³ã��æ�¼ã��ã��ã��ã��
      float speed = movers[i].velocity.mag();
      float dragMag = coef * speed * speed;
      PVector dragForce = movers[i].velocity.get();
      dragForce.mult(-1);
      dragForce.normalize();
      dragForce.mult(dragMag);
      movers[i].applyForce(dragForce);
      textSize(24);
      fill(60,10);
      text("Viscosity", width/2-60, height-50);
    }
    
    for(int j = 0; j < N; j++){  //ç�¸äº�ä½�ç�¨å�¦ç��
      if(i != j){
        PVector force_m = movers[j].attract(movers[i]); //ç�©ä½� j ã��ç�©ä½� i ã�«å��ã�¼ã��å��ã��è¨�ç®�
        movers[i].applyForce(force_m);                  //ç�©ä½� i ã�¸ã�®å��ã�®é�©ç�¨
      }
    }
    
    movers[i].update();                //ç�©ä½�ã�®ç�¶æ��ã��æ�´æ�°
    movers[i].checkVelocityForReset(); //å�¶é��é��ã��ã��è¶�ã��ã��ã��ã�ªã�»ã��ã��ã��ã��
    movers[i].display();               //ç�©ä½�ã�®è¡¨ç¤º
    movers[i].periodicBoundary();      //å�¨æ��ç��å¢�ç��æ�¡ä»¶ã�®å®�ç�¾
  }
  textSize(15);
  fill(80);
  text("Viscosity emerges by pressing the mouse button", 20, height - 20);
  fill(150,255,255);
  text("Repulsive particles in cone potential", 20, 20);
}
/////////////////////////////////////
//// ã�¯ã�©ã�¹ã��é�¢æ�°ã�®å®�ç¾©
/////////////////////////////////////
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
  
  ////////
  PVector attract(Mover m){ ////å¼�å��ï¼�ã��ã��ã�§ã�¯æ�¥å��ï¼�é��é�»å��ç�ºå��ï¼�
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag(); //ç�©ä½�ã�¨attractorã�®è·�é�¢ã��å��å¾�
    force.normalize();            //è¦�æ ¼å��ï¼�é�·ã��ã��ï¼�ã�«ï¼�
    float strength = -(G * mass * m.mass) / (distance * distance); //æ�¥å��
    force.mult(strength);         //å��ä½�ã��ã�¯ã��ã�«ã�«ä¸�æ��å¼�å��ã�®å¤§ã��ã��ã��æ�¸ã��ã��
    return force;
  }
  ////////
  
  void update(){   ////ç�¶æ��æ�´æ�°
    velocity.add(acceleration); //å� é��åº¦ã��ã��ç©�å��ã��ã��ã�¦é��åº¦ã�«
    location.add(velocity);     //é��åº¦ã��ã��ç©�å��ã��ã��ã�¦ä½�ç½®ã�«
    acceleration.mult(0);       //å� é��åº¦ã�®ã�¯ã�ªã�¢ï¼�ã�¼ã�­ã��ã��ã��ç®�ï¼�ï¼�æ¯�å��ã�¯ã�ªã�¢ï¼�
  }
  
  void display(){ ////è¡¨ç¤º
    stroke(180,255,255); //ã�µã�¡ã�®è�²ã��æ��å®�
    fill(100, 255, 255); //ä¸­èº«ã�®è�²ã��æ��å®�
    ellipse(location.x, location.y, 10, 10);
  }
  
  void periodicBoundary(){ ////å�¨æ��ç��å¢�ç��æ�¡ä»¶ã�®å®�ç�¾
    if(location.x > width){
      location.x = 0;
    } else if(location.x < 0){
      location.x = width;
    }
    
    if(location.y > height){
      location.y = 0;
    } else if(location.y < 0){
      location.y = height;
    }
  }
  
  void checkVelocityForReset(){
    if(velocity.mag() > velo_MAX){
      velocity.mult(0);
    }
  }
}
////////
class Attractor{ ////////Attractorã�¯ã�©ã�¹ã�®å®�ç¾©
  float mass;       //è³ªé��
  PVector location; //ä½�ç½®
  
  Attractor(){ //ã�³ã�³ã�¹ã��ã�©ã�¯ã�¿
    location = new PVector(width/2, height/2); //ä½�ç½®ã�¯çª�ã�®ä¸­å¤®
    mass = 1;
  }
  
  PVector attract(Mover m){ ////å¼�å��
    PVector force = PVector.sub(location, m.location);
    ///float distance = force.mag(); //ç�©ä½�ã�¨attractorã�®è·�é�¢ã��å��å¾�
    float distance = 20;             //å�ºå®�å�¤ã��ã�ªã��ã�¡ï¼�ã�³ã�¼ã�³ï¼�å��é��ï¼�ã��ã��ã�³ã�·ã�£ã�«
    force.normalize();               //è¦�æ ¼å��ï¼�é�·ã��ã��ï¼�ã�«ï¼�
    float strength = (G * mass * m.mass) / (distance * distance); //å¼�å��
    force.mult(strength);           //å��ä½�ã��ã�¯ã��ã�«ã�«å¼�å��ã�®å¤§ã��ã��ã��æ�¸ã��ã��
    return force;
  }
  
  void display(){ ////è¡¨ç¤º
    noStroke();
    fill(20, 5);
    ellipse(location.x, location.y, width, height);
  }
}
////////
void mouseReleased(){ ///ã��ã�¦ã�¹ã��ã�¿ã�³ã��é�¢ã��ã��ã��å��ç²�å­�ã�®é��åº¦ã��ã�©ã�³ã��ã� ã�«ã�»ã��ã��
  for(int i = 0; i < N; i++){
    movers[i].velocity.set(random(-1,1),random(-1,1),0); 
    // "the 3rd argument ",0" is necessary in Processing 1.5.1
    // while, it is not necessary for Processing 2
  }
}
////////
