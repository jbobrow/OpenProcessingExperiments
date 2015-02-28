
class Monster
{
  
  
    float xp, yp;
    float w, h;
    
    boolean isOver;
    boolean isPressed;



Monster ()
{
  
        xp = width/2;
        yp = height/2;
        
        w = 400;
        h = 400;
}



void drawMe (){


//Körper einfach
noStroke(); 
fill (#1BF511);
ellipse (xp-20, yp, w, h); 

//Haare rechts
pushMatrix(); 
translate (xp-100 , yp-400); 
stroke(#1BF511); 
noFill(); 
beginShape();
vertex( 178.0 , 245.0 );
bezierVertex( 178.0 , 240.0 , 178.73 , 240.5 , 179.0 , 240.0 );
bezierVertex( 179.26 , 239.49 , 179.29 , 239.14 , 181.0 , 238.0 );
bezierVertex( 182.7 , 236.85 , 186.06 , 234.9 , 189.0 , 234.0 );
bezierVertex( 191.93 , 233.09 , 194.43 , 233.22 , 198.0 , 233.0 );
bezierVertex( 201.56 , 232.77 , 206.18 , 232.2 , 211.0 , 231.0 );
bezierVertex( 215.81 , 229.79 , 220.82 , 227.94 , 225.0 , 225.0 );
bezierVertex( 229.17 , 222.05 , 232.5 , 218.01 , 234.0 , 214.0 );
bezierVertex( 235.49 , 209.98 , 235.16 , 205.98 , 233.0 , 202.0 );
bezierVertex( 230.83 , 198.01 , 230.19 , 196.62 , 227.0 , 195.0 );
bezierVertex( 223.8 , 193.37 , 220.46 , 192.37 , 217.0 , 192.0 );
bezierVertex( 213.53 , 191.62 , 209.93 , 191.86 , 208.0 , 194.0 );
bezierVertex( 206.06 , 196.13 , 205.8 , 200.16 , 208.0 , 203.0 );
bezierVertex( 210.19 , 205.83 , 214.85 , 207.47 , 219.0 , 206.0 );
bezierVertex( 223.14 , 204.52 , 226.78 , 199.95 , 230.0 , 195.0 );
bezierVertex( 233.21 , 190.04 , 236.0 , 184.72 , 239.0 , 180.0 );
bezierVertex( 241.99 , 175.27 , 245.17 , 171.16 , 250.0 , 169.0 );
bezierVertex( 254.82 , 166.83 , 261.27 , 166.61 , 266.0 , 168.0 );
bezierVertex( 270.72 , 169.38 , 273.72 , 172.38 , 275.0 , 177.0 );
bezierVertex( 276.27 , 181.61 , 282.95 , 183.6 , 287.0 , 183.0 );
bezierVertex( 291.04 , 182.39 , 294.38 , 178.06 , 297.0 , 170.0 );
endShape();
popMatrix(); 

pushMatrix(); 
translate (xp-100 , yp-400); 
rotate (0.1); 
stroke(#1BF511); 
noFill(); 
beginShape();
vertex( 178.0 , 245.0 );
bezierVertex( 178.0 , 240.0 , 178.73 , 240.5 , 179.0 , 240.0 );
bezierVertex( 179.26 , 239.49 , 179.29 , 239.14 , 181.0 , 238.0 );
bezierVertex( 182.7 , 236.85 , 186.06 , 234.9 , 189.0 , 234.0 );
bezierVertex( 191.93 , 233.09 , 194.43 , 233.22 , 198.0 , 233.0 );
bezierVertex( 201.56 , 232.77 , 206.18 , 232.2 , 211.0 , 231.0 );
bezierVertex( 215.81 , 229.79 , 220.82 , 227.94 , 225.0 , 225.0 );
bezierVertex( 229.17 , 222.05 , 232.5 , 218.01 , 234.0 , 214.0 );
bezierVertex( 235.49 , 209.98 , 235.16 , 205.98 , 233.0 , 202.0 );
bezierVertex( 230.83 , 198.01 , 230.19 , 196.62 , 227.0 , 195.0 );
bezierVertex( 223.8 , 193.37 , 220.46 , 192.37 , 217.0 , 192.0 );
bezierVertex( 213.53 , 191.62 , 209.93 , 191.86 , 208.0 , 194.0 );
bezierVertex( 206.06 , 196.13 , 205.8 , 200.16 , 208.0 , 203.0 );
bezierVertex( 210.19 , 205.83 , 214.85 , 207.47 , 219.0 , 206.0 );
bezierVertex( 223.14 , 204.52 , 226.78 , 199.95 , 230.0 , 195.0 );
bezierVertex( 233.21 , 190.04 , 236.0 , 184.72 , 239.0 , 180.0 );
bezierVertex( 241.99 , 175.27 , 245.17 , 171.16 , 250.0 , 169.0 );
bezierVertex( 254.82 , 166.83 , 261.27 , 166.61 , 266.0 , 168.0 );
bezierVertex( 270.72 , 169.38 , 273.72 , 172.38 , 275.0 , 177.0 );
bezierVertex( 276.27 , 181.61 , 282.95 , 183.6 , 287.0 , 183.0 );
bezierVertex( 291.04 , 182.39 , 294.38 , 178.06 , 297.0 , 170.0 );
endShape();
popMatrix(); 


//haare links

pushMatrix(); 
translate (xp-300 , yp-400); 
stroke(#1BF511); 
noFill(); 
 beginShape();
vertex( 235.0 , 266.0 );
bezierVertex( 240.33 , 268.66 , 243.28 , 264.78 , 244.0 , 261.0 );
bezierVertex( 244.71 , 257.21 , 243.5 , 251.9 , 241.0 , 248.0 );
bezierVertex( 238.49 , 244.09 , 234.69 , 241.58 , 230.0 , 240.0 );
bezierVertex( 225.3 , 238.41 , 219.72 , 237.73 , 217.0 , 239.0 );
bezierVertex( 214.27 , 240.26 , 214.39 , 243.46 , 216.0 , 245.0 );
bezierVertex( 217.6 , 246.53 , 220.67 , 246.38 , 223.0 , 242.0 );
bezierVertex( 225.32 , 237.61 , 226.88 , 228.98 , 225.0 , 221.0 );
bezierVertex( 223.11 , 213.01 , 217.78 , 205.68 , 209.0 , 199.0 );
bezierVertex( 200.21 , 192.31 , 198.72 , 190.03 , 186.0 , 192.0 );
bezierVertex( 173.27 , 193.96 , 163.6 , 197.96 , 157.0 , 204.0 );
bezierVertex( 150.39 , 210.03 , 146.85 , 218.1 , 147.0 , 225.0 );
bezierVertex( 147.14 , 231.89 , 150.98 , 237.61 , 160.0 , 237.0 );
bezierVertex( 169.01 , 236.38 , 183.19 , 229.43 , 187.0 , 221.0 );
bezierVertex( 190.8 , 212.56 , 184.22 , 202.64 , 178.0 , 196.0 );
bezierVertex( 171.77 , 189.35 , 165.9 , 185.98 , 166.0 , 182.0 );
bezierVertex( 166.09 , 178.01 , 172.14 , 173.42 , 179.0 , 172.0 );
bezierVertex( 185.85 , 170.57 , 193.5 , 172.3 , 195.0 , 176.0 );
bezierVertex( 196.49 , 179.69 , 191.82 , 185.36 , 181.0 , 193.0 );
bezierVertex( 170.17 , 200.63 , 173.2 , 203.49 , 174.0 , 207.0 );
endShape();
popMatrix(); 

pushMatrix(); 
translate (xp-300 , yp-400);  
rotate (-0.1); 
stroke(#1BF511); 
noFill(); 
 beginShape();
vertex( 235.0 , 266.0 );
bezierVertex( 240.33 , 268.66 , 243.28 , 264.78 , 244.0 , 261.0 );
bezierVertex( 244.71 , 257.21 , 243.5 , 251.9 , 241.0 , 248.0 );
bezierVertex( 238.49 , 244.09 , 234.69 , 241.58 , 230.0 , 240.0 );
bezierVertex( 225.3 , 238.41 , 219.72 , 237.73 , 217.0 , 239.0 );
bezierVertex( 214.27 , 240.26 , 214.39 , 243.46 , 216.0 , 245.0 );
bezierVertex( 217.6 , 246.53 , 220.67 , 246.38 , 223.0 , 242.0 );
bezierVertex( 225.32 , 237.61 , 226.88 , 228.98 , 225.0 , 221.0 );
bezierVertex( 223.11 , 213.01 , 217.78 , 205.68 , 209.0 , 199.0 );
bezierVertex( 200.21 , 192.31 , 198.72 , 190.03 , 186.0 , 192.0 );
bezierVertex( 173.27 , 193.96 , 163.6 , 197.96 , 157.0 , 204.0 );
bezierVertex( 150.39 , 210.03 , 146.85 , 218.1 , 147.0 , 225.0 );
bezierVertex( 147.14 , 231.89 , 150.98 , 237.61 , 160.0 , 237.0 );
bezierVertex( 169.01 , 236.38 , 183.19 , 229.43 , 187.0 , 221.0 );
bezierVertex( 190.8 , 212.56 , 184.22 , 202.64 , 178.0 , 196.0 );
bezierVertex( 171.77 , 189.35 , 165.9 , 185.98 , 166.0 , 182.0 );
bezierVertex( 166.09 , 178.01 , 172.14 , 173.42 , 179.0 , 172.0 );
bezierVertex( 185.85 , 170.57 , 193.5 , 172.3 , 195.0 , 176.0 );
bezierVertex( 196.49 , 179.69 , 191.82 , 185.36 , 181.0 , 193.0 );
bezierVertex( 170.17 , 200.63 , 173.2 , 203.49 , 174.0 , 207.0 );
endShape();

popMatrix(); 

//Augen Weiß
fill(255);   

ellipse ( xp, yp-105, 60, 30); 
ellipse ( xp-130, yp-105, 60, 30); 


 


if (mousePressed) {

//Punkte HG

  noStroke(); 
    
    fill (random (10, 200), random (10, 200), random (100, 200),   200); 
    for (int s = 0; s< 30; s++) {
    
    ellipse ( random(0, width), random(0, height), 20,20); 
   
  }

   
}

//Pupillen
pushStyle(); 
stroke(#7AA578); 
strokeWeight(2); 
fill (#1A4D17); 
ellipse ( xp, yp-105, 20, 10); 
ellipse ( xp-130, yp-105, 20, 10); 
popStyle(); 


  //Zähne
  pushStyle(); 

  stroke(255);  
  noFill(); 
  beginShape();
  translate (xp-200, yp-160); 

  vertex( 75.0 , 206.0 );
  bezierVertex( 75.0 , 206.0 , 91.0 , 227.0 , 92.0 , 227.0 );
  vertex( 112.0 , 205.0 );
  vertex( 132.0 , 229.0 );
  vertex( 153.0 , 205.0 );
  vertex( 169.0 , 230.0 );
  vertex( 191.0 , 206.0 );

  endShape();

  popStyle(); 
  
  
  
}

boolean testMouseOver ( float mx , float my )
    {
        isOver = (mx > xp-xp/2) && (mx < xp/2+w) && (my > yp-yp/2) && (my < yp/2+h);
        
        return isOver;
    }


    boolean testMousePressed ( float mx, float my )
    {
        testMouseOver( mx, my );
        
        isPressed = isOver;
        
        return isPressed;
    }

void handleMouseDragged ( float xd, float yd )
    {
        if ( isPressed )
        {
            xp += xd;
            yp += yd;
        }
    }
    
    void handleMouseReleased ()
    {
        isPressed = false;
    }
}

 //Class ende


Monster ms; 

void setup()
{

 size (600,600);
   smooth();
  //frameRate(16);
  
  ms = new Monster(); 
}

void draw ()

  {
  background(0);
  ms.drawMe(); 
  }


void mouseMoved ()
{
    ms.testMouseOver( mouseX, mouseY );
}

void mousePressed ()
{
    ms.testMousePressed( mouseX, mouseY );   
}

void mouseDragged ()
{
    ms.handleMouseDragged( mouseX-pmouseX, mouseY-pmouseY );
}

void mouseReleased ()
{
    ms.handleMouseReleased();
}




