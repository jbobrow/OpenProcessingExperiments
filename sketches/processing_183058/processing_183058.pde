
import processing.opengl.*;
import javax.media.opengl.*;

PGL pgl;
int wHeight = 1100;
int wWidth = 700;
PVector v1, v2, v3, pCv1;
int w, a, s, d, q, e;
float midpoint_x, midpoint_y;
float mX1, mX2, mY1, mY2;
PFont f;
int land_x = 10;
int land_y = 10;
int land_z = 10;
float speedXY, speedQE;
float sensitivityX, sensitivityY;
float angle, angleX, angleY;
float moveQE, moveAD, moveWS;
boolean info = true;
boolean cursor = false;
boolean boundings = false;
boolean pExist = true;
boolean pCollisionXY = false;
boolean pCollisionZ = false;
int bSize = 200;
color pColor = color(0,0,0,127);
float collisiontime;
float inf = Float.POSITIVE_INFINITY;
float normalx, normaly, normalz;

BlockClass[][][] blocks = new BlockClass[land_x][land_y][land_z];
PlayerClass player;

void setup(){
 size (wHeight, wWidth,OPENGL);
 background(0);
 BlockDefinition();
 blockNeigbours();
 f = createFont("Arial", 16,true);
 player = new PlayerClass( 500, 1000, 2400, 0.0, 0.0, 0.0, pColor, pExist);          
 v1 = new PVector(land_x * bSize / 2,
                  land_y * bSize / 2, 
                  land_z * bSize + bSize);
                  
 v2 = new PVector(1,1,1);
 v3 = new PVector(0,0,-1);
 pCv1 = new PVector(v1.x ,v1.y, v1.z);
 sensitivityX = 1.0f;
 sensitivityY = 1.0f;
 speedXY = 0.05f;
 speedQE = 0.05f;
 midpoint_x = width / 2;
 midpoint_y = height / 2;
 angle = 0;
 
 pgl = ((PGraphicsOpenGL)g).pgl;
}

void draw(){
  background(123,200,250);
  
  // ---- lights----
  ambientLight(50,50,50);
  pointLight(216,240,230, v1.x+500, v1.y+500, v1.z+2000);
  
  
  //--- BackFace Culling enable
  PGL pgl = beginPGL();
  pgl.enable(PGL.CULL_FACE);
  
   moveWS = (w - s) * speedXY;
   moveAD = (d - a) * speedXY;
   moveQE = (e - q) * speedQE;
  
  showBlocks();
  player.boundings();
  PlayerUpdate();
  
 // player.collisions();

  CameraCheck();
  MouseCheck();

//endPGL();
///----- show info
if (info)
{
  info();
}



} //----- Draw end ------------

void keyPressed(){
  if (key == 'w') w = 1;
  if (key == 's') s = 1;
  if (key == 'a') a = 1;
  if (key == 'd') d = 1;
  if (key == 'q') q = 1;
  if (key == 'e') e = 1;
  if (key == 'b') boundings = !boundings;
  if (key == 'i') info = !info;
  if (key == 'm') cursor = !cursor;
}

void keyReleased(){
  if (key == 'w') w = 0;
  if (key == 's') s = 0;
  if (key == 'a') a = 0;
  if (key == 'd') d = 0;
  if (key == 'q') q = 0;
  if (key == 'e') e = 0;
}


/// -------- player class ---------
class PlayerClass {
  float x;
  float y;
  float z;
  
  float vx;
  float vy;
  float vz;
  
  boolean exist = true;
  boolean Bexist = true;
  color col;
  
  //float PbBbox2_y, PbBbox2_y, PbBbox2_z;
  float PbBox_x, PbBox_y, PbBox_z;
  float BbBox_x, BbBox_y, BbBox_z;
  
  float pXmin, pXmax, pYmin, pYmax, pZmin, pZmax;
  float bXmin, bXmax, bYmin, bYmax, bZmin, bZmax;
  
  int pSize_x = 100;
  int pSize_y = 100;
  int pSize_z = 360;
  
