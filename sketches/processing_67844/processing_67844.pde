
class DisplayItems{
  float nInc = 0;
  int n;
  PFont font;
  
  DisplayItems(int gi){
    n = gi;
    font = loadFont("ArialMT-48.vlw");
    textFont(font, 20); 
  }
  
  void DrawCross(){
    stroke(0, 50);
    strokeWeight(1);
    line(0, -gh / 2, 0, gh / 2);
    line(-gw / 2, 0, gw / 2, 0);  
  }

  void DrawGrid(){
    stroke(0, 12.5);
    strokeWeight(1);
    for(int i=0; i<=n; i+=1){
      int hx = -gw / 2 + ((gw / n) * i);
      int hy = gh / 2;
      int vx = gw / 2;
      int vy = -gh / 2 + ((gh / n) * i);
      line(hx, -hy, hx, hy);
      line(-vx, vy, vx, vy);
    } 
  }
  
  void DrawGridPoints(){
    stroke(0, 25);
    strokeWeight(5);

    for(int i=0; i<=n; i+=1){
      for(int j=0; j<=n; j+=1){
        int x = -gw / 2 + ((gw / n) * i);
        int y = -gh / 2 + ((gh / n) * j);
        point(x, y);
      }
    } 
  }

  void DrawTime(){
    fill(0);
    text(millis(), -sw/2 + 5, -sh/2 + 20);
  }

}


