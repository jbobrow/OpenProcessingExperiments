
color catchColor = color(0);

int[] x = new int[6];
int[] y = new int[6];
  

void setup() {
  size(763,758);
  background(0);
  stroke(0);
  strokeWeight(11);
  colorMode(RGB);
  
  x[0]=85;
  x[1]=183;
  x[2]=282;
  x[3]=476;
  x[4]=599;
  x[5]=722;
  
  y[0]=85;
  y[1]=281;
  y[2]=475;
  y[3]=573;
  y[4]=667;
  y[5]=723;
  
}

void draw() {

  if(mousePressed){
    background(catchColor);
    for(int i=0; i<6; i++){
      x[i] -= random(7);
      if(x[i] < 0) 
        x[i] = width;
    }for(int l=0; l<6; l++){    
      y[l] -= random(7);
      if(y[l] < 0)
        y[l] = height; 
    }
  }else {
    background(catchColor);
    catchColor = color(random(255),random(255),random(255));
  }
  
  
  noStroke();
  fill(255,220,0);
  rect(x[3],0,x[5]-x[3],y[1]);
  rect(0,y[3],x[0],height);
  fill(255,0,0);
  rect(x[0],y[0],x[3]-x[0],y[2]-y[0]);
  rect(x[5],y[3],width-x[5],height-y[3]);
  fill(0,0,30);
  rect(x[0],y[2],x[2]-x[0],y[4]-y[2]);
  rect(x[2],y[4],x[3]-x[2],y[5]-y[4]);
  fill(0,0,255);
  rect(x[3],y[3],x[5]-x[3],y[5]-y[3]);
  stroke(0);
  
  //Make Grids
  line(0,y[0],x[5],y[0]);
  line(0,y[1],x[0],y[1]);
  line(x[3],y[1],x[5],y[1]);
  line(0,y[3],x[0],y[3]);
  line(x[2],y[3],width,y[3]);
  line(x[5],0,x[5],height);
  line(x[0],y[0],x[0],height);
  line(x[1],0,x[1],y[0]);
  line(x[3],0,x[3],y[5]);
  line(x[0],y[2],x[5],y[2]);
  line(x[0],y[4],x[3],y[4]);
  line(x[2],y[2],x[2],height);
  line(x[4],y[1],x[4],y[2]);
  line(x[2],y[5],x[5],y[5]);
 
}




