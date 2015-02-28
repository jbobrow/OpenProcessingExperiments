
int bt = 20;
int i;

float[] xp=new float[bt];
float[] yp=new float[bt];

float col1=random (255);
float col2=random (255);
float col3=random (255);
 
void setup(){
  size(1200,1200);
  for(int i=0; i<bt; i++){
    xp[i]=((width/2)-150);
    yp[i]=((height/2)-172.5);
  }
}

void draw(){
  background(255);
  for(int i=0; i<bt; i++){
    xp[i] += random(-20,20);
    yp[i] += random(-20,20);
    fill(254,255,44);
    stroke(0);
    strokeWeight(2);
    quad(xp[i],yp[i],xp[i]+300,yp[i],xp[i]+275,yp[i]+250,xp[i]+25,yp[i]+250);
    strokeWeight(0);
    fill(213,216,20);
    ellipse(xp[i]+50,yp[i]+30,20,40);
    ellipse(xp[i]+30,yp[i]+60,15,30);
    ellipse(xp[i]+260,yp[i]+40,20,30);
    ellipse(xp[i]+50,yp[i]+210,20,40);
    ellipse(xp[i]+70,yp[i]+230,10,20);
    ellipse(xp[i]+250,yp[i]+200,15,30);
    ellipse(xp[i]+220,yp[i]+220,20,30);
   
    if (xp[i]<0){
      xp[i]=10;
    }
    if (xp[i]>width-300){
      xp[i]=width-310;
    }
    if (yp[i]<0){
      yp[i]=10;
    }
    if (yp[i]>height-345){
      yp[i]=height-355;
    }
   
    strokeWeight(2);
    stroke(0);
    fill(255,255,255);
    ellipse(xp[i]+100,yp[i]+100,100,100);
    ellipse(xp[i]+200,yp[i]+100,100,100);
    fill(65,178,237);
    strokeWeight(3);
    ellipse(xp[i]+120,yp[i]+100,35,35);
    ellipse(xp[i]+180,yp[i]+100,35,35);
    fill(0,0,0);
    strokeWeight(2);
    ellipse(xp[i]+120,yp[i]+100,12.5,12.5);
    ellipse(xp[i]+180,yp[i]+100,12.5,12.5);
    
    strokeWeight(3);
    noFill();
    arc(xp[i]+150,yp[i]+150,200,75,0,PI);
    strokeWeight(2);
    fill(255,255,255);
    quad(xp[i]+120,yp[i]+185.5,xp[i]+142.5,yp[i]+187,xp[i]+142.5,yp[i]+209.5,xp[i]+119,yp[i]+208);
    quad(xp[i]+160,yp[i]+187,xp[i]+182.5,yp[i]+185.5,xp[i]+182.5,yp[i]+208,xp[i]+160,yp[i]+209.5);
    
    fill(254,255,44);
    strokeWeight(2);
    arc(xp[i]+150,yp[i]+125,25,30,PI-QUARTER_PI,TWO_PI+QUARTER_PI);

    strokeWeight(2);
    stroke(0,0,0);
    fill(255,255,255);
    rect(xp[i]+25,yp[i]+250,250,75);
    fill(191,132,13);
    rect(xp[i]+25,yp[i]+285,250,40);
    rect(xp[i]+75,yp[i]+325,50,20);
    rect(xp[i]+175,yp[i]+325,50,20);
    fill(0,0,0);
    rect(xp[i]+40,yp[i]+295,35,7.5);
    rect(xp[i]+90,yp[i]+295,35,7.5);
    rect(xp[i]+175,yp[i]+295,35,7.5);
    rect(xp[i]+225,yp[i]+295,35,7.5);
    fill(255,255,255);
    triangle(xp[i]+142.5,yp[i]+250,xp[i]+125,yp[i]+265,xp[i]+95,yp[i]+250);
    triangle(xp[i]+162.5,yp[i]+250,xp[i]+180,yp[i]+265,xp[i]+210,yp[i]+250);
    
    fill(col1,col2,col3);
    beginShape();
    vertex(xp[i]+137.5,yp[i]+250);
    vertex(xp[i]+162.5,yp[i]+250);
    vertex(xp[i]+157.5,yp[i]+260);
    vertex(xp[i]+142.5,yp[i]+260);
    endShape();
    beginShape();
    vertex(xp[i]+142.5,yp[i]+260);
    vertex(xp[i]+157.5,yp[i]+260);
    vertex(xp[i]+165,yp[i]+295);
    vertex(xp[i]+150,yp[i]+310);
    vertex(xp[i]+135,yp[i]+295);
    endShape();    
  }
}
  
void mousePressed(){
  col1=random (255);
  col2=random (255);
  col3=random (255); 
}



