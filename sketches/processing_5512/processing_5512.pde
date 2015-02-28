
//Valentine by Christopher Hearn
//February 2009

//set up vertices of the heart
Point pt1a=new Point(0,0); 
Point pt1c=new Point(0,-60); 
Point pt2a=new Point(-50,-140);
Point pt2c1=new Point(-100,-100);
Point pt2c2=new Point(-10,-160);
Point pt3a=new Point(0,-120); 
Point pt3c=new Point(0,-120); 
Point pt1c_ref=new Point(0,-60); 
Point pt2a_ref=new Point(+50,-140); 
Point pt2c1_ref=new Point(100,-100);
Point pt2c2_ref=new Point(10,-160);
Point pt3c_ref=new Point(0,-120);
PFont font; 


int hearts = 30; //this is the max no. of hearts onscreen at any one time
float[]posx = new float[hearts];
float[]posy = new float[hearts];
float[]direc = new float[hearts]; //this holds info on the direction in which heart is travelling (plus or minus x-axis)
float time = 0;
float inity;
float initx;

void setup(){
  size(400,400); 
  background(255); 
  smooth();
  inity=0;
  initx=width/2;
  initialise();
  font = loadFont("ACaslonPro-BoldItalic-48.vlw");
  textFont(font, 32); 
}

void draw(){

  background(70,30,40);

  for (int i=0;i<hearts;i++){
    if (posx[i]>width+100 || posy[i]>height+120 || posx[i]<-80 || posy[i]<-20){
      reinitialise(i);
    }
    posx[i]+=direc[i];
    posy[i]=((0.3*(0.08*pow(posx[i]-initx,2)-direc[i]*20*(posx[i]-initx))))+500;

    heart((int)posx[i],(int)posy[i], pow(direc[i],2));

  }
  resetMatrix();
  fill(10,0,0); 
  time+=0.05;
  text("Me        You",130,120); //Insert names here! Adjust first figure to centre names around the beating heart
  heart(210,135,0.1*(sin(time%(2*PI))+1)+0.2);
}

void initialise(){
  for (int i=0;i<hearts;i++){
    direc[i]=1-(random(2));
    posx[i]=initx+random(10);
  }
}

void reinitialise(int i){
  direc[i]=1-random(2);
  posx[i]=initx+5-random(10);
}

void heart(int x,int y, float z){

  resetMatrix();
  translate(x,y-20);

  pushMatrix();
  
  scale(z);
  stroke(0); 
  fill(200,0,0);

  beginShape();
  vertex(pt1a.x,pt1a.y);
  bezierVertex(pt1c.x,pt1c.y, pt2c1.x, pt2c1.y, pt2a.x, pt2a.y);
  bezierVertex(pt2c2.x,pt2c2.y, pt3c.x, pt3c.y, pt3a.x, pt3a.y);
  bezierVertex(pt3c_ref.x, pt3c_ref.y, pt2c2_ref.x, pt2c2_ref.y, pt2a_ref.x, pt2a_ref.y);
  bezierVertex(pt2c1_ref.x, pt2c1_ref.y, pt1c_ref.x, pt1c_ref.y, pt1a.x, pt1a.y);
  endShape();

  popMatrix();
}



