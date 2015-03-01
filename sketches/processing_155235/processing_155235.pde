
Ship player1 = new Ship(0);
Ship player2 = new Ship(1);
Starfield starfield1 = new Starfield(50,255,.5);
Starfield starfield2 = new Starfield(50,100,0);
Starfield starfield3 = new Starfield(50,150,.25);
ArrayList<Laser> lasers;

float spin = 0;
float rectX = 250;
float rectY = 250;
float speed = 0;
int strafe = 0;
int alpha = 255;

float tempSpeed=0;
int strafeCounter = 0;

void setup(){
  size(800, 600);
  rectMode(CENTER);
  frameRate(60);
  noStroke();
  player1.init();
  player2.init();
}

int p = 0;
void draw() {
  rectMode(CENTER);
  fill(0,0,0,alpha);
  rect(width/2,height/2,width,height);
  starfield1.update();
  starfield2.update();
  starfield3.update();
  player1.drawShip();
  player2.drawShip();
  collide();
}

void collide()
{
  float[] shipBounds = new float[8];
  for (int i=0; i<lasers.size(); i++)
  {
    if (lasers.get(i).getPlayer() == 0){  
      shipBounds = player2.getBounds();
      rectMode(CORNERS);
      if ((lasers.get(i).getX() < shipBounds[0] && lasers.get(i).getY() > shipBounds[1]) && (lasers.get(i).getX() > shipBounds[4] && lasers.get(i).getY() < shipBounds[5])) 
      {
        player2.setIsHit(true);
      }
    } 
    else {
      shipBounds = player1.getBounds();
      rectMode(CORNERS);
      if ((lasers.get(i).getX() < shipBounds[0] && lasers.get(i).getY() > shipBounds[1]) && (lasers.get(i).getX() > shipBounds[4] && lasers.get(i).getY() < shipBounds[5])) 
      {
        player1.setIsHit(true);                                                 
      }
    }
  }
}
void keyPressed(){
  print(keyCode+"\n");
  if (keyCode == player1.getUpButton())
  {
    player1.setUp(true);
  }
  
  if (keyCode == player1.getDownButton())
  {
    player1.setDown(true);
  }
  
  if (keyCode == player1.getLeftButton())
  {
    player1.setLeft(true);
  }
  
  if (keyCode == player1.getRightButton())
  {
    player1.setRight(true);
  }
  
  if (keyCode == player1.getLeftStrafe())
  {
    player1.setLeftStrafe(true);
  }
  
   if (keyCode == player1.getRightStrafe())
  {
    player1.setRightStrafe(true);
  }
  
  if (keyCode == player1.getShootButton())
  {
    player1.setIsShooting(true);
  }
   if (keyCode == player2.getUpButton())
  {
    player2.setUp(true);
  }
  
  if (keyCode == player2.getDownButton())
  {
    player2.setDown(true);
  }
  
  if (keyCode == player2.getLeftButton())
  {
    player2.setLeft(true);
  }
  
  if (keyCode == player2.getRightButton())
  {
    player2.setRight(true);
  }
  
  if (keyCode == player2.getLeftStrafe())
  {
    player2.setLeftStrafe(true);
  }
  
   if (keyCode == player2.getRightStrafe())
  {
    player2.setRightStrafe(true);
  }
  
  if (keyCode == player2.getShootButton())
  {
    player2.setIsShooting(true);
  }
  
  if (keyCode == 80)
  {
    player1.setIsHit(false);
    player1.resetExplode();
    player2.setIsHit(false);
    player2.resetExplode();
  }
}

