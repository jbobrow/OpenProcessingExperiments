
/**
 * Grow cell 3D cellular automation
 * by Teddybot
 * 
 * This program grows cells from central points
 * you can change the rules about where it places cells and what it divides by to control the shapes!
 * Please post mods at Processing.org thanks!!
 */

import arb.soundcipher.*;

//import processing.opengl.*;

cell_class[] cell = new cell_class[101];
int rule=0;
int size=30;
float rotx=0;
float roty=0;
int processing=0;
int pausetimer=0;
int pausetime=80;
int shrinkmode=0;
int counter=1;

int pitch=50;
int dynamic=70;

int r=int(random(100, 255));
int g=int(random(100, 255));
int b=int(random(100, 255));
int newr=r;
int newg=g;
int newb=b;

void reset()
{

  for (int i=0; i<cell.length; i++)
  {
    cell[i].reset();
  }
}

void setup() 
{ 
  size(800, 480, OPENGL);
  // noStroke();
 noCursor();
  frameRate(30);
  textSize(400);
  for (int i=0; i<cell.length; i++) {
    cell[i] = new cell_class(cell);
    cell[i].sc = new SoundCipher(this);
  }

  reset();

  cell[0].setxyz(0, 0, 0);
  cell[0].value=counter;
} 

void draw() 
{ 
  background(r/3, g/3, b/3);

  pushMatrix();
  fill(g/2,b/2,r/2);
  textSize(400);
  textAlign(CENTER);
  text(""+counter, 0, 100, -200);
  textSize(30);
//  fill(255-b/3,255-g/3,255-r/3);
//  text("Instrument #"+((mouseY/2)%80),0,100,50);
  popMatrix();
  // Change height of the camera with mouseY
 lights();

  camera(0.0, height/2-mouseY, 100+mouseX, // eyeX, eyeY, eyeZ
  0.0, 0.0, 0.0, // centerX, centerY, centerZ
  0.0, 1.0, 0.0); // upX, upY, upZ

  rotateY(roty);
  roty-=PI/220;

  rotateZ(rotx);
  rotx+=PI/100;

  if (processing==0) {
    pausetimer++;
  }

  if (r<newr) r++;
  if (r>newr) r--;
  if (g<newg) g++;
  if (g>newg) g--;
  if (b<newb) b++;
  if (b>newb) b--;

  if (pausetimer>pausetime)
  { 
    shrinkmode++;
    moveallin();
    if (shrinkmode>size)
    {
      reset();
      cell[0].setxyz(0, 0, 0);
      counter++;
      if (counter>cell.length-1) counter=1;
      cell[0].value=counter;
      pausetimer=0;
      shrinkmode=0;
      newr = g;
      newg = b;
      newb = int(random(100, 255));
    }
  }

  processing=0;


  for (int i=0; i<cell.length; i++)
    if (cell[i].active==1) cell[i].draw();

  for (int i=0; i<cell.length; i++)
    if ((cell[i].active==1) && (cell[i].moving==0) && (cell[i].value>1)) 
    {
      if ( cell[i].value%2==0 )
      {
        int v = cell[i].value/2;
        int slot = openslot();

        cell[slot].sc.instrument( i%100 );
        cell[slot].sc.playNote( 10+((cell[i].value*5)%90),random(50) + 70, .4);
        cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
        cell[slot].setdest(cell[i].x+size, cell[i].y, cell[i].z);
        cell[slot].value=v;

        slot = openslot();
        cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
        cell[slot].setdest(cell[i].x-size, cell[i].y, cell[i].z);
        cell[slot].value=v;

        cell[i].reset();
        processing=1;
      }
      else
        if ( (cell[i].value>2) && (cell[i].value%3==0) && (cell[i].value!=9 ))
        {
          int v = cell[i].value/3;

          int slot = openslot();
     
        cell[slot].sc.instrument( i%100 );
        cell[slot].sc.playNote( 10+((cell[i].value*5)%90),random(50) + 70, .4);

          cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
          cell[slot].setdest(cell[i].x, cell[i].y+size, cell[i].z);
          cell[slot].value=v;

          slot = openslot();
          cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
          cell[slot].setdest(cell[i].x, cell[i].y-size, cell[i].z);
          cell[slot].value=v;

          cell[i].value-=(v+v);
          processing=1;
        }
          else
        if ( (cell[i].value>4) && (cell[i].value%5==0) )
        {
          int v = cell[i].value/5;

          int slot = openslot();
          
         cell[slot].sc.instrument( i%100 );
         cell[slot].sc.playNote( 10+((cell[i].value*5)%90),random(50) + 70, .4);

          cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
          cell[slot].setdest(cell[i].x, cell[i].y, cell[i].z-size);
          cell[slot].value=v;

          slot = openslot();
          cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
          cell[slot].setdest(cell[i].x, cell[i].y, cell[i].z+size);
          cell[slot].value=v;
        
          slot = openslot();
          cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
          cell[slot].setdest(cell[i].x, cell[i].y, cell[i].z-size-size);
          cell[slot].value=v;

          slot = openslot();
          cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
          cell[slot].setdest(cell[i].x, cell[i].y, cell[i].z+size+size);
          cell[slot].value=v;
        
          cell[i].value-=(v+v+v+v);
          processing=1;
        }
         else
        if ( (cell[i].value>6) && (cell[i].value%7==0) )
        {
          int v = cell[i].value/7;

          int slot = openslot();
          
  
        cell[slot].sc.instrument( i%100 );
        cell[slot].sc.playNote( 10+((cell[i].value*5)%90),random(50) + 70, .4);

         cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
          cell[slot].setdest(cell[i].x, cell[i].y+size, cell[i].z);
          cell[slot].value=v;

          slot = openslot();
          cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
          cell[slot].setdest(cell[i].x, cell[i].y-size, cell[i].z);
          cell[slot].value=v;

          slot = openslot();
          cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
          cell[slot].setdest(cell[i].x+size, cell[i].y, cell[i].z);
          cell[slot].value=v;

          slot = openslot();
          cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
          cell[slot].setdest(cell[i].x-size, cell[i].y, cell[i].z);
          cell[slot].value=v;
  
          slot = openslot();
          cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
          cell[slot].setdest(cell[i].x, cell[i].y, cell[i].z-size);
          cell[slot].value=v;

          slot = openslot();
          cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
          cell[slot].setdest(cell[i].x, cell[i].y, cell[i].z+size);
          cell[slot].value=v;
        
          cell[i].value-=(v+v+v+v+v+v);
          processing=1;
        } 
        else
        if ( (cell[i].value>8) )//&& (cell[i].value%9==0) )
        {
        
          int v = cell[i].value/9;

          //right
          int slot = openslot();
                    
   
        cell[slot].sc.instrument( i%100 );
        cell[slot].sc.playNote( 10+((cell[i].value*5)%90),random(50) + 70, .4);

          cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
          cell[slot].setdest(cell[i].x+size, cell[i].y, cell[i].z);
          cell[slot].value=v;

          //left
          slot = openslot();
          cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
          cell[slot].setdest(cell[i].x-size, cell[i].y, cell[i].z);
          cell[slot].value=v;

          //right in
          slot = openslot();
          cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
          cell[slot].setdest(cell[i].x+size, cell[i].y, cell[i].z-size);
          cell[slot].value=v;

          //right out
          slot = openslot();
          cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
          cell[slot].setdest(cell[i].x+size, cell[i].y, cell[i].z+size);
          cell[slot].value=v;
      
          //left out
          slot = openslot();
          cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
          cell[slot].setdest(cell[i].x-size, cell[i].y, cell[i].z+size);
          cell[slot].value=v;
  
          //left in
          slot = openslot();
          cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
          cell[slot].setdest(cell[i].x-size, cell[i].y, cell[i].z-size);
          cell[slot].value=v;

          //forward
          slot = openslot();
          cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
          cell[slot].setdest(cell[i].x, cell[i].y, cell[i].z+size);
          cell[slot].value=v;
  
          //backward
          slot = openslot();
          cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
          cell[slot].setdest(cell[i].x, cell[i].y, cell[i].z-size);
          cell[slot].value=v;
          
          cell[i].value-=(v+v+v+v+v+v+v+v);
          processing=1;
        }
        else
          if ( cell[i].value>2) 
          {
            int v = cell[i].value/2;
            int slot = openslot();
             
   
      cell[slot].sc.instrument( i%100 );
          cell[slot].sc.playNote( 10+((cell[i].value*5)%90),random(50) + 70, .4);

            cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
            cell[slot].setdest(cell[i].x, cell[i].y, cell[i].z+size);
            cell[slot].value=v;

            slot = openslot();
            cell[slot].setxyz(cell[i].x, cell[i].y, cell[i].z);
            cell[slot].setdest(cell[i].x, cell[i].y, cell[i].z-size);
            cell[slot].value=v;

            cell[i].value=cell[i].value%2;
            if (cell[i].value==0) cell[i].reset();
            processing=1;
          }
    }

  for (int i=0; i<cell.length; i++)
    if (cell[i].moving==1) cell[i].move();
} 

