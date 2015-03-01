
float [] xpos = new float[100];
float [] ypos= new float[100];
float[] rxpos= new float [600];
float[] rypos= new float[600];

void setup(){
  size(600,600);
   for (int i= 0; i<xpos.length; i++){
    ypos[i]=0;
    ypos[i]=0;
  }
}

void draw(){
  fill(255);
  background (0);
  
  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;
  
  for(int i=0; i<xpos.length-1;i++) {
    xpos[i]=xpos[i+1];
    ypos[i]=ypos[i+1];
  }
  

  for (int i= 0; i<xpos.length-1;i++){
    float r=map(i,0,xpos.length,0,255);
    float g=map(i,0,xpos.length,100,200);
    float b=map(i,0,xpos.length,230,10);
    fill(r,g,b);
    float circleX=random(xpos[i]);
    float circleY=random(ypos[i]);
    stroke(b,r,g,random(200));
    line(circleX, circleY,xpos[i], ypos[i]);
    ellipse(circleX, circleY,20,20);
    fill(125,253,254,160);
    ellipse(xpos[i], ypos[i],sin(xpos[i])*50,10);
    rect(xpos[i]+random(-50,50),ypos[i]+random(50),sin(xpos[i]), ypos[i]*0.1);
  }
    for (int i=0;i<xpos.length-1;i++){
    float c=map(i,0,xpos.length,0,255);
    fill(c);
    rect(xpos[i],300,10,sin(ypos[i])*200);
  }
     if (keyPressed) {
    if (key == 's') {
      saveFrame("screen-#####.jpg");
    }
     }
  
}  