void keyReleased(){
  if (keyCode == player1.getUpButton())
  {
    player1.setUp(false);
  }
  
  if (keyCode == player1.getDownButton())
  {
    player1.setDown(false);
  }
  
  if (keyCode == player1.getLeftButton())
  {
    player1.setLeft(false);
  }
  
  if (keyCode == player1.getRightButton())
  {
    player1.setRight(false);
  }
  
  if (keyCode == player1.getLeftStrafe())
  {
    player1.setLeftStrafe(false);
    alpha = 255;
    player1.setSpeed(tempSpeed);
  }
  
  if (keyCode == player1.getRightStrafe())
  {
    player1.setRightStrafe(false);
    alpha = 255;
    player1.setSpeed(tempSpeed);
  }
  
  if (keyCode == player1.getShootButton())
  {
    player1.setIsShooting(false);
  }
  
  if (keyCode == player2.getUpButton())
  {
    player2.setUp(false);
  }
  
  if (keyCode == player2.getDownButton())
  {
    player2.setDown(false);
  }
  
  if (keyCode == player2.getLeftButton())
  {
    player2.setLeft(false);
  }
  
  if (keyCode == player2.getRightButton())
  {
    player2.setRight(false);
  }
  
  if (keyCode == player2.getLeftStrafe())
  {
    player2.setLeftStrafe(false);
    alpha = 255;
    player2.setSpeed(tempSpeed);
  }
  
  if (keyCode == player2.getRightStrafe())
  {
    player2.setRightStrafe(false);
    alpha = 255;
    player2.setSpeed(tempSpeed);
  }
  
  if (keyCode == player2.getShootButton())
  {
    player2.setIsShooting(false);
  }
}
public class Laser{
  Laser(float x, float y, float spin, int player){
    this.x = x;
    this.y = y;
    this.spin = spin;
    this.player = player;
  }
  
  void shoot(){
    setBounds();
    pushMatrix();
    translate(x,y);
    rotate(radians(spin));
    rectMode(CENTER);
    if (player == 0)
      fill(255,0,0);
    else
      fill(0,255,0);
    rect(20,0,4,4);
    prevX = x;
    prevY = y;
    x+=cos(radians(spin))*speed;
    y+=sin(radians(spin))*speed;
    popMatrix();
   }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
  
  int getPlayer(){
    return player;
  }
  
  void setBounds()
  {
    //top right
    bounds[0] = x+22;
    bounds[1] = y+2; 
    //bottom right
    bounds[2] = x+22;
    bounds[3] = y-2;
    //bottom left
    bounds[4] = x+18;
    bounds[5] = y-2;
    //top left
    bounds[6] = x+18;
    bounds[7] = y-2;
  }
  
  float[] getBounds()
  {
    return bounds;
  }
  
  float getSpeed()
  {return speed;}
  
  float getSpin(){return spin;}
 
  private float prevX;
  private float prevY;
  private float x;
  private float y;
  private float speed = 5;
  private float spin;
  private int player;
  private float[] shipBounds = new float[8];
  private float[] bounds = new float[8];
}
public class Ship {
  
  Ship(int Player){
    player = Player;
    red = 0;
    green = 0;
    blue = 0;
    strafeCounter = 0;
  }
  
    public void init() {
      //player1
      if (player == 0)
      {
        red = 255;
        spin = 90;
        upButton = 87; //w
        downButton = 83; //s
        leftButton = 65; //a
        rightButton = 68; //d
        leftStrafeButton = 67; //q
        rightStrafeButton = 66; //e
        shootButton = 86; //c
        Xcoordinate = 50;
        Ycoordinate = 50;
      }
      
      //player2
      else if (player == 1)
      {
        green = 255;
        spin = -90;
        upButton = 38; //i
        downButton = 40; //k
        leftButton = 37; //j
        rightButton = 39; //l
        leftStrafeButton = 188; //u
        rightStrafeButton = 191; //o
        shootButton = 190; //. //190WA
        Xcoordinate = width-50;
        Ycoordinate = height-50;
      }
      
      lasers = new ArrayList<Laser>();
    }
    