int openslot() {
  for (int i=0; i<cell.length; i++)
    if (cell[i].active==0) return i;
  return 0;
}



int someoneat(int _x, int _y, int _z)
{
  for (int i=0; i<cell.length; i++) 
    if ((cell[i].active==1) && (cell[i].x==_x) && (cell[i].y==_y) && (cell[i].z==_z) && (cell[i].moving==0)) return i;
  return -1;
}


public void moveallin()
{
  for (int i=0; i<cell.length; i++) 
  {
    cell[i].movetocenter();
  }
}

class cell_class {

  int x, y, z, destx, desty, destz;
  int active;
  int value;
  int moving;
  cell_class[] cellarray;

  SoundCipher sc;

  cell_class(cell_class[] _cellarray)
  {
    cellarray = _cellarray;
    x=y=z=active=value=moving=destx=desty=destz=0;
  }


  public void reset()
  {
    active=value=moving=0;
  }

  public void movetocenter()
  {
    int v=size/12;
    if (x<0) x+=v;
    if (x>0) x-=v;
    if (y<0) y+=v;
    if (y>0) y-=v;
    if (z<0) z+=v;
    if (z>0) z-=v;
  }

  public void setxyz(int _x, int _y, int _z)
  { 
    active=1;
    x = _x;
    y = _y;
    z = _z;
  }

