
// **Created by Aparna J. Nambiar
//A combination of animations. Two animations hve been taken from http://www.openprocessing.org/sketch/14070
//and http://www.openprocessing.org/sketch/14070.
  ArrayList points = new ArrayList();
  Boolean md = false;
  Boolean permanantMDKill = false;
  Leaf[] leaves; 

  int rad=20;
  float incVal;
  float angle = 0.0f;
  float sign = 0.0f;
  float swingAngle = 175.0f;
  float timePeriod = .3f;
  float lengthOfPendulum = 120;
  int pend_radius=10;
  boolean startIncrease = false;
  boolean runPendulum=true;
  boolean runDarkness=true;
  boolean runSpiral=false;
  boolean runCircles=false;
  boolean runLeaves=false;
  boolean boolClear=false;
  int angleCount=0;
  int clearCount =0;
  int darknessCount=0;
  int spiralCount=0;
  int count = 4000;
  int colour=0;
  int direction=1;
  int spiralFrames=0;

  float t = 0, dt = 0.01f;
  float spinSpeed = 75 * 0.01f/dt;
  
  int seed;
  PFont font = createFont("",72);

  public void setup(){
    
    screenHeight=500;
    screenWidth=800;
    size(screenWidth,screenHeight);
    colorMode(RGB, 255, 10, 10, 10);
//    background(255);
    smooth();
    background(0xffffffff);
    

    leaves=new Leaf[15];
    for(int i=0; i<leaves.length; i++) {
     leaves[i] = new Leaf("leaf.jpg", i*10);
   }

    
    incVal=(255/(screenWidth/7));
//    pend_radius=80;
    seed = (int) random(2531, 15824);
    textFont(font,36);
 
 }

  public void draw(){
    spiralCount++;   
    if(md){
      for(int f=0; f<500; f+=1){
        points.add(new Point(random(0,width),random(0,height)) );
        if(points.size()==5000){
          angleCount =0;
        }
      }
    }
    noiseDetail(8,0);
    for(int i=points.size()-1; i>0; i--){
      Point p = (Point)points.get(i);
      if(points.size()<5000){
        p.updateNormal();
      }
      else{
        permanantMDKill = true;

      } 
    }

//  println(points.size());
    if(points.size()>5000){
      if(runPendulum){
        translate(width/2, 0);
        angle=angleCount++;
        if(angle > 0){
          sign = sin(angle*(timePeriod/2.0f));
  //      print(sign);
          rotate(radians(sign*angle)+HALF_PI);
          if (angle>130){
            startIncrease = true;
          }
          if(startIncrease){
            lengthOfPendulum+=3;
            if(lengthOfPendulum>600){
              runPendulum=false;
            }
            if(angle%5==0){
              pend_radius+=3;
            }  
          }
          drawPendulum();
        } else {
          delay(1500);
        }
      }
      else{
      darknessCount++;
//      print(darknessCount);
        if(runDarkness){  
          randomSeed(seed);
          for (int i = 0; i < count; i++) {
            particle(t);
          if(i==2000){
             clear(t);
            if (darknessCount==325){ //325
              runDarkness=false;
              runSpiral=true;
              boolClear=true;
              count=0;
            }
           }
          }
          t += dt;  
        }
      }
    if(boolClear){
      clear(spiralCount);
     clearCount++;
     if(clearCount==50){
       boolClear = false;
     }
    }
    if(runSpiral){
        spiralFrames++;
//        print(spiralFrames);
        translate(screenWidth/2,screenHeight/2);
        rotate(frameCount/20f);
        String onePart="00000000000000000000000000000000000000000000000000";
//        if(colour==255){
//          direction=-1;
//        }
//        if(colour==0){
//          direction=1;
//        }
//        colour+=direction;
//        print("||"+colour+"||");
        fill(colour);
        
        textFont(font,onePart.length());
        text(onePart,10,(onePart.length()*1));
        delay(10);
        if(spiralFrames>180){
          runSpiral=false;
          runCircles=true;
        }
    }  
    if(runCircles){
      fill(incVal*count);
//      print("||"+incVal*count+"||");
      ellipse(screenWidth/2, screenHeight/2,rad,rad);
      print("||"+rad+"||");
      rad+=5;
      count++;
      if(rad==800){
        runCircles=false;
        runLeaves=true;
        delay(100);
      }
    }
    if(runLeaves){
//      print("Inside");
      rect(0,0,screenWidth,screenHeight);
      for(int i=0; i<leaves.length; i++) {
        leaves[i].falling();
       }

    }
      delay(100);
    }
  }


public void drawPendulum()
{
  // draw line
  stroke(0);
  strokeWeight(2);
  line(0, 0, lengthOfPendulum, 0);

  // draw circle
  fill(0);
  stroke(0);
  strokeWeight(10);
  ellipse(lengthOfPendulum, 0, pend_radius, pend_radius);
  
}