    public void drawShip() {
      if (!isHit){
        setBoundCorners();
        pushMatrix();
        if (right == true)
          spin +=3.5;
        if (left == true)
          spin+=-3.5;
        strafeLeft();
        strafeRight();
         
        translate(Xcoordinate, Ycoordinate);
        rotate(radians(spin));
        
        if (up == true)
        {
          speed += .04;
          if (speed > 6)
            speed = 6;
          Xcoordinate += cos(radians(spin))*speed;
          Ycoordinate += sin(radians(spin))*speed; 
        }
        if (up == false)
        {
          Xcoordinate += cos(radians(spin))*speed;
          Ycoordinate += sin(radians(spin))*speed; 
          if (speed > 0)
            speed -= .1;
          if (speed < 0)
            speed = 0;
        }
        
        fill(red, green, blue);
        rect(-9,0,10,25);
        triangle(-5,12,17,0,-5,-12);
        fill(100,90);
        popMatrix();
        
        if (Xcoordinate<0) Xcoordinate=0;
        if (Xcoordinate>width) Xcoordinate=width;
        if (Ycoordinate<0) Ycoordinate=0;
        if (Ycoordinate>height) Ycoordinate=height;
        
        for (int i = 0; i<lasers.size(); i++)
          {
            lasers.get(i).shoot();
                    
            if (lasers.get(i).getY()>height || lasers.get(i).getY()<0
            || lasers.get(i).getX()>width || lasers.get(i).getX()<0)
              lasers.remove(i);
          }
          
        if (isOnCooldown())
          {
              coolingDown();
          }
        else if (isShooting && !isOnCooldown())
          {
              lasers.add(new Laser(Xcoordinate, Ycoordinate, spin, player));
              setOnCooldown(true);
              //setIsShooting(false);
          }
      }
      
      //If hit
      else
      {
        explode(Xcoordinate,Ycoordinate);
      }
    }
    
    public void strafeLeft()
    {
      if (isStrafeLeft == true)
      {
        if (strafeCounter == 1)
        {
          tempSpeed = speed;
          speed=0;
        }
        
        if (strafeCounter < 10)
        {
          strafe = 20;
          alpha = 50;
        }
        Xcoordinate += cos(radians(spin-90))*strafe;
        Ycoordinate += sin(radians(spin-90))*strafe;
        strafeCounter++;
        
      }
      
      if (strafeCounter >= 10){
        speed = tempSpeed;
        strafeCounter++;
        strafe = 0;
        if (strafeCounter > 180)
          strafeCounter = 0;
      }
      //END_STRAFE
    }
    
    public void strafeRight()
    {
      //STRAFE
       if (isStrafeRight == true)
      {
        if (strafeCounter == 1)
        {
          tempSpeed = speed;
          speed=0;
        }
        
        if (strafeCounter < 10)
        {
          strafe = 20;
          alpha = 50;
        }
        Xcoordinate += cos(radians(spin+90))*strafe;
        Ycoordinate += sin(radians(spin+90))*strafe;
        strafeCounter++;
        }
      
      if (strafeCounter >= 10){
        speed = tempSpeed;
        strafeCounter++;
        strafe = 0;
        if (strafeCounter > 180)
          strafeCounter = 0;
      }
      //END_STRAFE
    }
    
    public int getUpButton(){
      return upButton;
    }
    
    public int getDownButton(){
      return downButton;
    }
    
    public int getLeftButton(){
      return leftButton;
    }
    
    public int getRightButton(){
      return rightButton;
    }
    
    public int getLeftStrafe() {
      return leftStrafeButton;
    }
    
    public int getRightStrafe() {
      return rightStrafeButton;
    }
    
    public int getShootButton() {
      return shootButton;
    }
    
    public void setUp(boolean bool){
      up = bool;
    }
    
    public void setDown(boolean bool){
      down = bool;
    }
    
    public void setLeft(boolean bool){
      left = bool;
    }
    
    public void setRight(boolean bool){
      right = bool;
    }
    
    public void setLeftStrafe(boolean bool){
      isStrafeLeft = bool;
    }
    
    public void setRightStrafe(boolean bool){
      isStrafeRight = bool;
    }
    
    public void setSpeed(float Speed){
      speed = Speed;
    }
    
    public float getXcoordinate(){
      return Xcoordinate;
    }
    
    public float getYcoordinate(){
      return Ycoordinate;
    }
    
    public float getSpin(){
      return spin;
    }
    
    public boolean getIsShooting(){
      return isShooting;
    }
  
    public void setIsShooting(boolean bool){
      isShooting = bool;
    }
    
    boolean isOnCooldown(){
    return onCooldown;
    }
  
    void setOnCooldown(boolean bool){
      onCooldown = bool;
    }
    
    void coolingDown(){
      cooldownCounter++;
      if (cooldownCounter == 15){
        cooldownCounter = 0;
        setOnCooldown(false);
      }
    }
    