  PlayerClass (float x_, float y_, float z_, float vx_, float vy_, float vz_, color col_, 
  boolean exist_)
  {
    x = x_;
    y = y_;
    z = z_;
    
    vx = vx_;
    vy = vy_;
    vz = vz_;
    
    col = col_;
    exist = exist_;
    
    bXmin = BbBox_x;
        bXmax = BbBox_x+200;
        bYmin = BbBox_y;
        bYmax = BbBox_y+200;
        bZmin = BbBox_z;
        bZmax = BbBox_z+200;
        
        pXmin = x;
        pXmax = x+pSize_x;
        pYmin = y;
        pYmax = y+pSize_y;
        pZmin = z;
        pZmax = z+pSize_z;
  }
  
 void show()
  {
    if (exist)
    {
       PGL pgl = beginPGL();
       pgl.enable(PGL.CULL_FACE);
      /// very lame design of a player :)
      pushMatrix();
      fill(col);
      noStroke();
      //stroke(0,255,0);
      translate(x-pSize_x / 2, y - pSize_y / 2, z-pSize_z+30);
      beginShape(QUADS);
      
      //btm side---
      vertex(0, 0, 0);
      vertex(0, pSize_y, 0);
      vertex(pSize_x,pSize_y, 0);
      vertex(pSize_x, 0, 0);
      
      // top side----
      vertex(0, 0, pSize_z);
      vertex(pSize_x, 0, pSize_z);
      vertex(pSize_x,pSize_y,pSize_z);
      vertex(0, pSize_y,pSize_z);
      
      /// fnt side ----
      vertex(0, pSize_y,pSize_z);
      vertex(pSize_x,pSize_y,pSize_z);
      vertex(pSize_x,pSize_y, 0);
      vertex(0, pSize_y, 0);
      
      //---bck side
      vertex(0, 0, pSize_z);
      vertex(0, 0, 0);
      vertex(pSize_x, 0, 0);
      vertex(pSize_x,0,pSize_z);
      

      //---lsi side
      vertex(0, 0, 0);
      vertex(0, 0, pSize_z);
      vertex(0, pSize_y,pSize_z);
      vertex(0, pSize_y, 0);

      //---rsi side
      vertex(pSize_x, 0, 0);
      vertex(pSize_x,pSize_y, 0);
      vertex(pSize_x,pSize_y,pSize_z);
      vertex(pSize_x, 0, pSize_z);
      
      endShape(CLOSE);
      popMatrix();

    }
  }
 void boundings()
  {
    if (boundings)
    {

      /// very lame design of a player :)
      pushMatrix();
      noFill();
      stroke(255,0,0);
      translate(x-pSize_x / 2, y - pSize_y / 2, z-pSize_z+30);
      beginShape(QUADS);
      
      //btm side---
      vertex(0, 0, 0);
      vertex(0, pSize_y, 0);
      vertex(pSize_x,pSize_y, 0);
      vertex(pSize_x, 0, 0);
      
      // top side----
      vertex(0, 0, pSize_z);
      vertex(pSize_x, 0, pSize_z);
      vertex(pSize_x,pSize_y,pSize_z);
      vertex(0, pSize_y,pSize_z);
      
      /// fnt side ----
      vertex(0, pSize_y,pSize_z);
      vertex(pSize_x,pSize_y,pSize_z);
      vertex(pSize_x,pSize_y, 0);
      vertex(0, pSize_y, 0);
      
      //---bck side
      vertex(0, 0, pSize_z);
      vertex(0, 0, 0);
      vertex(pSize_x, 0, 0);
      vertex(pSize_x,0,pSize_z);
      

      //---lsi side
      vertex(0, 0, 0);
      vertex(0, 0, pSize_z);
      vertex(0, pSize_y,pSize_z);
      vertex(0, pSize_y, 0);

      //---rsi side
      vertex(pSize_x, 0, 0);
      vertex(pSize_x,pSize_y, 0);
      vertex(pSize_x,pSize_y,pSize_z);
      vertex(pSize_x, 0, pSize_z);
      
      endShape(CLOSE);
      popMatrix();

    }
  }
}/// player class end ----
///--------  block class -------------
class BlockClass {
  
  float x;
  float y;
  float z;
  int ID; // not implemented yet
  
  boolean exist = true;
  boolean fnt = true;
  boolean bck = true;
  boolean top = true;
  boolean btm = true;
  boolean rsi = true;
  boolean lsi = true;
  int size = 200;
  
  color col;
  
