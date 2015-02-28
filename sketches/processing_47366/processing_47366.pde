
//float data[]={101.4, 101.2, 101.0,100.9,100.6,100.6,100.5,100.3,100.3,99.9,99.8,99.7,
//9.7,99.6,99.6,99.4,99.4,99.3,99.2,99.2,99.2,99.1,99.1,98.9,98.8,98.7,98.7,98.6,98.5,98.3,98.2,
//98.0,97.8,97.5,97.4,97.3,97.0,96.9,96.7,96.3,95.9,95.5,95.3,94.9,94.9,94.9,94.8,93.8,91.2};
PImage boob;
PImage cloud;
  
  void setup(){
    size(1000,600);
   

    smooth();
    cloud=loadImage("clouds.jpg");
    boob=loadImage("titty.png");
    imageMode(CENTER);
    
    mapVis();
    //background(0);
  }  
  
  void draw(){
    cloud=loadImage("clouds.jpg");
  
  }
    
    void mapVis(){
       image(cloud,width/2, height/2, width, height);
  String[] data = loadStrings("boobstownUSA.tsv");
  for(int i = 0; i < data.length; i++){
    String[] pieces = split(data[i],TAB);
    float x = parseFloat(pieces[1]);
    float y = parseFloat(pieces[2]);
    
    //float boobSize = map(y,94,100,10,20);
    
    y = map(y,94,101,100,200);
    y = height -y;
    x = map(x, 40, 100, 0, 1000);
    println(x);
    //y = map(x, 0, 100, 100, 500);
    fill(255);
    ellipse(x,y,10,10);
    fill(0,70);
    text(pieces[0],x,y);
    image(boob, x, y);
    //image(
  }
    
    
   text("IQ Levels",0,300);
  text("Percentage of Women Who Breastfeed", 500,580);
  }