    void setBoundCorners(){
      //topright
      Xcorners[0] = Xcoordinate +15;
      Ycorners[0] = Ycoordinate -15;
      //bottom right
      Xcorners[1] = Xcoordinate +15;
      Ycorners[1] = Ycoordinate +15;
      //bottom left
      Xcorners[2] = Xcoordinate-15;
      Ycorners[2] = Ycoordinate+15;
      //topLeft
      Xcorners[3] = Xcoordinate -15;
      Ycorners[3] = Ycoordinate -15;
    }
    
    void setIsHit(boolean bool)
    {
      isHit = bool;
    }
    
    void explode(float x, float y)
    {
       if (set == false){
         x1=0;x2=0;x3=0;x4=0;x5=0;x6=0;y1=0;y2=0;y3=0;y4=0;y5=0;y6=0;
         set = true;
       }
       else{
       rectMode(CENTER);
       pushMatrix();
       translate(Xcoordinate,Ycoordinate);
       rotate(radians(spin+=4));
       fill(red,green,blue);
       rect(x1,y1,10,10);
       rect(x2,y2,10,10);
       rect(x3,y3,10,10);
       rect(x4,y4,10,10);
       rect(x5,0,10,10);
       rect(x6,0,10,10);
       rect(0,y5,10,10);
       rect(0,y6,10,10);
       x1+=10; x2+=10; x3-=10; x4-=10; x5+=10; x6-=10;
       y1+=10; y2-=10; y3+=10; y4-=10; y5+=10; y6-=10;
       popMatrix();
      }
    }
    
    void resetExplode()
    {
      set=false;
      x1=0;x2=0;x3=0;x4=0;x5=0;x6=0;y1=0;y2=0;y3=0;y4=0;y5=0;y6=0;
    }
    
    float[] getBounds(){
      float[] a = new float[8];
      for (int i = 0; i < 4; i++)
      {
        a[i*2] = Xcorners[i];
        a[i*2+1] = Ycorners[i];
      }
      return a;
    }
 
    
    private int player;
    private int strafeCounter;
    private int red, green, blue;
    private float Xcoordinate, Ycoordinate, spin, speed;
    private int upButton, downButton, leftButton, rightButton, leftStrafe, rightStrafe, shootButton;
    private boolean up=false,down=false,left=false,right=false;
    private int leftStrafeButton, rightStrafeButton;
    private boolean isStrafeLeft=false, isStrafeRight=false;
    private boolean isShooting = false;
    private boolean onCooldown=false;
    private float[] Xcorners = new float[4];
    private float[] Ycorners = new float[4];
    private float[] boundCorners = new float[8];
    private int cooldownCounter = 0;
    private boolean isHit = false;
    private boolean set = false;
    private float x1,x2,x3,x4,x5,x6,y1,y2,y3,y4,y5,y6,xTran,yTran;
  }


class Starfield{
  
  Starfield(int size, int gray, float speed){
    this.size = size;
    this.gray = gray;
    this.speed = speed;
    h = new float[size];
    w = new float[size];
    w2 = new float[size];
    wTemp = new float[size];
    for (int i =0; i<50; i++){
      h[i] = random(0,600);
      w[i] = random(0,800);
      w2[i] = w[i]-800;
      wTemp[i] = w[i]-800;
      lastStar = findMin(w);
      lastStar2 = lastStar-800;
    }
  }
  
  void update(){
    fill(gray);
    lastStar+=speed;
    lastStar2+=speed;
    rectMode(CENTER);
    for(int i=0; i<size; i++){
      w[i]+=speed;
      w2[i]+=speed;
      rect(w[i],h[i],2,2);
      rect(w2[i],h[i],2,2);
    }
    if (lastStar > width)
    {
      for (int i=0; i<size; i++)
      {
        w[i]=wTemp[i];
      }
      lastStar=findMin(w);
    }
    
    if (lastStar2 > width)
    {
      for (int i=0; i<size; i++)
      {
        w2[i]=wTemp[i];
      }
      lastStar2=findMin(w2);
    }
    
  }
  
  float findMin(float[] a)
  {
    float min = a[0];
    
    for(int i = 0; i<50; i++)
    {
      if (a[i] < min)
        min = a[i];
    }
    
    return min;
  }

  private float[] h;
  private float[] w;
  private float[] w2;
  private float[] wTemp;
  private float lastStar, lastStar2;
  private float speed;
  private int size;
  private int gray;
}