  BlockClass (float x_, float y_, float z_, color col_, 
  boolean exist_, boolean fnt_, boolean bck_, boolean top_, 
  boolean btm_, boolean rsi_, boolean lsi_)
  {
    x = x_ * size;
    y = y_ * size;
    z = z_ * size;
    
    col = col_;
    exist = exist_;
    fnt = fnt_;
    bck = bck_;
    top = top_;
    btm = btm_;
    rsi = rsi_;
    lsi = lsi_;
  } // ------block class init end----
  
  void show()
  {
    if(exist)
    {
      fill(col);
      noStroke();
      //stroke(0);
      pushMatrix();
      translate(x,y,z);
      beginShape(QUADS);
      
      //---btm side
      if (btm){
      vertex(0,0,0);
      vertex(0,size,0);
      vertex(size,size,0);
      vertex(size,0,0);
      }
      if (top){
      // ---top side
      vertex(0,0,size);
      vertex(size,0,size);
      vertex(size,size,size);
      vertex(0,size,size);
      }
      
      if (bck){
      //---bck side
      vertex(0,0,size);
      vertex(0,0,0);
      vertex(size,0,0);
      vertex(size,0,size);
      }
      if (fnt){
      //--fnt side
      vertex(0,size,size);
      vertex(size,size,size);
      vertex(size,size,0);
      vertex(0,size,0);
      }
      if (lsi){
      //---lsi side
      vertex(0,0,0);
      vertex(0,0,size);
      vertex(0,size,size);
      vertex(0,size,0);
      }
      if (rsi){
      //---rsi side
      vertex(size,0,0);
      vertex(size,size,0);
      vertex(size,size,size);
      vertex(size,0,size);
      }
      endShape(CLOSE);
      popMatrix();
      
     // endPGL();
    }
  }
}