  public void setdest(int _destx, int _desty, int _destz)
  { 
    moving=1;
    destx = _destx;
    desty = _desty;
    destz = _destz;
  }

  public void draw()
  {
    if (value%2==0) {
      fill(r, g, b);
      stroke(r, g, b);
    }
    else
      if (value%3==0) {
        fill(g, b, r);
        stroke(g, b, r);
      }
      else
      {
        fill(b, r, g);
        stroke(b, r, g);
      }

    //fill(0, 255, 0);
    if (shrinkmode>0) box(shrinkmode);


    pushMatrix();
    translate(x, y, z);
    box(size-shrinkmode);
      if (mouseY>height/2-10) 
      if (mouseY>height/2+10) {textSize(20);
      text(value, x, y,z);}
    popMatrix();
    fill(0);
  }

  public void move()
  {
    int v=1;
    processing=1;
    if (x<destx) x+=v;
    if (x>destx) x-=v;
    if (y<desty) y+=v;
    if (y>desty) y-=v;
    if (z<destz) z+=v;
    if (z>destz) z-=v;

    if ((x==destx) && (y==desty) && (z==destz))
    {
      if ((someoneat(x, y, z)>=0) && (cell[someoneat(x, y, z)].moving==0) )
      {
        cellarray[someoneat(x, y, z)].value+=value;
        active=0; 
        moving=0; 
        value=0;
      }
      else
      {
        moving=0;
      }
    }
  }
}


