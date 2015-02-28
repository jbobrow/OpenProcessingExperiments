
float []x={200,200,200,200,200,200,200};
float []y={50,100,150,200,250,300,350};
float []speed={1,-1,1,-1,1,-1,1};
color red=color(250,0,0);
color green=color(0,250,0);
color blue=color(0,0,250);
color yellow=color(250,250,0);
color pink=color(255,240,245);
color lightBlue=color(175, 238, 238);
color grey=color(30);
color []col={red,green,blue,yellow,pink,lightBlue,grey};

void setup(){  
  size(400,400);
  rectMode(CENTER);
}

void draw(){
  backgroundColor();
  drawFigure();
  moveFigure();
  fill(0);
  rect(width/3,height/2,40,height);
  rect(width*2/3,height/2,40,height);
}

void backgroundColor(){
  fill(200,0,0);
  rect(width/2,height/2,400,400);
  fill(0,200,0);
  rect(width/2,height/2,100,height);
}

void drawFigure(){
  for(int i=0; i<x.length; i++){
    if (i!=x.length-1){
    strokeWeight(3);
    line(x[i],y[i],x[i+1],y[i+1]);}
    strokeWeight(0);
    fill(col[i]);
    ellipse(x[i],y[i],30,30);
    if(x[i]>width/3 && x[i]<width/3*2)
    rect(x[i],y[i],30,30);
    else if(x[i]>width/3*2)
    ellipse(x[i],y[i],30,30);
    

  }
}


void moveFigure(){
  for(int i=0; i<x.length; i++){
 //you want to odo it to all the for loops  
  if(x[i]<width && x[i] >= 0 ){
    x[i]=x[i]+speed[i];
  }
  else if(x[i] >= width){
    x[i]=200;
    x[i]=x[i]+speed[i];
  }
  else if( x[i] < 0){
    x[i]=200;
    x[i]=x[i]+speed[i];
  }

  
 }  
}


