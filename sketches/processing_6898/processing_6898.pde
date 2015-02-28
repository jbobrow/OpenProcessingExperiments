
class Spiral {
  float theta = 0;   
  PGraphics pg = createGraphics(640,480,P3D);
  float ellipseDiaF;   
  float vx = random(10,15);
  int dots = int(random(50,1000));
  float vx1 = vx;
  float vx2 = 0;
  float vy = random(10,15);
  float vy1 = vy;
  float vy2 = 0;  
  float xadd = random(30,610);
  float yadd = random(30,450);
  float thetaInc = 137.5;
  boolean reset = false;
  int count=0;   //a counter
  int count2 = 0;
  int count2Max =int(random(40,90));
  float[] pathX = new float[0];
  float[] pathY = new float[0];
  
  Spiral(){   //constructor
    this.ellipseDiaF = random(1.5,3);    
  }

  void draw() {   
    if(count2<count2Max){
      if(count<=dots){ 
      pg.beginDraw();
      pg.smooth();
      pg.noStroke(); 
      float r = sqrt(radians(theta));
      float x = r*sin(radians(theta))+(xadd);
      float y = r*cos(radians(theta))+(yadd);   
        pg.fill(160,203,247,170);   
        pg.ellipse(x,y,this.ellipseDiaF,this.ellipseDiaF);   
        theta = theta+thetaInc;
        count++;
      pg.endDraw();      
      }
      else{
        if(count%dots==1){  
           theta = 0; 
           dots = int(random(40,360));
           pathX = append(pathX,xadd);
           pathY = append(pathY,yadd);           
           float r = sqrt(radians(theta));        
           float x = r*sin(radians(theta))+(xadd);
           float y = r*cos(radians(theta))+(yadd);           
           this.ellipseDiaF = random(1.5,3);
           thetaInc = 137.5;
//           int thetaSel = int(random(0,2));
//           if(thetaSel==1){
//             thetaInc = thetaInc+0.5;
//           }
//           else{
//             thetaInc = thetaInc-0.5;           
//           }  
           count = 0;
           vx = vx1+vx2;           
           if(xadd<0||xadd+vx+30>width){ //30 to account for size
              vx = -vx;
              vx1 = -vx1;
              vx2 = -vx2;
           }
//           else{
//              vx = vx1+vx2; 
//           }  
//           if(yadd<0||yadd+vy>height){
//              vy = -vy;            
//           } 
           vy = vy1+vy2;
           if(yadd<0||yadd+vy+30>height){ //30 to account for size of spiral
              vy = -vy;
              vy1 = -vy1;
              vy2 = -vy2;
           }
  
           //println(vx);
           if(abs(vx)>=300){
             vx=random(10,15);
             vx1=vx;
             vx2=0;  
           }
           if(abs(vy)>=300){
             vy=random(10,15);
             vy1=vy;
             vy2=0;  
           }           
           xadd = xadd+vx;
           yadd = yadd+vy;
           pg.smooth();
           pg.stroke(160,203,247,130);
           pg.strokeWeight(0.25);
           for(int i=pathX.length-1;(abs(pathX.length-1-i)<=5)&&i>=0;i--){
             pg.line(pathX[i],pathY[i],xadd,yadd);
           }
           vx1 = vx;
           vx2 = vx1;
           vy1 = vy;
           vy2 = vy1;           
           count2++;  
           if(this.reset==true){
             pg.background(0);
             this.reset = false;
             this.count2 = 0;
             for(int i = 0;i<=pathX.length;i++){
               pathX = shorten(pathX);
               pathY = shorten(pathY);
             }
             count2Max =int(random(40,90));  
           }           
        } 
        
      }
        image(pg,0,0);  //now draw the image
    }    
  }

  void reset(){
      this.reset = true;  
  }  
}




