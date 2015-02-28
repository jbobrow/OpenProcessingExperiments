
class Ant {
  //index in the antArray
  int index;
  int frames;
  //frequency
  int frequency=floor(random(1,8));
  //speed
  float vx,vy;
  //used when turning
  int countRot=10;
  float dvx=.1;
  float dvy=.1;
  //randomly starts and stops motion
  int leng=floor(random(200,500));
  int start=floor(random(leng/4));
  int stop=floor(random(.8*leng,leng));
  //random placement
  float x,y;
  //parts colors
  int col=color(floor(random(255)), floor(random(255)), floor(random(255)));//,floor(random(50,255)));
  int colT=color(floor(random(255)), floor(random(255)), floor(random(255)),floor(random(50,255)));
  int colH=color(floor(random(255)), floor(random(255)), floor(random(255)),floor(random(50,255)));
  //cycles from 0 to 5, used for walk cycle
  int cycle=0;
  //width and length
  float l,w,ech,legLength,footDiameter;
  //direction
  float a=random(2*PI);
  float dva;
  //flags
  //moves
  boolean motion=false;
  //turns
  boolean turns=false;

//constructor
  Ant(int Index) {
    index=Index;
    l=random(10, 30);
    ech=l/2;
    w=l*random(1, 3);
    legLength=l*random(1,1.5);
    footDiameter=l/5;
    vx=ech;
    vy=ech;
    x=random(.2*width, .8*width);
    y=random(.2*height, .8*height);
    while(collisionTest(index))y=random(.2*height, .8*height);
  }
//display function called by main draw loop
  void display() {
    frames=(frameCount*floor(max(abs(vx),abs(vy)))/(frequency));
    cycle=(frameCount/frequency)%6;
    //each time ant restarts, speed is randomized
    if (frameCount%stop==start) {
      dva=random(-PI/10,PI/10);  
      turns=true;
      countRot=0;
    }
    //ant stops
    if(frameCount%(start+stop)==0) {
      motion=false;
    }
    
    //everytime direction changes
    if(turns&&frameCount%frequency==0){
       countRot++;
       //println(a);
       a+=dva;
       if(countRot==20){
         a=a%(2*PI);
         turns=false;
         motion=true;
         countRot=0;
         //frequency=floor(random(1,8));
      }
     }
    //movement
    if (motion&&(frameCount/2)%frequency==0) {
        x+=vx*cos(a);
        y+=vy*sin(a);
        collisionTest(nbeAnts);
        //out of window test
      if(x<0 || x>width){     
        x-=vx*cos(a);
        //vx=-vx;
        dva=((PI-2*a)%(2*PI))/20;
//        println(a+" "+(a+20*dva));
//        noLoop();
        turns=true;
        motion=false;
        countRot=0;
      }
      if(y<0 || y>height){        
        y-=vy*sin(a);        
        dva=-a/10;
//        println(a+" "+(a+20*dva));
//        noLoop();
        turns=true;
        motion=false;
        countRot=0;
      }
     }
     
     //draw the different parts
     drawParts();     
  }
  
  Boolean collisionTest(int Index){
    //collision test
    
      for(int i=0;i<Index;i++){
        if(antArray[i]!=this){
          if(dist(antArray[i].x,antArray[i].y,x,y)<.8*(w+antArray[i].w)){
            x-=vx*cos(a);
            y-=vy*sin(a);
            //dva=((a+PI-antArray[i].a)%2*PI)/20;
            dva=PI/20;
//            println(a+" "+antArray[i].a+" "+(a+20*dva));
//             noLoop();
            turns=true;
            motion=false;
            countRot=0;
            return true;
          }
        }
      }
      return false;
  }
   void drawParts(){
    int isMotion=int(motion||turns);
    pushMatrix();
    //placement orientation du corps
    translate(x, y);
    rotate(a);
    
    //legs
    pushMatrix();
    rotate(-.7+.7*int(cycle==3)*isMotion);
    line(0,0,0,legLength);
    ellipse(0,legLength,footDiameter,footDiameter);
    popMatrix();
    pushMatrix();
    rotate(-.2+.7*int(cycle==1)*isMotion);
    line(0,0,0,legLength);
    ellipse(0,legLength,footDiameter,footDiameter);
    popMatrix();
    pushMatrix();
    rotate(.3+.7*int(cycle==5)*isMotion);
    line(0,0,0,legLength);
    ellipse(0,legLength,footDiameter,footDiameter);
    popMatrix(); 
    pushMatrix();
    rotate(.7-.7*int(cycle==0)*isMotion);
    line(0,0,0,-legLength);
    ellipse(0,-legLength,footDiameter,footDiameter);
    popMatrix();
    pushMatrix();
    rotate(.2-.7*int(cycle==4)*isMotion);
    line(0,0,0,-legLength);
    ellipse(0,-legLength,footDiameter,footDiameter);
    rotate(-.5-.7*int(cycle==2)*isMotion);
    line(0,0,0,-legLength);
    ellipse(0,-legLength,footDiameter,footDiameter);
    popMatrix();    
    fill(col);
    ellipse(0, 0, l/2, l/2);
//    noFill();
//    ellipse(0, 0, 2*w, 2*w);
    //head
    fill(colH);
    ellipse(l/2+l/4, 0, l, l);
    //abdomen
    fill(colT);
    ellipse(-w/2-l/4, 0, w, l);
    //eyes
    fill(255);
    ellipse(l, l/5, l/4, l/4);
    ellipse(l, -l/5, l/4, l/4);
    fill(0);
    ellipse(l, l/5, l/10, l/10);
    ellipse(l, -l/5, l/10, l/10);
    //antennas
    if(motion){
      line(1.2*l,l/5,1.7*l,l/2);
      line(1.2*l,-l/5,1.7*l,-l/2);
    }
    else{
      line(1.2*l,l/5,1.7*l,(2-sin(frames/4))*l/5);
      line(1.2*l,-l/5,1.7*l,(sin(frames/4)-2)*l/5);
    }
    popMatrix();
    }
  }
void mouseReleased(){
  loop();
}