// --- player move in same spot as camera

 float SweptAABB(PlayerClass p, BlockClass b, float normalx, float normaly, float normalz)
 {
  float xInvEntry, yInvEntry, zInvEntry;
  float xInvExit, yInvExit, zInvExit;
  
  // find the distance between the objects on the near and far sides for x, y and z 
  if (p.vx > 0.0f) { // X axis
    xInvEntry = b.x - (p.x + p.pSize_x);
    xInvExit = (b.x + b.size) - p.x; 
  } 
  else {
    xInvEntry = (b.x + b.size) - p.x;
    xInvExit = b.x - (p.x - p.pSize_x);
  }
  
  if (p.vy > 0.0f) { // Yaxis
    yInvEntry = b.y - (p.y + p.pSize_y);
    yInvExit = (b.y + b.size) - p.y;
  } 
  else {
    yInvEntry = (b.y + b.size) - p.y;
    yInvExit = b.y - (p.y - p.pSize_y);
  }
  
  if (p.vz > 0.0f) { // Z axis
    zInvEntry = b.z - (p.z + p.pSize_z);
    zInvExit = (b.z + b.size) - p.z;
  } 
  else{
    zInvEntry = (b.z + b.size) - p.z;
    zInvExit = b.z - (p.z - p.pSize_z);
  }
 
   // find time of collision and time of leaving for each axis 
   // (if statement is to prevent divide by zero)
   float xEntry, yEntry, zEntry;
   float xExit, yExit, zExit;
   
   if (p.vx == 0.0f) {
     xEntry = -inf;
     xExit = inf;
   }
   else {
     xEntry = xInvEntry / p.vx;
     xExit = xInvExit / p.vx; 
   }
    if (p.vy == 0.0f) {
     yEntry = -inf;
     yExit = inf;
   }
   else {
     yEntry = yInvEntry / p.vy;
     yExit = yInvExit / p.vy; 
   }
    if (p.vz == 0.0f) {
     zEntry = -inf;
     zExit = inf;
   }
   else {
     zEntry = zInvEntry / p.vz;
     zExit = zInvExit / p.vz; 
   }
   
   // find the earliest/ latest times of collision
   float entryTime = max(xEntry, yEntry, zEntry);
   float exitTime = min(xExit, yExit ,zExit);
   /*
    pushMatrix();
    fill(255);
    noStroke();
    noLights();
    camera();
    translate(midpoint_x-200,midpoint_y-200,230);
    text("entryTime: " + entryTime / 100, 10, 40);
    text("exitTime" + exitTime / 100, 10, 50);
    text("bx: " + b.x / 100, 10, 60);
    popMatrix();
   */
   // If there was no collision
   if (entryTime > exitTime || xEntry < 0.0f && yEntry < 0.0f || xEntry > 1.0 || yEntry > 1.0f)
   {
     normalx = 0.0f;
     normaly = 0.0f;
     normalz = 0.0f;
     return 1.0f;
   }
   else// if there was a collision
   {
     // calculate normal of collided surface
     if (xEntry > yEntry)
     {
       if (xInvEntry < 0.0f)
       {
         normalx = 1.0f;
         normaly = 0.0f;
         normalz = 0.0f;
       }
       else
       {
         normalx = -1.0f;
         normaly = 0.0f;
         normalz = 0.0f;
       }
     }
     else if (yEntry > xEntry)
     {
       if (yInvEntry < 0.0f)
       {
         normalx = 0.0f;
         normaly = 1.0f;
         normalz = 0.0f;
       }
       else
       {
         normalx = 0.0f;
         normaly = -1.0f;
         normalz = 0.0f;
       }
     }
     else
     {
       if (zInvEntry < 0.0f)
       {
         normalx = 0.0f;
         normaly = 0.0f;
         normalz = 1.0f;
       }
       else
       {
         normalx = 0.0f;
         normaly = 0.0f;
         normalz = -1.0f;
       }
     }
     return entryTime;
   }
 }
 
 void PlayerUpdate()
 {
   
   player.vx = moveWS * sin(radians(angleX)) + moveAD * sin(radians(angleX)-HALF_PI);
   player.vy = moveWS * cos(radians(angleX)) + moveAD * cos(radians(angleX)-HALF_PI);
   player.vz = moveQE;
   
   normalx = moveWS;
   normaly = moveAD;
   normalz = (e - q);

      for (int i = 0; i < blocks.length; i++){
        for (int j = 0; j < blocks[i].length; j++){
          for (int k = 0; k < blocks[i][j].length; k++){
            
               int px = int(player.x) / 200;
               int py = int(player.y) / 200;
               int pz = int(player.z) / 200;
               
            if (blocks[i][j][k].exist)
            { // println("i: "+ player.x + "j: " + player.y + "k: " + player.z);
              if (i > px - 2 && i < px + 2){
                if (j > py - 2 && j < py + 2){
                  if (k > pz - 3 && k < pz + 1){
                    
                    fill(255);
                    noStroke();
                    noLights();
                    pushMatrix();
                    camera();
                    translate(400,100,0);
                    text("collision calculation", 10,50,100);
                    popMatrix();
                    
                      try 
                      {  
                       collisiontime = SweptAABB(player, blocks[i][j][k], normalx, normaly, normalz);
                      } catch (java.lang.RuntimeException e) {}
                       
                         player.x += player.vx * collisiontime;
                         player.y += player.vy * collisiontime;
                         player.z += player.vz * collisiontime;
                         
                         v1.x = player.x;
                         v1.y = player.y;
                         v1.z = player.z;
                         
                         float remainingtime = 1.0 - collisiontime;
                         /*
                         float dotprod = (player.vx * normaly + player.vy * normalx) * remainingtime;
                          player.vx = dotprod * normaly;
                          player.vy = dotprod * normalx;
                          */
                  }
                }
              }
            }
            else
            {
               player.x += player.vx * 1;
               player.y += player.vy * 1;
               player.z += player.vz * 1;
               
               v1.x = player.x;
               v1.y = player.y;
               v1.z = player.z;
            }
          }
        }
      }
    

   player.show();
 }

// ---- Camera chceck ----------------------
void CameraCheck(){
  float RadiusX = 720.0;
  float RadiusY = 20.0;
  
  angleX = map(mX1,width,0,0,720);
  angleY = map(mY1,height,-200,-180,50);
  
  v2.x = RadiusX*sin(radians(angleX)) + v1.x;
  v2.y = RadiusX*cos(radians(angleX)) + v1.y;
  v2.z = RadiusY*angleY + v1.z;
  
  
  camera (v1.x,v1.y,v1.z, // eye levels
          v2.x,v2.y,v2.z, // camera look
          v3.x,v3.y,v3.z); // upward
}//---- camera end