public void mousePressed(){
  if(!permanantMDKill){
  md = true;
  }
}
public void mouseReleased(){
  md = false;
}
public void keyPressed(){
  background(255);
  noiseSeed(round(random(1000)));
  for(int i=points.size()-1; i>0; i--){
    Point p = (Point)points.get(i);
    //p.x = random(width);
    //p.y = random(height);
    points.remove(i);
  }
  //saveFrame("perlin####.png");
}

public void particle(float t) {
   
  float x = random(-1, 1);
  float y = random(-1, 1);
  float r = dist(0, 0, x, y);
  float a = atan2(y, x);
  
  float xx = x * cos(t - y);
  float yy = sin(y * t);
  float rr = dist(0, 0, xx, yy);
  float aa = atan2(yy, xx);
  
  float mx = map(mouseX, 0, width, -1, 1);
  float my = map(mouseY, 0, height, -1, 1);
  
  stroke(
    (aa - a + TWO_PI * 100) % TWO_PI,
    1,
    1 * 0,
    0.1f + 0.1f * cos(aa + t)
  );
  
  float d;
  //d = abs(8 - 5 * dist(mx, my, xx, yy));
  d = 1 + 5 * dist(xx, yy, 0, 0);
  strokeWeight(d);
  
  float spin = random(-spinSpeed, spinSpeed) * t + random(0, PI);
  
  float px = map(xx, -1, 1, 0, width);
  float py = map(yy, -1, 1, 0, height);
  stroke(0);
  line(
    px - d * cos(spin),
    py - d * sin(spin),
    px + d * cos(spin),
    py + d * sin(spin)
  );
}

public void clear(float t) {
  noStroke();
//  fill(t/3 % TWO_PI, 0.05f, 1, 0.05f);
  fill(250,1);
  rect(0, 0, width, height);
}


class Point {
 public float x,y,xv = 0, yv = 0;
 float maxSpeed = 3000000;

 Boolean finished = false;

 Point(float x, float y){
  this.x = x;
  this.y = y;
} 

public void updateNormal(){
  stroke(0,16);
  float r = random(1);
  this.xv = cos(  noise(this.x*.01f,this.y*.01f)*TWO_PI  );
  this.yv = -sin(  noise(this.x*.01f,this.y*.01f)*TWO_PI  );

  if(this.x>width){
      //this.x = 1;
    this.finished = true;
  }
  else if(this.x<0){
      //this.x = width-1;
    this.finished = true;
  }
  if(this.y>height){
      //this.y = 1;
    this.finished = true;
  }
  else if(this.y<0){
      //this.y = height-1;
    this.finished = true;
  } 

  if(this.xv>maxSpeed){
    this.xv = maxSpeed;
  }
  else if(this.xv<-maxSpeed){
    this.xv = -maxSpeed;
  }
  if(this.yv>maxSpeed){
    this.yv = maxSpeed;
  }
  else if(this.yv<-maxSpeed){
    this.yv = -maxSpeed;
  }

  this.x += this.xv;
  this.y += this.yv;
  stroke(1,1);
  line(this.x+this.xv, this.y+this.yv,this.x,this.y );
}

public void updateMoveToCenter(){
//        if(this.x<400&&this.y<300){
//          this.xv=+10;
//          this.yv=+10;
//        }
//        if((this.x<400)&&(this.y==300)){
//            this.xv=+10;
//        }
//        if((this.x<400)&&(this.y>300)){
//            this.xv=+10;
//            this.yv=-10;
//        }
//        if((this.x==400)&&(this.y<300)){
//            this.yv=+10;
//        }
//        if((this.x>400)&&(this.y>300)){
//            this.xv=-10;
//            this.yv=-10;
//        }
//        if((this.x>400)&&(this.y==300)){
//            this.xv=-10;
//        }
//        if((this.x>400)&&(this.y<300)){
//            this.xv=-10;
//            this.yv=10;
//        }
//        if((this.x==400)&&(this.y>300)){
//            this.yv=-10;
//        }
//
//      }
//      this.x +=   this.xv;
//      this.y +=   this.yv;
//      line(  this.x+  this.xv,   this.y+  this.yv,  this.x,  this.y );
//if(p.finished){
//          points.remove(i);
//        }
}

}

class Leaf{
  PImage image;
  int startTime;
  int counter;
  int x,y;
  boolean falling;
  
  Leaf(String fileName){
    counter=0;
    startTime=(int)random(0,500);
    image= loadImage(fileName);
    x=1;y=1;
    falling = false;
    
  }
    Leaf(String fileName, int stTime){
    counter=0;
    startTime=stTime;
    image= loadImage(fileName);
    x=(int)random(0,screenWidth-screenWidth/3);y=1;
    falling = false;
//    print(startTime);
  }

void falling(){
  
  if(startTime==counter){
    falling = true;
    counter =0;
  }
  counter++;
  if(falling){
//    print("falling"+ startTime);
  //rotate(-(counter*(TWO_PI/360)));
  if((counter%8)<4){
    x+=2+random(0,counter/10);
  }
  else{
    x+=2+random(-(counter/10),0);
  }
 
  y+=5;
  image(image, x,y,50,50);
 
  }
}
}




