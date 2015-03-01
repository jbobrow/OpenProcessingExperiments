
/////////////////////////////////////////////////////////////////////////////
// Example 1.11: Motion 101 å� é��åº¦ã�®å¯¾è©±ç��å�¦ç��(ã�·ã��ã��ã�³, p.50)
// è¤�æ�°ç�©ä½�ï¼�å¤�ä½�ï¼�
/////////////////////////////////////////////////////////////////////////////
////////// å¤§å��å¤�æ�°å®£è¨�ã�¨ã�ªã�¢
////Mover mover;  //å¤§å��å¤�æ�°ã�®å®£è¨�ï¼�Moverå��ã�®ã��å¤�æ�°ã�� moverï¼�
Mover[] movers = new Mover[20];

////////// ã�»ã��ã��ã�¢ã��ã��ã�¨ã�ªã�¢
void setup(){
  size(620,360);       //è¡¨ç¤ºçª�ã�µã�¤ã�ºã�®æ��å®�
  colorMode(HSB);
  ////mover = new Mover(); //ã�ªã��ã�¸ã�§ã�¯ã��ï¼�ã�¤ã�³ã�¹ã�¿ã�³ã�¹ï¼�moverã�®ç��æ��
  for(int i = 0; i < movers.length; i++){
    movers[i] = new Mover();
  }
}

////////// ã�¡ã�¤ã�³ã�«ã�¼ã��ã�³ï¼�ç�¡é��ã�«ã�¼ã��ï¼�
void draw(){
  background(0);    //è��æ�¯è�²ã��ç�½è�²ã�«
  
  for(int i = 0; i < movers.length; i++){
    movers[i].update();     //ã�ªã��ã�¸ã�§ã�¯ã��moverã�®ç�¶æ��ã�®æ�´æ�°
    movers[i].checkEdges(); //çª�ã�®ç«¯ã��ã�©ã��ã��ã��ã��ã�§ã��ã�¯
    movers[i].display();    //è¡¨ç¤º
  }
}

///////////////////// é�¢æ�°ã��ã�¯ã�©ã�¹ã�®å®�ç¾©ã�¨ã�ªã�¢
class Mover{ //// ã�¯ã�©ã�¹Moverã�®å®�ç¾©
  PVector location;     //ä½�ç½®ï¼�PVectorå��ï¼�
  PVector velocity;     //é��åº¦ï¼�PVectorå��ï¼�
  PVector acceleration; //å� é��åº¦ï¼�PVectorå��ï¼�
  float   topspeed;     //é��åº¦ã�®å¤§ã��ã��å�¶é��ï¼�floatå��ï¼�
  float   mass;         //è³ªé��
  
  Mover(){ //ã�³ã�³ã�¹ã��ã�©ã�¯ã�¿ï¼�å��æ��ç�¶æ��ã�®è¨­å®�ã�«ç�¨ã��ã��ã��ã��ï¼�
    location = new PVector(random(width), random(height)); //å��æ��ä½�ç½®ã�®è¨­å®�
    velocity = new PVector(0,0);               //å��æ��é��åº¦ã�®è¨­å®�
    topspeed = 10;  //é��åº¦å�¶é��
    mass = random(10, 50);
  }
  
  void update(){ //ç�¶æ��æ�´æ�°ã�¡ã�½ã��ã��
    PVector mouse = new PVector(mouseX, mouseY); //ã��ã�¦ã�¹ã��ã�¤ã�³ã�¿ã�®ä½�ç½®ã��ã�¯ã��ã�«
    PVector dir = PVector.sub(mouse,location);   ////ã��staticã��
    dir.normalize();     //æ­£è¦�å��
    dir.mult(10/mass);   //ã�¹ã�±ã�¼ã�ªã�³ã�°
    acceleration = dir;  //å� é��
    
    velocity.add(acceleration); //é��åº¦ã�¯å� é��åº¦ã�«ã��ã�£ã�¦å¤�å��ã��ã��
    velocity.limit(topspeed);   //é��åº¦ã�¯ topspeed ã�«ã��ã�£ã�¦å�¶é��ã��ã��ã��
    location.add(velocity);     //ä½�ç½®ã�¯é��åº¦ã�«ã��ã�£ã�¦å¤�å��ã��ã��
  }
  
  void display(){ //è¡¨ç¤ºç�¨ã�¡ã�½ã��ã��
    stroke(0);
    fill(mass*5, 255, 255);
    ellipse(location.x, location.y, mass, mass);
  }
  
  void checkEdges(){ //çª�ã�®ç«¯ã��ã�©ã��ã��ã��ã��ã�§ã��ã�¯ã��ã��ã��ã��ã�®ã�¡ã�½ã��ã��
    if(location.x > width){     //ã��ã��ã��å�³ã�«ã�¯ã�¿å�ºã��ã��ã��
      location.x = 0;
    } else if(location.x < 0){  //ã��ã��ã��å·¦ã�«ã�¯ã�¿å�ºã��ã��ã��
      location.x = width;
    }
    
    if(location.y > height){    //ã��ã��ã��ä¸�ã�«ã�¯ã�¿å�ºã��ã��ã��
      location.y = 0;
    } else if(location.y < 0){  //ã��ã��ã��ä¸�ã�«ã�¯ã�¿å�ºã��ã��ã��
      location.y = height;
    }
  }
}
