
class Circle{
  
  float x;
  float y;
  int diam;
  float changeX;
  float changeY;
  color Color;
  String sound;
  
  public Circle(float g, float h, float g2, float h2, int d, String s){
    
    x=g;
    y=h;
    changeX=g2;
    changeY=h2;
    diam = d;
    
    if(s=="red"){
      Color = color(255,0,0,102);
      sound = "sound1";
    }
    else if(s=="orange"){
      Color = color(255,122,0,102);
      sound = "sound2";
    }
    else if(s=="yellow"){
      Color = color(255,255,0,102);
       sound = "sound3";
    }
     else if(s=="green"){
      Color = color(0,255,0,102);
       sound = "sound4";
     }
    else if(s=="blue"){
      Color = color(0,255,255,102);
       sound = "sound5";
    }
    else if(s=="indigo"){
      Color = color(0,0,255,102);
       sound = "sound6";
    }
    else if(s=="violet"){
      Color = color(255,0,255,102);
       sound = "sound7";
    }
    else{
      Color = color(255,102);
       sound = "sound8";
    }
  
  }
  
}

