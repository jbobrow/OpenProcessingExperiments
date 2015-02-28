

float[][] points;
float xinc = .0001;
float yinc = .0001;

void setup(){
  size(500,500);
  frameRate(30);
  background(255,100);
  stroke(20,20,20,18);
  smooth();
  //mesh(width/3,r,t);
}

void draw(){
  fill(255,220);
  //filter(BLUR);
  rect(0,0,width,height);
  mesh(width/5,xinc,yinc);
  xinc += .0002;
  yinc += .0002;
}



void mesh(int max, float xinc, float yinc){
  //setup of variables
  int i = 0;
  int j= 0;
  float noiseX = 4;
  float noiseY = 5;
  float maxX =MIN_FLOAT;
  float minX =MAX_FLOAT;
  float maxY =MIN_FLOAT;
  float minY =MAX_FLOAT;
  points = new float[max][2];
  ellipseMode(RADIUS);
   
  //assign a value to all points
  for (i=0;i<max;i++){
   points[i][0]= noise(noiseX)*width;
   points[i][1]= noise(noiseY)*height;
   noiseX += xinc;
   noiseY += yinc;
  }






 //determine min and max values for X and Y
  for (i=0;i<max;i++){
    if(points[i][0]>maxX){
      maxX = points[i][0]; 
    }
    else if(points[i][0]<minX){
      minX = points[i][0]; 
    }
    if(points[i][1]>maxY){
      maxY = points[i][1]; 
    }
    else if(points[i][1]<minY){
      minY = points[i][1]; 
    }

  }



  for (i=0;i<max;i++){
    points[i][0]= map(points[i][0],minX,maxX,0,width);
    points[i][1]= map(points[i][1],minY,maxY,0,height);
    pushStyle();
    noStroke();
    fill(19,71,146,25);
    float radius = ((points[i][0]-width/4)*(points[i][1]-height/4))/(points[i][0]+points[i][1]);
    ellipse(points[i][0],points[i][1],radius,radius);
    popStyle();
  }




  float startX,startY,endX,endY,len;
  //stroke(0,18);
  strokeWeight(1);
  stroke(25,25);
  for(i=0; i<max; i++)
  {
    for (j=0;j<max;j++){
      startX = points[i][0];
      endX = points[i][1];
      startY = points[j][0];
      endY = points[j][1];
      //len is the distance between point[i] and point[j]
      len = sqrt(sq(startX-startY)+sq(endX-endY));
      if (len < width/8){
        line( startX, endX, startY, endY );
      }
    }
  }

  //Circles that identify points
  stroke(0);
  strokeWeight(2);
  for(i=0; i<max; i++)
  {  
    ellipse(points[i][0],points[i][1],2,2);
  }


}



















