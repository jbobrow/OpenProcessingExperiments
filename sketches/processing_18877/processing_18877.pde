
  
  PShape s;
  
  float pushx = 90;
  float pushy = 10;
  float biggest = 3;
  float scaler = 0;
  
  void setup()
  {
    size(640,480);
    smooth();
    shapeMode(CENTER);
    s = loadShape("eyesDETAIL.svg");
  }
  
  void draw(){
    
    scaler = map(mouseX, 0 , 5, 0,640);
    println(scaler);
  
  background(255);
  

  shape(s,width/2 ,height/2, scaler*4, scaler*3);
  shape(s,width/2 ,height/2 , scaler*4/8, scaler*3/8);
  shape(s,width/2 ,height/2 , scaler*4/8/8, scaler*3/8/8);
  shape(s,width/2 ,height/2 , scaler*4/8/8/8, scaler*3/8/8/8);
  shape(s,width/2 ,height/2 , scaler*4/8/8/8/8, scaler*3/8/8/8/8);
  shape(s,width/2 ,height/2 , scaler*4/8/8/8/8/8, scaler*3/8/8/8/8/8);
  shape(s,width/2 ,height/2 , scaler*4/8/8/8/8/8/8, scaler*3/8/8/8/8/8/8);
  shape(s,width/2 ,height/2 , scaler*4/8/8/8/8/8/8/8, scaler*3/8/8/8/8/8/8/8);
  shape(s,width/2 ,height/2 , scaler*4/8/8/8/8/8/8/8/8, scaler*3/8/8/8/8/8/8/8/8);
  shape(s,width/2 ,height/2 , scaler*4/8/8/8/8/8/8/8/8/8, scaler*3/8/8/8/8/8/8/8/8/8);
  shape(s,width/2 ,height/2 , scaler*4/8/8/8/8/8/8/8/8/8/8, scaler*3/8/8/8/8/8/8/8/8/8/8);
  shape(s,width/2 ,height/2 , scaler*4/8/8/8/8/8/8/8/8/8/8/8, scaler*3/8/8/8/8/8/8/8/8/8/8/8);
  shape(s,width/2 ,height/2 , scaler*4/8/8/8/8/8/8/8/8/8/8/8/8, scaler*3/8/8/8/8/8/8/8/8/8/8/8/8);
  shape(s,width/2 ,height/2 , scaler*4/8/8/8/8/8/8/8/8/8/8/8/8/8, scaler*3/8/8/8/8/8/8/8/8/8/8/8/8/8);


  
  //stroke(255,0,0);
  //line(width/2,0,width/2,height);
  //line(0,height/2,width,height/2);
  
  
  
  //shape(s, 640, 480, 250 , 250);
  
  
  //shape(s, 240, 240, 15, 11);
  
  
  }
  
  