///---- mouse check ---------------------
void MouseCheck() {
     mX1 = (mouseX - midpoint_x) * sensitivityX;
     mY1 = (mouseY - midpoint_y) * sensitivityY;
    
     mX1 = mX1>width?mX1-width:mX1;
     mX1 = mX1<0?width+mX1:mX1;
     
    // mY1 = mY1>height?mY1-height:mY1;
     //mY1 = mY1<0?height+mY1:mY1;
}///mouse end----------

/// --------Block define --------------
void BlockDefinition()
{
  for (int i = 0; i < blocks.length; i++){
    for (int j = 0; j < blocks[i].length; j++){
      for (int k = 0; k < blocks[i][j].length; k++){
        color CurrentCol;
        color col1 = color(50,160,20);
        color col2 = color(116,61,39);
        color col3 = color(130,110,105);
        boolean exist;
        boolean fnt = true;
        boolean bck = true;
        boolean top = true;
        boolean btm = true;
        boolean rsi = true;
        boolean lsi = true;
        
        if (k > 0 && k < 8) {
          CurrentCol = col2;
        }
        else CurrentCol = col1;
        
        if(k > 8 || k < 1) {
          exist = false;
          if ( k > 8 && random(100) > 90)  
          {
            CurrentCol = col3;
            exist = true;
          }
        }
        else exist = true;
        
        blocks[i][j][k] = new BlockClass(i, j, k,
        CurrentCol, exist, fnt, bck, top, btm, rsi, lsi);
      }
    }
  } 
}///// block define end -----

// ----- to show blocks----------
void showBlocks()
{
  for (int i = 0; i < blocks.length; i++){
    for (int j = 0; j < blocks[i].length; j++){
      for (int k = 0; k < blocks[i][j].length; k++){
        blocks[i][j][k].show();
      }
    }
  }
}
///----- for not showing faces in contact of other blocks-------------
void blockNeigbours()
{
  for (int i = 0; i < blocks.length; i++){
    for (int j = 0; j < blocks[i].length; j++){
      for (int k = 0; k < blocks[i][j].length; k++){
        
        boolean Bfnt = true;
        boolean Bbck = true;
        boolean Btop = true;
        boolean Bbtm = true;
        boolean Brsi = true;
        boolean Blsi = true;
        try
        {
          try 
          {
            if (blocks[i][j][k+1].exist)
            {
              Btop = false;
            }
          } catch (java.lang.RuntimeException e) {}
          try 
          {
            if (blocks[i][j][k-1].exist)
            {
              Bbtm = false;
            }
          } catch (java.lang.RuntimeException e) {}
          try 
          {
            if (blocks[i][j+1][k].exist)
            {
              Bfnt = false;
            }
          } catch (java.lang.RuntimeException e) {}
          try 
          {
            if (blocks[i][j-1][k].exist)
            {
              Bbck = false;
            }
          } catch (java.lang.RuntimeException e) {}
          try 
          {
            if (blocks[i+1][j][k].exist)
            {
              Brsi = false;
            }
          } catch (java.lang.RuntimeException e) {}
          try 
          {
            if (blocks[i-1][j][k].exist)
            {
              Blsi = false;
            }
          } catch (java.lang.RuntimeException e) {}
        } catch (Exception e) { println("error occured in faces count optimalisation");}
        
        blocks[i][j][k].top = Btop;
        blocks[i][j][k].btm = Bbtm;
        blocks[i][j][k].fnt = Bfnt;
        blocks[i][j][k].bck = Bbck;
        blocks[i][j][k].rsi = Brsi;
        blocks[i][j][k].lsi = Blsi;
        
      }
    }
  }
}

void info()
{
  pushMatrix();
  fill(255);
  noStroke();
  noLights();
  camera();
  translate(midpoint_x-200,midpoint_y-200,230);
  text("X: " + v1.x / 100, 10, 10);
  text("Y: " + v1.y / 100, 10, 20);
  text("Z: " + v1.z / 100, 10, 30);
  text("mouseX: " + mX1, 100, 10);
  text("mouseY: " + mY1, 100, 20);
  text("FPS: " + frameRate, 100, 30);
  text("angleX: " + angleX, 200, 10);
  text("angleY: " + angleY, 200, 20);
  text("collisiontime" + collisiontime, 200, 30);
  text("normalX: " + normalx, 350, 10);
  text("normalY: " + normaly, 350, 20);
  text("normalZ: " + normalz, 350, 30);
  popMatrix(); 
}

